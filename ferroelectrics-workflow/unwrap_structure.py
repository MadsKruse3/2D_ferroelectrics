from gpaw import GPAW
import numpy as np
import json
from evgraf import find_inversion_symmetry
import glob, os, sys
from pathlib import Path
from ase.io import read, write

def unwrap_structure(folder):
    """ Recipe that: 
    1: Creates subdirectories for centrosymmetric structures 
 
    2: Maps the input structure to the 'nearest' inversion symmetric 
    structure. The coordinates are subsequently set such that all atoms are 
    shifted by a vector corresponding to the inversion axis, thus imposing
    inversion symmetry.

    3: Adds an unrelaxed.json file for the inversion symmetric structure in
    that subfolder """

    os.chdir(folder)
    if Path('structure.json').is_file():
        p = Path(folder)
        atom = read('structure.json')
        atom2 = atom.copy()
        atom2.write('unrelaxed.json')

        cell = atom.get_cell()

        atom_inv = find_inversion_symmetry(atom).atoms
        sym_center = find_inversion_symmetry(atom).axis

        pos1 = atom_inv.get_positions()
        pos2 = atom.get_positions()

        newpos = []
        for i in np.arange(len(atom)):
            pos = []
            distances = []
            for x in [-1, 0, 1]:
                for y in [-1, 0, 1]:
                    for z in [-1, 0, 1]:
                        pos.append(pos1[i] + x*cell[0] + y*cell[1] + z*cell[2])


            diff = pos2[i]-pos
            for l in np.arange(len(pos)):
                distances.append(np.linalg.norm(diff[l]))
            diffmin = np.argmin(distances)
            newpos.append(pos[diffmin])

        atom_inv.set_positions(newpos - sym_center)

        os.makedirs('centrosymmetric_structure')
        os.chdir('./centrosymmetric_structure')
        atom_inv.write('unrelaxed.json')
        

if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="Monolayer folders to analyse.")

    args = parser.parse_args()
    
    for folder in args.folders:
        os.chdir("/home/niflheim/madkru/2D_Ferroelectrics")
        unwrap_structure(folder)
        
