from pathlib import Path
import os, re, sys
from asr.core import read_json
import matplotlib.pyplot as plt
import numpy as np
from ase.io import read
from gpaw import GPAW
from evgraf import find_inversion_symmetry

def check_symmetry(folder):
    data = read_json(f"{folder}/results-asr.structureinfo.json")
    symmetry = data["has_inversion_symmetry"]
    return symmetry

def verify_polarization(folder):
    data = read_json(f"{folder}/results-asr.polarization_path.json")
    Pa = data["Pa_path"]
    Pb = data["Pb_path"]
    Pc = data["Pc_path"]
    pol = data["P_tot"]
    Ebarrier = data["E_barrier"]
    atom = read(f"{folder}/structure.json")
    rmsd = find_inversion_symmetry(atom).rmsd

    n = len(atom)
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
        #return 'Most likely non polar'
    return True

def verify_polarization2(folder):
    data = read_json(f"{folder}/results-asr.polarization_path.json")
    Pa = data["Pa_path"]
    Pb = data["Pb_path"]
    Pc = data["Pc_path"]
    pol = data["P_tot"]
    Ebarrier = data["E_barrier"]
    atom = read(f"{folder}/structure.json")
    rmsd = find_inversion_symmetry(atom).rmsd

    n = len(atom)
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
        return 'Most likely non polar'
    return True


if __name__ == "__main__":
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="Monolayer folders to analyse.")

    args = parser.parse_args()
    
    if len(args.folders) > 0:
        folders = [Path(x).absolute() for x in args.folders]
    else:
        folders = [Path(".").absolute()]

    non_polar = []
    almost_non_polar = []
    for folder in folders:
        symmetry = check_symmetry(folder)
        if symmetry:
            non_polar.append(folder)
        if os.path.exists(f"{folder}/results-asr.polarization_path.json"): 
            if verify_polarization2(folder) == 'Most likely non polar':
                if not symmetry:
                    almost_non_polar.append(folder)
    
    
    materials_accounted_for = non_polar + almost_non_polar
    polar = []
    for folder in folders:
        if not folder in materials_accounted_for:
            polar.append(folder)

    print('Non-polar materials:', len(non_polar))
    print('Number of materials that are almost non-polar:', len(almost_non_polar))
    print('Polar materials:', len(polar))

    os.chdir("/home/niflheim/madkru/2D_Ferroelectrics/")
    original_stdout = sys.stdout
    with open('non-polar.txt', 'w') as f1:
        sys.stdout = f1
        for folder in non_polar:
            material_fingerprint = read_json(f"{folder}/results-asr.database.material_fingerprint.json")
            uid = material_fingerprint["uid"]
            print(uid)
    f1.close()

    sys.stdout = original_stdout
    with open('non_polar_not_relaxed.txt', 'w') as f1:
        sys.stdout = f1
        for folder in almost_non_polar:
            material_fingerprint = read_json(f"{folder}/results-asr.database.material_fingerprint.json")
            uid = material_fingerprint["uid"]
            print(uid)
    f1.close()

    sys.stdout = original_stdout
    with open('polar.txt', 'w') as f1:
        sys.stdout = f1
        for folder in polar:
            material_fingerprint = read_json(f"{folder}/results-asr.database.material_fingerprint.json")
            uid = material_fingerprint["uid"]
            print(uid)
    f1.close()
