from gpaw import GPAW, PW
from ase.io import write, read
import numpy as np
from gpaw.berryphase import get_polarization_phase
from ase.units import _e
import matplotlib.pyplot as plt
import os
from gpaw.mpi import rank, size
import ase.geometry
from typing import Union
from asr.core import command, option, ASRResult


def get_reference_structures():
    polar_structure = read('structure.json')
    non_polar_structure = read('centrosymmetric_structure/structure.json')
    return polar_structure, non_polar_structure



@command(module='asr.polarization_path',
         requires=['results-asr.relax.json'],
         resources='20:12')
         #dependencies=['asr.relax']) 
         #dependencies=['asr.relax --fmax 0.001 --fixcell --dont-enforce-symmetry']) 
@option('-d', '--dimension', help='help', type=int)
@option('-p', '--path_points', help='help', type=int) 
def main(path_points = 15, dimension = 2):
    """
    Creates a path and computes the formal 
    polarization for each point along the path.

    Returns the spontaneous polarization,
    which is defined as the total change in
    the formal polarization as it goes from
    the non-polar to the polar structure.

    Path_points specifies how many points are 
    used the sampled the path. The default i
    15 points. An error message is raised if the
    polarization change between to points along
    the path is large than half the polarization
    quantum as this signals a discontinuity.

    The dimension variable is used to determine 
    wheter the 2D area or the 3D volume should
    be used to compute the polarization. The 
    default is 2. 
    """

    path_points = np.linspace(0, 1, path_points)


    atoms_polar, atoms_non_polar = get_reference_structures()

    #D, D_len = ase.geometry.get_distances(p1 = p2, p2 = p1, cell = cell, pbc=True)
    #p3 = []

    #for i in np.arange(len(atoms2)):
    #    p3.append(D[i,i].tolist())

    #p3 = np.asarray(p3)

    p1 = atoms_non_polar.get_positions()
    p2 = atoms_polar.get_positions()

    p3 = p2 - p1

    if dimension == 2:
        cell_v = atoms_polar.get_cell()
        V = np.linalg.norm(np.cross(atoms_polar.cell[0], atoms_polar.cell[1]))*1.0e-20
        P_lat = cell_v * _e/ V
    elif dimension == 3:
        cell_v = np.diag(atoms_polar.get_cell()) * 1.0e-10 
        V = (atoms_polar.get_volume()) * 1.0e-30 
        P_lat = cell_v * _e/ V 
    else:
        raise Exception('d should be either 2 or 3. The value given was: {}'.format(d)) 


    params = dict(mode=PW(800),
                      kpts={'density': 12, 'gamma': True},
                      symmetry='off',
                      #convergence={'bands': "CBM+3.0"},
                      xc = 'PBE')

    Px = []
    Py = []
    Pz = []


    for x in path_points:
        
        calc = GPAW(**params, txt=f"structure_{x}.txt")


   
        p4 = p1 + p3*x
        
        atoms_non_polar.set_positions(p4)
        atoms_non_polar.set_calculator(calc)
        atoms_non_polar.get_potential_energy()
        calc.write(f'structure_{x}.gpw', mode='all')
        
                                                          
        phi = get_polarization_phase(f'structure_{x}.gpw')
    
        P = (phi / (2 * np.pi) % 1) * cell_v * _e/ V
            
        if x == path_points[0]:

            Px.append(P[0]) 
            Py.append(P[1])  
            Pz.append(P[2])
        
    
        else:

            P_testx = np.array([P[0] - P_lat[0], P[0], P[0] + P_lat[0]])
            diffx = np.abs(P_testx - Px[-1])
            idx = np.argmin(diffx)
    
            P_testy = np.array([P[1] - P_lat[1], P[1], P[1] + P_lat[1]])
            diffy = np.abs(P_testy - Py[-1])
            idy = np.argmin(diffy)

            P_testz = np.array([P[2] - P_lat[2], P[2], P[2] + P_lat[2]])
            diffz = np.abs(P_testz - Pz[-1])
            idz = np.argmin(diffz)

            assert np.abs(P_testx[idx] - Px[-1]) < np.abs(P_lat[0]/2), """Check if 
            the polarization along the x axis has discontinuity"""

            assert np.abs(P_testy[idy] - Py[-1]) < np.abs(P_lat[1]/2) , """Check if
            the polarization along the x axis has discontinuity"""

            assert np.abs(P_testz[idz] - Pz[-1]) < np.abs(P_lat[2]/2) , """Check if
            the polarization along the x axis has discontinuity"""

            Px.append(P_testx[idx]) 
            Py.append(P_testy[idy])  
            Pz.append(P_testz[idz])
    

    Px = Px[-1] - Px[0]
    Py = Py[-1] - Py[0]
    Pz = Pz[-1] - Pz[0]

    P = np.sqrt(Px**2 + Py**2 + Pz**2)

    remove_files(path_points)

    #if plotting: True
    #    plot_polarization_path(path_points, Px, Py, Pz)
    
    return dict(Px=Px, Py=Py, Pz=Pz, P=P) 




def plot_polarization_path(path_points, Px, Py, Pz):
                                    
    a = np.linspace(0,1,path_points)
                  
    plt.figure()
    plt.plot(a, Px, '-ro')
    plt.axis([0, 1, -2, 2]) ## Mabye change this ??
    plt.xlabel('$\lambda$')
    plt.ylabel('Polarization $\mu$C/m')
    plt.title('Polarization in x-direction')

    plt.savefig('Polarization_x.png')

    plt.figure()

    plt.plot(a, Py, '-ro')
    plt.axis([0, 1, -2, 2]) ## Mabye change this ??
    plt.xlabel('$\lambda$')
    plt.ylabel('Polarization $\mu$C/m')
    plt.title('Polarization in y-direction')

    plt.savefig('Polarization_y.png')

    plt.figure()

    plt.plot(a, Pz, '-ro')
    plt.axis([0, 1, -2, 2]) ## Mabye change this ??
    plt.xlabel('$\lambda$')
    plt.ylabel('Polarization $\mu$C/m')
    plt.title('Polarization in z-direction')

    plt.savefig('Polarization_z.png')


def remove_files(path_points):
    a = np.linspace(0,1,path_points)

    for x in a:

        if os.path.isfile(f'structure_{x}.txt') is True:
            if rank == 0:
                os.remove(f'structure_{x}.txt')

        if os.path.isfile(f'structure_{x}.gpw') is True:
            if rank == 0:
                os.remove(f'structure_{x}.gpw')

        if os.path.isfile(f'structure_{x}-berryphases.json') is True:
            if rank == 0:
                os.remove(f'structure_{x}-berryphases.json') 


if __name__ == '__main__':
    main.cli()
