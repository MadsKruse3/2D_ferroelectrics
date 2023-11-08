from pathlib import Path
import os, re
from asr.core import read_json
import matplotlib.pyplot as plt
import numpy as np
from ase.io import read
from gpaw import GPAW
from evgraf import find_inversion_symmetry

def check_gaps(folder):
    lambdas = np.linspace(0, 1, 15)
    gaps = []
    for x in lambdas:
        dpath = f'{folder}/structure_{x}.txt'
        lines = []
        with open(dpath, 'r') as read_obj:                
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

        read_obj.close()
    return gaps

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
    if np.allclose(pol, 0, atol=0.01) and np.allclose(1e3*(Ebarrier/A), 0, atol=0.01) and np.allclose(rmsd, 0, atol=0.01):                
        return False
    return True

def check_monotonicity(folder):
    data = read_json(f"{folder}/results-asr.polarization_path.json")
    Px = data["Px_path"]
    Py = data["Py_path"]
    Pz = data["Pz_path"]
    Ptot = []
    for i in np.arange(len(Px)):
        Ptot.append(np.sqrt((Px[i]-Px[0])**2 + (Py[i]-Py[0])**2 + (Pz[i]-Pz[0])**2 ))
    
    for i in np.arange(len(Ptot)-1):
        if (Ptot[i+1] - Ptot[i]) < 0:
            return False
        else:
            continue
    return True


def check_gs(folder):
    dpath = f'{folder}/centrosymmetric_structure/gs.txt'
    lines = []
    with open(dpath, 'r') as read_obj:                
        for line in read_obj:
            line = line.strip()
            lines.append(line)
            if 'Gap' in line:
                newline = str(str(line).split("(")[-1]).split(",")[-1]
                newline = str(newline).split(")")[-1]
                gap = newline
                #gaps.append(gap)
                
            if 'No gap' in line:
                newline = str(str(line).split("(")[-1]).split(",")[-1]
                gap = newline
                #gaps.append(gap)

    read_obj.close()
    return gap

if __name__ == "__main__":
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="Monolayer folders to analyse.")

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
                #gap = check_gs(folder)
                print(gaps)
                if 'No gap' in gaps:
                    print(f"{folder}:", gaps)
                    if os.path.exists(f"{folder}/centrosymmetric_structure/results-asr.gs.json"):
                        gap = check_gs(folder)
                        #print(gap)
                    no_gap_materials.append(folder)
                    #print(f'{folder}:', gaps)
                if not 'No gap' in gaps:
                    if check_monotonicity(folder):
                        gapped_materials.append(folder)
                        
                #if 'No gap' in gaps[-1]:
                #    print(folder)
                #    print(gaps)
    print('Gapped materials:', len(gapped_materials))
    print('Non-gapped materials:', len(no_gap_materials))
  
    

