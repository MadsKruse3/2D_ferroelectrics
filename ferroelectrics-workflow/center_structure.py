import os
from pathlib import Path

from evgraf import find_inversion_symmetry
from ase.io import read


def center_structure(folder):
    os.chdir(folder)
    if Path('centrosymmetric_structure/structure.json').is_file():
    # if Path('centrosymmetric_structure/unrelaxed.json').is_file():
        atom = read('structure.json')

        sym_center = find_inversion_symmetry(atom).axis

        os.chdir('./centrosymmetric_structure')

        atom2 = read('structure.json')
        # atom2 = read('unrelaxed.json')

        oldpos = atom2.get_positions()
        newpos = oldpos + sym_center

        atom2.set_positions(newpos)
        atom2.write('structure_new.json')


if __name__ == '__main__':
    """ Recipe that:
    1: Recenters the relaxed centrosymmetric structures such that
    NEB calculations can be performed.
    """
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*",
                        help="Monolayer folders to analyse.")
    args = parser.parse_args()

    for folder in args.folders:
        os.chdir("/home/niflheim/madkru/2D_Ferroelectrics")
        center_structure(folder)
