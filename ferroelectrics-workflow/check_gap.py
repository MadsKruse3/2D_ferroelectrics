from pathlib import Path
import os
import logging

import numpy as np

from asr.core import read_json
from ase.io import read
from evgraf import find_inversion_symmetry


def check_gaps(folder):
    """Check structure files for gaps.
    (This is only neccesary if an old version
    of gpaw is used where a finite gap requirement
    is not explicitly enforced in the berryphase recipe.)"""
    lambdas = np.linspace(0, 1, 15)
    gaps = []
    for x in lambdas:
        lines = []
        with open(f'{folder}/structure_{x}.txt', 'r') as read_obj:
            for line in read_obj:
                line = line.strip()
                lines.append(line)
                if 'Gap' in line:
                    newline = str(str(line).split("(")[-1]).split(",")[-1]
                    newline = str(newline).split(")")[-1]
                    gap = newline
                    gaps.append(gap)

                if 'No gap' in line:
                    newline = str(str(line).split("(")[-1]).split(",")[-1]
                    gap = newline
                    gaps.append(gap)

    return gaps


def verify_polarization(folder):
    """Check that the material actually has a finite polarization.
    If the result is tiny it is an indicator that
    the material is not relaxed properly or that a
    finer tolerance factor is needed for the symmetry analysis"""

    data = read_json(f"{folder}/results-asr.polarization_path.json")
    pol = data["P_tot"]
    Ebarrier = data["E_barrier"]
    atom = read(f"{folder}/structure.json")
    rmsd = find_inversion_symmetry(atom).rmsd

    cell_vc = atom.get_cell().T
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))
    if np.allclose(pol, 0, atol=0.01) and np.allclose(1e3*(Ebarrier/A), 0, atol=0.01) and np.allclose(rmsd, 0, atol=0.01):
        return False
    return True


def check_monotonicity(folder):
    """Check wheter or not the polarization monotonically increases"""
    data = read_json(f"{folder}/results-asr.polarization_path.json")
    Px = data["Px_path"]
    Py = data["Py_path"]
    Pz = data["Pz_path"]
    Ptot = []
    for i in np.arange(len(Px)):
        Ptot.append(np.sqrt((Px[i]-Px[0])**2 +
                            (Py[i]-Py[0])**2 +
                            (Pz[i]-Pz[0])**2))

    for i in np.arange(len(Ptot)-1):
        if (Ptot[i+1] - Ptot[i]) < 0:
            return False
        else:
            continue
    return True


if __name__ == "__main__":
    from argparse import ArgumentParser
    """Check wheter materials
    have bandgaps or not."""

    logging.basicConfig(level=logging.INFO,
                        format='[%(asctime)s] %(levelname)s - %(message)s',
                        handlers=[
                            logging.StreamHandler(),  # Log to console
                            logging.FileHandler('bandgaps.log')]  # Log to file
                        )
    logger = logging.getLogger(__name__)

    parser = ArgumentParser()
    parser.add_argument("folders",
                        nargs="*",
                        help="Monolayer folders to analyse.")
    args = parser.parse_args()

    if len(args.folders) > 0:
        folders = [Path(x).absolute() for x in args.folders]
    else:
        folders = [Path(".").absolute()]

    no_gap_materials = []
    gapped_materials = []
    for folder in folders:
        if os.path.exists(f"{folder}/results-asr.polarization_path.json"):
            if verify_polarization(folder):
                gaps = check_gaps(folder)
                if 'No gap' in gaps:
                    print(f"{folder}:", gaps)
                    no_gap_materials.append(folder)
                else:
                    if check_monotonicity(folder):
                        gapped_materials.append(folder)

    logger.info('Gapped materials:', len(gapped_materials))
    logger.info('Non-gapped materials:', len(no_gap_materials))
    # print('Gapped materials:', len(gapped_materials))
    # print('Non-gapped materials:', len(no_gap_materials))
