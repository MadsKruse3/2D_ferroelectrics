from pathlib import Path
import os

from asr.core import read_json
from ase.io import read

import matplotlib.pyplot as plt
import numpy as np

def plot_paths(folder):
    os.chdir(folder)
    atom = read('structure.json')
    dpath = f"results-asr.polarization_path.json"
    
    data = read_json(dpath)
    energypath = data["E"]
    path_x = data["Px_path"]
    path_y = data["Py_path"]
    path_z = data["Pz_path"]
    path_points = data["path_points"]
    path_a = data["Pa_path"]
    path_b = data["Pb_path"]
    path_c = data["Pc_path"]
        
    cell_vc = (atom.get_cell().T) 
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))
    energypath = np.array(energypath)/A
        
    return energypath, path_points, path_x, path_y, path_z, path_a, path_b, path_c

def plot_neb_path(folder):
    os.chdir(folder)
    atom = read('structure.json')
    dpath = f"results-asr.polarization_path2.json"
    
    data = read_json(dpath)
    energypath = data["E"]
    path_x = data["Px_path"]
    path_y = data["Py_path"]
    path_z = data["Pz_path"]
    path_points = data["path_points"]
    path_a = data["Pa_path"]
    path_b = data["Pb_path"]
    path_c = data["Pc_path"]

    path_points = list(reversed(path_points))
    
    x = 18

    images = read(f'{folder}/neb_path.traj@-{x}:')

    pos = []
    energies = []
    for y in images:
        energies.append(y.get_potential_energy())
        pos_reshaped = y.get_positions()
        pos.append(y.get_positions())
    
    dist = []
    total_dist = np.linalg.norm(pos[-1] - pos[0])
    for i in np.arange(0,x):
        dist.append(np.linalg.norm((pos[i]-pos[0])))
        
    neb_path = np.array(dist)/total_dist
    for x in np.arange(len(path_points)):
        path_points[x] = path_points[x]/len(data["path_points"])

    cell_vc = (atom.get_cell().T) 
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))
    energypath = np.array(energypath)/A
        
    return energypath, path_points, neb_path, path_x, path_y, path_z, path_a, path_b, path_c

def E_vs_P(folder):
    dpath = f'{folder}/results-asr.polarization_path.json'
    data = read_json(dpath)
    energy_path = data["E"]
    polarization_path = data["P_tot"]
    path_x = data["Px_path"]
    path_y = data["Py_path"]
    path_z = data["Pz_path"]

    atoms_polar = read(f'{folder}/structure.json')
    cell_vc = (atoms_polar.get_cell().T) 
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))
    
    P_tot = []
    for i in np.arange(0,len(path_x)):
        P_tot.append(np.sqrt((path_x[i]-path_x[0])**2 + (path_y[i]-path_y[0])**2 + (path_z[i]-path_z[0])**2))
    
    path_points = data["path_points"]
    energy_path = np.array(energy_path/A)
    polarization_path = np.array(P_tot)

    energy_path = energy_path - energy_path[-1]
    return energy_path, polarization_path


def E_vs_P_NEB(folder):
    dpath = f'{folder}/results-asr.polarization_path2.json'
    data = read_json(dpath)
    energy_path = data["E"]
    polarization_path = data["P_tot"]
    path_x = data["Px_path"]
    path_y = data["Py_path"]
    path_z = data["Pz_path"]
    
    atoms_polar = read(f'{folder}/structure.json')
    cell_vc = (atoms_polar.get_cell().T) 
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))

    P_tot = []
    for i in np.arange(0,len(path_x)):
        P_tot.append(np.sqrt((path_x[i]-path_x[0])**2 + (path_y[i]-path_y[0])**2 + (path_z[i]-path_z[0])**2))
    
    path_points = data["path_points"]
    polarization_path = np.array(P_tot)
    energy_path = np.array(energy_path/A)

    energy_path = energy_path - energy_path[-1]
    return energy_path, polarization_path

if __name__ == "__main__":
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="Monolayer folders to analyse.")

    args = parser.parse_args()
    
    if len(args.folders) > 0:
        folders = [Path(x).absolute() for x in args.folders]
    else:
        folders = [Path(".").absolute()]


    plt.rcParams['font.family'] = 'serif'
    plt.rcParams['font.serif'] = ['Times New Roman'] + plt.rcParams['font.serif']
    plt.rcParams['axes.labelsize'] = 'large'

    for folder in folders:
        mat_name = re.split('[/]', str(folder))[-1]
        if os.path.exists(f'{folder}/results-asr.polarization_path.json'):
            energypath, a, path_x, path_y, path_z, path_a, path_b, path_c = plot_paths(folder) 
            
            plt.figure()
            plt.plot(a, path_x, '-ro')
            plt.xlabel('$\lambda$')
            plt.ylabel('Polarization nC/m')
            plt.title(f'Polarization in x-direction: {mat_name}')

            plt.savefig('Polarization_x.png')
            plt.close()

            plt.figure()
            plt.plot(a, path_y, '-ro')
            plt.xlabel('$\lambda$')
            plt.ylabel('Polarization nC/m')
            plt.title(f'Polarization in y-direction: {mat_name}')

            plt.savefig('Polarization_y.png')
            plt.close()

            plt.figure()
            plt.plot(a, path_z, '-ro')
            plt.xlabel('$\lambda$')
            plt.ylabel('Polarization nC/m')
            plt.title(f'Polarization in z-direction: {mat_name}')

            plt.savefig('Polarization_z.png')
            plt.close()
    
            plt.figure()
            plt.plot(a, energypath, '-ro')
            plt.xlabel('$\lambda$')
            plt.ylabel('Energy pr. cell [eV/Å${^2}$]')
            plt.title(f'Energy curve: {mat_name}')
        
            plt.tight_layout()
            plt.savefig('Energy_curve.png')
            plt.close()
            
            if os.path.exists(f'{folder}/results-asr.polarization_path2.json'):
                energypath_neb, path_points, neb_path_points, neb_path_x, neb_path_y, neb_path_z, neb_path_a, neb_path_b, neb_path_c = plot_neb_path(folder) 
                plt.figure()
                plt.plot(neb_path_points, neb_path_x, '-ro')
                plt.xlabel('$\lambda$')
                plt.ylabel('Polarization nC/m')
                plt.title(f'Polarization in x-direction: {mat_name}')
                plt.tight_layout()
                plt.savefig('Polarization_x_neb.png')
                plt.close()

                plt.figure()
                plt.plot(neb_path_points, neb_path_y, '-ro')
                plt.xlabel('$\lambda$')
                plt.ylabel('Polarization nC/m')
                plt.title(f'Polarization in y-direction: {mat_name}')
                plt.tight_layout()
                plt.savefig('Polarization_y_neb.png')
                plt.close()

                plt.figure()
                plt.plot(neb_path_points, neb_path_z, '-ro')
                plt.xlabel('$\lambda$')
                plt.ylabel('Polarization nC/m')
                plt.title(f'Polarization in z-direction: {mat_name}')
                plt.tight_layout()
                plt.savefig('Polarization_z_neb.png')
                plt.close()
    
                plt.figure()
                plt.plot(neb_path_points, energypath_neb, '-ro')
                plt.xlabel('$\lambda$')
                plt.ylabel('Energy pr. cell [eV/Å${^2}$]')
                plt.title(f'Energy curve: {mat_name}')
                plt.tight_layout()
                plt.savefig('Energy_curve_neb.png')
                plt.close()

                energy_path, polarization_path = E_vs_P(folder) 
                energy_path_neb, polarization_path_neb = E_vs_P_NEB(folder) 
                
                plt.figure()
                plt.plot(polarization_path, energy_path, '-ro')
                plt.xlabel('Polarization [nC/m]')
                plt.ylabel(r'Energy [eV/Å${^2}$]')
                plt.legend(['Linear interpolation','NEB'])
                plt.title(f'Energy as a function of polarization: {mat_name}')
                plt.tight_layout()
                plt.savefig('Energy_vs_polarization.png')
                plt.close()

                plt.figure()
                plt.plot(polarization_path, energy_path, '-ro')
                plt.plot(polarization_path_neb, energy_path_neb, '-bo')
                plt.xlabel('Polarization [nC/m]')
                plt.ylabel(r'Energy [eV/Å${^2}$]')
                plt.legend(['Linear interpolation','NEB'])
                plt.tight_layout()
                plt.savefig(f'Energy_vs_polarization_{mat_name}.png')
                plt.savefig(f'Energy_vs_polarization_{mat_name}.pdf')
                plt.close()
