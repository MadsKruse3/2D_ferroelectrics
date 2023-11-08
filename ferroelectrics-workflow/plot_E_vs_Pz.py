from pathlib import Path
import os, re
from asr.core import read_json
import matplotlib.pyplot as plt
import numpy as np
from ase.io import read

def plot_paths(folder):
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
    #for i in np.arange(0,len(path_x)):
        #P_tot.append(np.sqrt((path_x[i]-path_x[0])**2 + (path_y[i]-path_y[0])**2 + (path_z[i]-path_z[0])**2))
        
    
    path_points = data["path_points"]
    energy_path = np.array(energy_path/A)
    #polarization_path = np.array(P_tot)
    polarization_path = path_z

    energy_path = energy_path - energy_path[-1]
    return energy_path, polarization_path

def plot_paths_NEB(folder):
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

    #P_tot = []
    #for i in np.arange(0,len(path_x)):
    #    P_tot.append(np.sqrt((path_x[i]-path_x[0])**2 + (path_y[i]-path_y[0])**2 + (path_z[i]-path_z[0])**2))
        

    path_points = data["path_points"]
    energy_path = np.array(energy_path/A)
    #polarization_path = np.array(P_tot)
    polarization_path = path_z

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

    for folder in folders:
        os.chdir(f"{folder}")
        mat_name = re.split('[/]', str(folder))[-1]
        if os.path.exists(f'{folder}/results-asr.polarization_path.json'):
            energy_path, polarization_path = plot_paths(folder) 

            plt.figure()
            plt.plot(polarization_path, energy_path, '-ro')
            plt.xlabel('Polarization z [nC/m]')
            plt.ylabel(r'Energy [eV/Å${^2}$]')
            plt.legend(['Linear interpolation'])
            plt.title(f'Energy as a function of polarization: {mat_name}')
            plt.tight_layout()
            plt.savefig('Energy_vs_polarization_z.png')
            plt.close()

        if os.path.exists(f'{folder}/results-asr.polarization_path2.json'):
            energy_path, polarization_path = plot_paths(folder) 
            energy_path_neb, polarization_path_neb = plot_paths_NEB(folder) 
            
            plt.figure()
            #plt.plot(polarization_path, energy_path, '-ro')
            plt.plot(polarization_path_neb, energy_path_neb, '-bo')
            plt.xlabel('Polarization z [nC/m]')
            plt.ylabel(r'Energy [eV/Å${^2}$]')
            #plt.legend(['Linear interpolation','NEB'])
            plt.legend(['NEB'])
            plt.title(f'Energy as a function of polarization: {mat_name}')
            plt.tight_layout()
            plt.savefig('Energy_vs_polarization_z_both.png')
            plt.close()

                
            

