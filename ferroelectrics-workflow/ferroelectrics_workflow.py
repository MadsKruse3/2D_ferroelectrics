"""
Workflow for ferroelectrics in C2DB.
The workflow is factored into the following components:

  - Relaxation (to a precesion of 0.001 eV/Å).
  - Checking that the polar structure is still polar after relaxation.
  - A recipe that computes the Polarization along a
    linearly interpolated path between
    a polar and a non-polar structure.
  - A recipe that performs a NEB(Nudged elastic band) calculation with the
    linearly interpolated path as a starting point for every
    material where the polarization recipe has run succesfully.
  - A recipe that computes the polarization along the path obtained
    from the NEB calculation.
  - A groundstate calculation for the centrosymmetric structure.
    This is needed for the subsequent phonon calculation (see below).
  - Phonon calculations for the centrosymmetric structure of materials
    for which polarization calculations are performed.
"""

import os
from pathlib import Path

from myqueue.task import task as mqtask
from myqueue.task import State

from asr.core import read_json

from ase.io import read

VERBOSE = False


def neb_path(folder):
    tasks = []
    if os.path.exists(f'{folder}/results-asr.polarization_path.json'):
        data = read_json(f'{folder}/results-asr.polarization_path.json')
        data = getattr(data, 'data')
        restart = 5
        tasks += [task("asr.neb_path",
                       resources="48:2d",
                       restart=restart,
                       folder=folder)]
    return tasks


def phonons_new(folder, subfolder):
    tasks = []
    if os.path.exists(f'{folder}/results-asr.polarization_path.json'):
        tasks += [task("asr.phonons_new",
                       resources="24:8h",
                       folder=subfolder)]
    return tasks


def relax_non_centrosymmetric_structure(folder):
    tasks = []
    if not os.path.exists(f'{folder}/results-asr.polarization_path.json'):
        tasks += [task("asr.relax --fmax 0.001 "
                       "--fixcell --dont-enforce-symmetry "
                       "--allow-symmetry-breaking",
                       resources="24:2d",
                       folder=folder)]
    return tasks


def relax_centrosymmetric_structure(folder, subfolder):
    tasks = []
    if not os.path.exists(f'{subfolder}/structure.json'):
        tasks += [task("asr.relax --fmax 0.001 "
                       "--fixcell --dont-enforce-symmetry "
                       "--allow-symmetry-breaking",
                       resources="24:2d",
                       folder=subfolder)]
    return tasks


def polarization_path(folder):
    tasks = []

    if not os.path.exists('results-asr.structureinfo.json'):
        return tasks

    if (not os.path.exists(
         "centrosymmetric_structure/results-asr.structureinfo.json")):
        return tasks

    polar_pointgroups = [1, 2, 3, 4, 6, "m", "mm2", "3m", "4mm", "6mm"]
    data_structure = read_json('results-asr.structureinfo.json')
    pointgroup = data_structure["pointgroup"]
    if pointgroup not in polar_pointgroups:
        return tasks

    atom = read('structure.json')
    stochiometry = len(atom.get_chemical_symbols())

    if stochiometry < 5:
        c = 24
        if ("results-asr.polarization_path.json"
                not in list(map(str, folder.iterdir()))):
            tasks += [task("asr.polarization_path",
                               resources=f"{c}:2d",
                               folder=folder)]

    if 4 < stochiometry < 8:
        c = 24
        if ("results-asr.polarization_path.json"
                not in list(map(str, folder.iterdir()))):
            tasks += [task("asr.polarization_path",
                               resources=f"{c}:2d",
                               folder=folder)]

    if 7 < stochiometry < 12:
        c = 24
        if ("results-asr.polarization_path.json"
                not in list(map(str, folder.iterdir()))):
            tasks += [task("asr.polarization_path",
                               resources=f"{c}:2d",
                               folder=folder)]

    if stochiometry > 11:
        c = 40
        if ("results-asr.polarization_path.json"
                not in list(map(str, folder.iterdir()))):
            tasks += [task("asr.polarization_path",
                               resources=f"{c}:2d",
                               folder=folder)]

    return tasks


def polarization_path2(folder):
    tasks = []
    atom = read('structure.json')
    stochiometry = len(atom.get_chemical_symbols())
    if stochiometry < 5:
        c = 24
        if ("results-asr.polarization_path2.json"
                not in list(map(str, folder.iterdir()))):
            tasks += [task("asr.polarization_path2 -neb_p True",
                               resources=f"{c}:2d",
                               folder=folder)]

    if 4 < stochiometry < 8:
        c = 24
        if ("results-asr.polarization_path2.json"
                not in list(map(str, folder.iterdir()))):
            tasks += [task("asr.polarization_path2 -neb_p True",
                               resources=f"{c}:2d",
                               folder=folder)]

    if 7 < stochiometry < 12:
        c = 24
        if ("results-asr.polarization_path2.json"
                not in list(map(str, folder.iterdir()))):
            tasks += [task("asr.polarization_path2 -neb_p True",
                            resources=f"{c}:2d",
                            folder=folder)
                      ]

    if stochiometry > 11:
        c = 40
        if ("results-asr.polarization_path2.json"
                not in list(map(str, folder.iterdir()))):
            tasks += [task("asr.polarization_path2 -neb_p True",
                           resources=f"{c}:2d",
                           folder=folder)
                      ]

    return tasks


def structureinfo_polar(folder):
    """Run structureinfo recipe on the newly relaxed structure"""
    tasks = []
    if os.path.exists(f'{folder}/results-asr.relax.json'):
        tasks += [task("asr.structureinfo",
                       resources="1:10m",
                       folder=folder)]
    return tasks


def structureinfo_subfolder(subfolder):
    """Run structureinfo recipe on the relaxed reference structure"""
    tasks = []
    if os.path.exists(f'{subfolder}/results-asr.relax.json'):
        if ("results-asr.structureinfo.json"
                not in list(map(str, subfolder.iterdir()))):
            tasks += [task("asr.structureinfo",
                           resources="1:10m",
                           folder=subfolder)]
    return tasks


def task(*args, **kwargs):
    """Get MyQueue task instance."""
    name = kwargs.get("name") or args[0]
    if "creates" not in kwargs:
        kwargs["creates"] = [f"results-{name}.json"]
    return mqtask(*args, **kwargs)


def all_done(list_of_tasks):
    """Determine if all tasks in list_of_tasks are done."""
    return (all([task.read_state_file() == State.done
                 for task in list_of_tasks]))


def return_tasks(tasks):
    """Wrap function for returning tasks."""
    if VERBOSE:
        print(get_cwd(), tasks)
    return tasks


def verbose_print(*args):
    """Only print if VERBOSE."""
    if VERBOSE:
        print(*args)


def get_cwd():
    """Get current working directory."""
    return Path('.').absolute()


def create_tasks():
    """Create MyQueue task list for the ferroelectric workflow.
    This workflow relies on a folder layout where the non-polar
    reference structure is in a subfolder named
    centrosymmetric_structure
    """
    tasks = []

    verbose_print(get_cwd())
    folder = Path('.')
    subfolder = Path('./centrosymmetric_structure')
    tasks += relax_non_centrosymmetric_structure(folder)
    tasks += relax_centrosymmetric_structure(folder, subfolder)
    if not all_done(tasks):
        return tasks
    tasks += structureinfo_polar(folder)
    tasks += structureinfo_subfolder(subfolder)
    if not all_done(tasks):
        return tasks
    tasks += polarization_path(folder)
    if not all_done(tasks):
        return tasks

    if os.path.exists(f'{folder}/results-asr.polarization_path.json'):
        tasks += phonons_new(folder, subfolder)
        tasks += neb_path(folder)
        if os.path.exists(f'{folder}/results-asr.neb_path.json'):
            tasks += polarization_path2(folder)
    return tasks


if __name__ == '__main__':
    tasks = create_tasks()

    for ptask in tasks:
        print(ptask, ptask.is_done())
