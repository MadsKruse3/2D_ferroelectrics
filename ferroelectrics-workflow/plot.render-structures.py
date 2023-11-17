from ase.io import write, read
from ase.io.pov import get_bondpairs
from ase.build import mx2
from ase.visualize import view

import os
import numpy as np
from pathlib import Path
from argparse import ArgumentParser

if __name__ == "__main__":
    """Template for how to render structure. 
    The actual script used to generate figures for 
    the paper can be found in visualize_structure.py"""
    
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="Monolayer folders to analyse.")

    args = parser.parse_args()
    
    if len(args.folders) > 0:
        folders = [Path(x).absolute() for x in args.folders]
    else:
        folders = [Path(".").absolute()]

    for folder in folders:

        system = read(f'{folder}/structure.json')
        name = system.get_chemical_formula()
        system = system.repeat((6, 6, 1))
        system = system[system.get_positions()[:, 0] > 0.1]
        system = system[system.get_positions()[:, 0] < 10]
        system = system[system.get_positions()[:, 1] < 11]
        system = system[system.get_positions()[:, 1] > 2]
        system.rotate(0,'z')
        
        bondatoms = get_bondpairs(system, radius=0.9)

        pov_parameters = {'canvas_width': 3840, # sets how good the resulution will be,
                                        # the higher you set it the longer it takes to run
                          'celllinewidth': 0.0, # define how thick the unit cell lines should be (no
                                        # unit cell is shown if you set it to zero
                          'bondatoms': bondatoms # define which atoms should be connected by bonds,
                                         # either use the 'get_bondpairs' function or
                                         # define it according to your wishes
                      }
        


        filename = name + f'side.pov'
        write(filename, system, format='pov', rotation='-90x,0y', radii=0.5,
              povray_settings=pov_parameters).render()
        
        filename = name + f'side.pov'
        write(filename, system, format='pov', rotation='0x,-90y', radii=0.5,
              povray_settings=pov_parameters).render()

        filename = name + f'front.pov'
        write(filename, system, format='pov', rotation='0x,0y', radii=0.5,
              povray_settings=pov_parameters).render()
