from ase.io.pov import get_bondpairs
from ase.build import mx2
from ase.io import read, write, pov
from ase.visualize import view

import os

if __name__ == "__main__":
    from pathlib import Path
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="Monolayer folders to analyse.")

    args = parser.parse_args()
    
    if len(args.folders) > 0:
        folders = [Path(x).absolute() for x in args.folders]
    else:
        folders = [Path(".").absolute()]

    """These are the parameters used to generate 3D images of various 2D materials.
    These include (among others) the ones found in figure 1 in:
    https://www.nature.com/articles/s41524-023-00999-5 """
    ## Params used for:
    # Nb2O2Cl4:
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 0.1]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 3]
    #polar_structure.rotate(90, 'z')

    # Ge2S2:
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 0.1]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 10]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 2]
    #polar_structure.rotate(0, 'z')

    # S2Sn2:
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 0.1]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 10]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 2]
    #polar_structure.rotate(0, 'z')

    # In2Te4:
    #polar_structure = polar_structure.repeat((6, 5, 1))
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 0.2]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 1]
    #polar_structure.rotate(0, 'z')

    # CuInP2Se6:
    #polar_structure = polar_structure.repeat((6, 5, 1))
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 0.2]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 1]
    #polar_structure.rotate(0, 'z')

    # As2Sb2O6:
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 0.1]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 10]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 2]
    #polar_structure.rotate(0, 'z')

    # BrClTi:
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 0.1]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 10]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 2]
    #polar_structure.rotate(0, 'z')
    
    # As4O6:
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 0.1]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 10]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 2]
    #polar_structure.rotate(0, 'z')

    # Cr2Mo2S8
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 0.1]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 10]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 2]
    #polar_structure.rotate(0, 'z')

    # F2Li2S2:
    #polar_structure = polar_structure.repeat((6, 5, 1))
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 0.2]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 11]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 1]
    #polar_structure.rotate(0, 'z')

    # AgBiP2Se6
    #polar_structure = polar_structure.repeat((6, 6, 1))
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 1.7]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 12.0]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 21.5]
    #polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 10.5]
    #polar_structure.rotate(0, 'z')
    #cell = polar_structure.get_cell()

    #cell[0][0] = 25
    #cell[1][1] = 25
    #cell[2][2] = 25
    
    #cell[0][1] = 0.0
    #cell[0][2] = 0.0
    #cell[2][0] = 0.0
    #cell[1][0] = 0.0
    #cell[1][2] = 0.0
    #cell[2][1] = 0.0
        
    #polar_structure.set_cell(cell)
    #polar_structure.center()

    for folder in folders:
        polar_structure = read(f'{folder}/structure_new.json')
        name = polar_structure.get_chemical_formula()
        #name = name + 'standard'
        #name = name + 'switched'
        name = name + 'switched2'

        polar_structure = polar_structure.repeat((6, 6, 1))
        
        polar_structure = polar_structure[polar_structure.get_positions()[:, 0] > 4]
        polar_structure = polar_structure[polar_structure.get_positions()[:, 0] < 16.6]
        polar_structure = polar_structure[polar_structure.get_positions()[:, 1] < 21.5]
        polar_structure = polar_structure[polar_structure.get_positions()[:, 1] > 10.5]

        polar_structure.rotate(0, 'z')
    
        cell = polar_structure.get_cell()
        """The unit cell is still 3D because of the surrounding vacuum. 
        This is carved away here. Otherwise the resulting picture is 
        distorted."""
        cell[0][0] = 25
        cell[1][1] = 25
        cell[2][2] = 25

        cell[0][1] = 0.0
        cell[0][2] = 0.0
        cell[2][0] = 0.0
        cell[1][0] = 0.0
        cell[1][2] = 0.0
        cell[2][1] = 0.0

        polar_structure.set_cell(cell)
        polar_structure.center()

        bondatoms_polar = get_bondpairs(polar_structure, radius=0.9)

        pov_parameters_polar= {'canvas_width': 10000,
                               'celllinewidth': 0.0, # define how thick the unit cell lines should be (no
                                            # unit cell is shown if you set it to zero
                               'bondatoms': bondatoms_polar # define which atoms should be connected by bonds,
                                            # either use the 'get_bondpairs' function or
                                            # define it according to your wishes
                              }

        os.chdir('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/')

        filename = name + f'-90x.pov'
        write(filename, polar_structure, format='pov', rotation='-90x,0y', radii=0.5,
              povray_settings=pov_parameters_polar).render()

        filename = name + f'-0x0y.pov'
        write(filename, polar_structure, format='pov', rotation='0x,0y', radii=0.5,
              povray_settings=pov_parameters_polar).render()

        filename = name + f'-90y.pov'
        write(filename, polar_structure, format='pov', rotation='0x,-90y', radii=0.5,
              povray_settings=pov_parameters_polar).render()