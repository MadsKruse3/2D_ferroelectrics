from gpaw import GPAW, PW
import numpy as np
import json
from evgraf import find_inversion_symmetry
import glob, os, sys
from pathlib import Path
from ase.io import read, write
from ase.optimize import BFGS
from ase.neb import NEB, NEBTools
import matplotlib.pyplot as plt
from gpaw.mpi import rank, size
from ase.units import kB
from asr.core import command, option, ASRResult
from typing import Union

def get_calculator_params():

    params = dict(mode=PW(800),
                kpts={'density': 12, 'gamma': True},
                #symmetry='off',
                basis = 'dzp',
                occupations = {'name': 'fermi-dirac','width': 0.05},
                #convergence = {'eigenstates': 1e-11, 'density': 1e-7},
                xc = 'PBE')

    return params


@command(module='asr.neb_path') 
@option('-p', '--path_images', help='help', type=int)
@option('-f', '--forces', help='help', type=float)
def main(path_images = 16, forces=0.05):

    """ A script that: 
 
    1: Recenters the relaxed centrosymmetric structures such that 
    NEB calculations can be performed.

    2. Performs an NEB calculation using the newly centered 
    centrosymmtric structure and the relaxed polar structure.

    3. Returns e structures.traj that can be further treated 
    using NEBtools. """

    #final = read('structure.json')
    final = read('gs.gpw')

    cell = final.get_cell()

    sym_center = find_inversion_symmetry(final).axis

    initial = read('centrosymmetric_structure/gs.gpw')
    oldpos = initial.get_positions()

    newpos = oldpos + sym_center

    initial.set_positions(newpos)
    
    params = get_calculator_params()
    calc = GPAW(**params)
    
    initial.set_calculator(calc)
    initial.get_potential_energy()
    initial.get_forces()

    ## Full gs calculation needed. The forces on all atoms in these structures must be known.

    nu_images = path_images
    x = nu_images + 2 ## total number of trajectories including start and end points

    n = size // nu_images  # number of cpu's per image
    j = 1 + rank // n  # my image number
    assert nu_images * n == size

    images = [initial]

    for i in range(nu_images):
        ranks = range(i * n, (i + 1) * n)
        image = initial.copy()

        if rank in ranks:
            
            calc = GPAW(txt=f'structure_j.txt',
                        communicator=ranks, **params)

            image.set_calculator(calc)

        images.append(image)

    images.append(final)

    neb = NEB(images, parallel=True, climb=True)
    neb.interpolate()

    qn = BFGS(neb, logfile='neb_path.log', trajectory='neb_path.traj')
    qn.run(fmax=forces)

        
if __name__ == '__main__':
    main.cli()
