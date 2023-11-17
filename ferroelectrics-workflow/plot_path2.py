
from pathlib import Path
import os, re

import matplotlib.pyplot as plt
import numpy as np

from asr.core import read_json

from ase.io import read
from ase.units import _e

def plot_displaced_paths(folder):
    atoms_polar = read('structure.json')
    
    cell_vc = (atoms_polar.get_cell().T) * 1e-10
    V = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))
    P_lat_vc = cell_vc * _e/V

    P_latx = np.linalg.norm(P_lat_vc[0])
    P_laty = np.linalg.norm(P_lat_vc[1])
    P_latz = np.linalg.norm(P_lat_vc[2])

    P_latx = np.array(P_latx)*float(1e9)
    P_laty = np.array(P_laty)*float(1e9)
    P_latz = np.array(P_latz)*float(1e9)

    data = read_json(f"results-asr.polarization_path.json")

    path_x = data["Px_path"]
    path_y = data["Py_path"]
    path_z = data["Pz_path"]
    path_points = data["path_points"]
    
    n = 2

    Px = []
    Py = []
    Pz = []

    for x in np.linspace(-n, n, 2*n + 1):
        x = int(x)
        Px.append(path_x - x*P_latx)
        Py.append(path_y - x*P_laty)
        Pz.append(path_z - x*P_latz)
        
    return Px, Py, Pz, path_points, n


def plot_paths(folder):
    os.chdir(folder)
    atom = read('structure.json')
    stochiometry = len(atom.get_chemical_symbols())
    for sf in os.listdir(str(folder)):
        dpath = f"results-asr.polarization_path.json"
        if not os.path.exists(dpath):
            return
        data = read_json(dpath)
        energypath = data["E"]
        path_x = data["Px_path"]
        path_y = data["Py_path"]
        path_z = data["Pz_path"]
        path_points = data["path_points"]
        path_a = data["Pa_path"]
        path_b = data["Pb_path"]
        path_c = data["Pc_path"]
        
        path_points = list(path_points)
        path_a = list(path_a)
        path_b = list(path_b)
        path_c = list(path_c)
        
        path_points2 = path_points[::-1]
        path_points2 = [x*(-1) for x in path_points2]
        path_points2.pop(-1)
        path_points = path_points2 + path_points

        path_a2 = path_a[::-1]
        path_a2 = [x*(-1) for x in path_a2]
        path_a2.pop(-1)
        path_a = path_a2 + path_a
 
        path_b2 = path_b[::-1]
        path_b2 = [x*(-1) for x in path_b2]
        path_b2.pop(-1)
        path_b = path_b2 + path_b

        path_c2 = path_c[::-1]
        path_c2 = [x*(-1) for x in path_c2]
        path_c2.pop(-1)
        path_c = path_c2 + path_c

        path_a = np.array(path_a)
        path_b = np.array(path_b)
        path_c = np.array(path_c)
        path_points = np.array(path_points)

        n = 2
        Pa = []
        Pb = []
        Pc = []
        for x in np.linspace(-n, n, 2*n + 1):
            x = int(x)
            Pa.append(path_a - x)
            Pb.append(path_b - x)
            Pc.append(path_c - x)
            
    return energypath, path_points, Pa, Pb, Pc, path_a, path_b, path_c

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
        if os.path.isfile(f'{folder}/results-asr.polarization_path.json'):

            energypath, a, Pa, Pb, Pc, path_a, path_b, path_c = plot_paths(folder) 

            zero_point_energy = energypath[0]
            energypath2 = [x-zero_point_energy for x in energypath]
            #Px, Py, Pz, a, n = plot_displaced_paths(folder)
            n=2
            plt.figure()
            for x in np.linspace(-n,n, 2*n + 1):
                x = int(x)
                plt.plot(a, Pa[x], '-o')
            #plt.plot(a, Pa, '-ro')
            plt.xlabel('$\lambda$')
            plt.ylabel('Polarization')
            plt.legend(['P-2','P-1','P','P+2','P+2'])
            #plt.title(f'Polarization in a-direction: {mat_name}')
            plt.savefig(f'Polarization_a_shifted_{mat_name}.png')
            
            plt.figure()
            for x in np.linspace(-n,n, 2*n + 1):
                x = int(x)
                plt.plot(a, Pb[x], '-o')
            #plt.plot(a, Pb, '-ro')
            plt.xlabel('$\lambda$')
            plt.ylabel('Polarization')
            plt.legend(['P-2','P-1','P','P+2','P+2'])
            #plt.title(f'Polarization in b-direction: {mat_name}')
            plt.savefig(f'Polarization_b_shifted_{mat_name}.png')
            
            plt.figure()
            for x in np.linspace(-n,n, 2*n + 1):
                x = int(x)
                plt.plot(a, Pc[x], '-o')
            #plt.plot(a, Pc, '-ro')
            plt.xlabel('$\lambda$')
            plt.ylabel('Polarization')
            plt.legend(['P-2','P-1','P','P+2','P+2'])
            #plt.title(f'Polarization in c-direction: {mat_name}')
            plt.savefig(f'Polarization_c_shifted_{mat_name}.pdf')
        
    
            plt.figure()
            plt.plot(a, path_a, '-o')
            plt.xlabel('$\lambda$')
            plt.ylabel('Polarization')
            #plt.title(f'Polarization in a-direction: {mat_name}')
            plt.savefig(f'Polarization_a_{mat_name}.pdf')
            
            plt.figure()
            plt.plot(a, path_b, '-o')
            plt.xlabel('$\lambda$')
            plt.ylabel('Polarization')
            #plt.title(f'Polarization in b-direction: {mat_name}')
            plt.savefig(f'Polarization_b_{mat_name}.pdf')
            
            plt.figure()
            plt.plot(a, path_c, '-o')
            plt.xlabel('$\lambda$')
            plt.ylabel('Polarization')
            #plt.title(f'Polarization in c-direction: {mat_name}')
            plt.savefig(f'Polarization_c_{mat_name}.pdf')