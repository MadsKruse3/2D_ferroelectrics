import numpy as np
import os
import matplotlib.pyplot as plt

from evgraf import find_inversion_symmetry

from asr.core import read_json

from ase.units import kJ
from ase.io import read


def get_gradients(folder):
    """ Computes Coercive field as from the energy gradient from linear interpolation (LI) calculations."""
    atom = read(f'{folder}/structure.json')
    cell_vc = atom.get_cell().T*1e-10
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))

    data = read_json(f"{folder}/results-asr.polarization_path.json")
    a = getattr(data, 'data')
    Px_path = a["Px_path"]
    Py_path = a["Py_path"]
    Pz_path = a["Pz_path"]
    Ptot_path = []
    for x in np.arange(len(Px_path)):
        Ptot_path.append(np.sqrt((Px_path[x]-Px_path[0])**2 +
                                 (Py_path[x]-Py_path[0])**2 +
                                 (Pz_path[x]-Pz_path[0])**2))

    P = np.array(Ptot_path)*(1e-7)*A  # Convert units from nC/m to C*cm (A has units of m^2)
    E = a["E"]
    E = np.array(E)*(1/kJ)  # Convert from eV to J and from J to kJ

    Coercive_fields = []
    for i in np.arange(1, len(E)-1):
        Coercive_fields.append((1/2)*(
                                      (E[i+1]-E[i])/(P[i+1]-P[i]) +
                                      (E[i]-E[i-1])/(P[i]-P[i-1]))
                               )

    Coercive_fields = np.array(Coercive_fields)
    Coercive_field = np.max(np.abs(Coercive_fields))
    Polarization = Ptot_path[-1]
    return Coercive_field, Polarization


def get_gradients_NEB(folder):
    """ Computes Coercive field as
    from the energy gradient from
    Nudged Elastic Band (NEB) calculations."""

    atom = read(f'{folder}/structure.json')
    cell_vc = atom.get_cell().T*1e-10
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))

    data = read_json(f"{folder}/results-asr.polarization_path2.json")
    a = getattr(data, 'data')
    Px_path = a["Px_path"]
    Py_path = a["Py_path"]
    Pz_path = a["Pz_path"]
    Ptot_path = []
    for x in np.arange(len(Px_path)):
        Ptot_path.append(np.sqrt((Px_path[x]-Px_path[0])**2 +
                                 (Py_path[x]-Py_path[0])**2 +
                                 (Pz_path[x]-Pz_path[0])**2))

    P = np.array(Ptot_path)*(1e-7)*A  # Convert units from nC/m to C*cm (A has units of m^2)
    E = a["E"]
    E = np.array(E)*(1/kJ)  # Convert from eV to J and from J to kJ

    Coercive_fields_NEB = []
    for i in np.arange(1, len(E)-1):
        Coercive_fields_NEB.append((1/2)*(
                                          (E[i+1]-E[i])/(P[i+1]-P[i]) +
                                          (E[i]-E[i-1])/(P[i]-P[i-1]))
                                   )

    Coercive_fields_NEB = np.array(Coercive_fields_NEB)
    Coercive_field_NEB = np.max(np.abs(Coercive_fields_NEB))
    Polarization = Ptot_path[-1]
    return Coercive_field_NEB, Polarization


def verify_polarization(folder):
    """Verify that the polarization curve is smooth."""
    data = read_json(f"{folder}/results-asr.polarization_path.json")
    Pa = data["Pa_path"]
    Pb = data["Pb_path"]
    Pc = data["Pc_path"]
    pol = data["P_tot"]
    Ebarrier = data["E_barrier"]
    atom = read(f"{folder}/structure.json")
    rmsd = find_inversion_symmetry(atom).rmsd

    cell_vc = atom.get_cell().T
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))
    for i in np.arange(len(Pa)-1):
        if abs(Pa[i+1]-Pa[i]) > 1/4:
            return False
        if abs(Pb[i+1]-Pb[i]) > 1/4:
            return False
        if abs(Pc[i+1]-Pc[i]) > 1/4:
            return False
    if np.allclose(pol, 0, atol=0.01) and np.allclose(1e3*(Ebarrier/A), 0, atol=0.01) and np.allclose(rmsd, 0, atol=0.01):
        return False
    return True


if __name__ == "__main__":
    """ Creates scatterplots that compare
    Coercive fields (where they are well defined)
    against spontaneous polarizations."""

    from pathlib import Path
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="Monolayer folders to analyse.")

    args = parser.parse_args()
    if len(args.folders) > 0:
        folders = [Path(x).absolute() for x in args.folders]
    else:
        folders = [Path(".").absolute()]
    start_dir = os.getcwd()

    Pols = []
    Pols_FM = []
    Coercive_fields = []
    Coercive_fields_FM = []
    Coercive_fields_NEB = []
    Coercive_fields_NEB_FM = []

    for folder in folders:
        if os.path.isfile(f'{folder}/results-asr.polarization_path.json'):
            if os.path.isfile(f'{folder}/results-asr.polarization_path2.json'):
                subfolder = Path(f"{folder}/centrosymmetric_structure").absolute()

                Coercive_field, Polarization = get_gradients(folder)
                Coercive_field_NEB, Polarization_NEB = get_gradients_NEB(folder)

                print('E_c:', (1e-4)*Coercive_field)
                print('E_c with NEB:', (1e-4)*Coercive_field_NEB)
                Coercive_field_NEB = (1e-4)*Coercive_field_NEB
                Coercive_field = (1e-4)*Coercive_field

                if verify_polarization(folder):
                    Pols.append(Polarization)
                    Coercive_fields.append(Coercive_field)
                    Coercive_fields_NEB.append(Coercive_field_NEB)

                    if os.path.exists(f'{folder}/results-asr.magstate.json'):
                        data = read_json(f'{folder}/results-asr.magstate.json')
                        magstate = data["magstate"]
                        if magstate == 'FM':
                            Pols_FM.append(Polarization)
                            Coercive_fields_FM.append(Coercive_field)
                            Coercive_fields_NEB_FM.append(Coercive_field_NEB)

    cwd = os.getcwd()
    os.chdir(cwd + '/plots_and_figures')

    plt.rcParams['font.family'] = 'serif'
    plt.rcParams['font.serif'] = ['Times New Roman'] + plt.rcParams['font.serif']

    plt.figure()
    l4 = plt.scatter(Coercive_fields, Pols, c='b', alpha=0.5)
    l5 = plt.scatter(Coercive_fields_FM, Pols_FM, c='r', alpha=0.5)
    plt.gca().legend((l4, l5), ('NM', 'FM'), loc='upper left', shadow=True, bbox_to_anchor=(1, 1))
    plt.xlabel('Coercive field [V/nm]')
    plt.ylabel('Spontaneous polarization [nC/m]')
    plt.title('Coercive field - polarization scatterplot')
    plt.tight_layout()
    plt.savefig('Polarization_vs_coercive_field.pdf')

    plt.figure()
    l1 = plt.scatter(Coercive_fields_NEB, Pols, c='b', alpha=0.5)
    l2 = plt.scatter(Coercive_fields_NEB_FM, Pols_FM, c='r', alpha=0.5)
    plt.gca().legend((l1, l2), ('NM', 'FM'), loc='upper left', shadow=True, bbox_to_anchor=(1, 1))
    plt.xlabel('Coercive field from NEB [V/nm]')
    plt.ylabel('Polarization [nC/m]')
    plt.title('Polarization vs Coercive field')
    plt.tight_layout()
    plt.savefig('Polarization_vs_coercive_field_NEB.pdf')

    plt.figure()
    l1 = plt.scatter(Coercive_fields, Coercive_fields_NEB, c='b', alpha=0.5)
    l2 = plt.scatter(Coercive_fields_FM, Coercive_fields_NEB_FM, c='r', alpha=0.5)
    plt.xlim([0, 1000])
    plt.ylim([0, 1000])
    plt.gca().legend((l1, l2), ('NM', 'FM'), loc='upper left', shadow=True, bbox_to_anchor=(1, 1))
    plt.axline((0, 0), slope=1, color="black", linestyle=(0, (5, 5)))
    plt.xlabel('Coercive field [V/nm]')
    plt.ylabel('Coercive field from NEB [V/nm]')
    plt.title('Compare Coercive fields')
    plt.tight_layout()
    plt.savefig('Compare_coercive_fields.pdf')
