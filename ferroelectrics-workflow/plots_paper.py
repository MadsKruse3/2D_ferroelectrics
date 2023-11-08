from pathlib import Path
import os, re

import matplotlib.pyplot as plt
import numpy as np

from ase.io import read
from asr.core import read_json

from matplotlib.offsetbox import TextArea, DrawingArea, OffsetImage, AnnotationBbox
import matplotlib.image as mpimg

def plot_polarizations(folder):
    os.chdir(folder)
    atom = read('structure.json')
    stochiometry = len(atom.get_chemical_symbols())
    
    data = read_json(f'{folder}/results-asr.polarization_path.json')
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

    n = 8
    Pa = []
    Pb = []
    Pc = []
    for x in np.linspace(-n, n, 2*n + 1):
        x = int(x)

        Pa.append(path_a - x)
        Pb.append(path_b - x)
        Pc.append(path_c - x)

    return path_points, Pa, Pb, Pc

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
    plt.rcParams['font.size'] = 20
    plt.rcParams['legend.fontsize'] = 'small'
    plt.rcParams['legend.handleheight'] =  0.6                                                                                                                     
    plt.rcParams['legend.handlelength'] = 0.8                                                                                                                                                                    
    plt.rcParams['legend.handletextpad'] =  0.6   

    if os.path.exists('/home/niflheim/madkru/2D_Ferroelectrics/tree/AB/GeS/Ge2S2-ecbb7c185669/results-asr.polarization_path2.json'):

        energy_path, polarization_path = E_vs_P('/home/niflheim/madkru/2D_Ferroelectrics/tree/AB/GeS/Ge2S2-ecbb7c185669') 
        energy_path_neb, polarization_path_neb = E_vs_P_NEB('/home/niflheim/madkru/2D_Ferroelectrics/tree/AB/GeS/Ge2S2-ecbb7c185669') 

        fig, ax = plt.subplots()
        arr_lena = mpimg.imread('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/Ge2S2nonpolarinset.png')
        imagebox = OffsetImage(arr_lena, zoom=0.65)
        ab = AnnotationBbox(imagebox, (80, 3), frameon=False)
        arr_lena2 = mpimg.imread('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/Ge2S2polarinset.png')
        imagebox2 = OffsetImage(arr_lena2, zoom=0.65)
        ab2 = AnnotationBbox(imagebox2, (405, 27.5), frameon=False)
        ax.text(200, 2.35, 'Ge$_{2}$S$_{2}$', fontdict=None, fontsize=28)
        ax.set_xlabel('Polarization [pC/m]')
        ax.set_ylabel(r'Energy [meV/Å${^2}$]')
        ax.plot(polarization_path*(1e3), (1e3)*energy_path,'--', linewidth=1.5, color='grey')
        ax.plot(polarization_path_neb*(1e3), (1e3)*energy_path_neb, '-', color='blue')
        ax.legend(['LI', 'NEB'], bbox_to_anchor=(0.26, 0.92))
        ax.add_artist(ab)
        ax.add_artist(ab2)
        fig.tight_layout()
        
        fig.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/E_vs_P_with_insert_Ge2S2-ecbb7c185669.png')
        fig.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/E_vs_P_with_insert_Ge2S2-ecbb7c185669.pdf')
        plt.close()

    if os.path.exists('/home/niflheim/madkru/2D_Ferroelectrics/tree/AB2/InTe2/In2Te4-3d54cc8ff54d/results-asr.polarization_path2.json'):
                
        energy_path, polarization_path = E_vs_P('/home/niflheim/madkru/2D_Ferroelectrics/tree/AB2/InTe2/In2Te4-3d54cc8ff54d') 
        energy_path_neb, polarization_path_neb = E_vs_P_NEB('/home/niflheim/madkru/2D_Ferroelectrics/tree/AB2/InTe2/In2Te4-3d54cc8ff54d') 
        
        
        fig, ax = plt.subplots()
        arr_lena = mpimg.imread('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/In2Te4nonpolar.png')
        imagebox = OffsetImage(arr_lena, zoom=0.05)
        ab = AnnotationBbox(imagebox, (15, 2.8), frameon=False)
        arr_lena2 = mpimg.imread('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/In2Te4polar.png')
        imagebox2 = OffsetImage(arr_lena2, zoom=0.05)
        ab2 = AnnotationBbox(imagebox2, (240, 2.8), frameon=False)
        ax.text(195, 5, 'In$_{2}$Te$_{4}$', fontdict=None, fontsize=28)
        ax.set_xlabel('Polarization [pC/m]')
        ax.set_ylabel(r'Energy [meV/Å${^2}$]')
        ax.plot(polarization_path*(1e3), (1e3)*energy_path,'--', linewidth=1.5, color='grey')
        ax.plot(polarization_path_neb*(1e3), (1e3)*energy_path_neb, '-', color='blue')
        ax.legend(['LI', 'NEB'], loc='upper left')
        ax.add_artist(ab)
        ax.add_artist(ab2)
        fig.tight_layout()
                
        fig.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/E_vs_P_with_insert_In2Te4-3d54cc8ff54d.png')
        fig.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/E_vs_P_with_insert_In2Te4-3d54cc8ff54d.pdf')
        plt.close()
                
    if os.path.exists('/home/niflheim/madkru/2D_Ferroelectrics/tree/ABC/FLiS/F2Li2S2-46174a65d380/results-asr.polarization_path2.json'):
                
        energy_path, polarization_path = E_vs_P('/home/niflheim/madkru/2D_Ferroelectrics/tree/ABC/FLiS/F2Li2S2-46174a65d380') 
        energy_path_neb, polarization_path_neb = E_vs_P_NEB('/home/niflheim/madkru/2D_Ferroelectrics/tree/ABC/FLiS/F2Li2S2-46174a65d380') 
        
        fig, ax = plt.subplots()

        arr_lena = mpimg.imread('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/F2Li2S2nonpolar0x0y.png')
        imagebox = OffsetImage(arr_lena, zoom=0.06)
        ab = AnnotationBbox(imagebox, (10, 0.75), frameon=False)
        arr_lena2 = mpimg.imread('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/F2Li2S2polar0x0y.png')
        imagebox2 = OffsetImage(arr_lena2, zoom=0.06)
        ab2 = AnnotationBbox(imagebox2, (105, 4), frameon=False)
        ax.set_xlabel('Polarization [pC/m]')
        ax.set_ylabel(r'Energy [meV/Å${^2}$]')
        ax.text(25, 0.65, 'F$_{2}$Li$_{2}$S$_{2}$', fontdict=None, fontsize=28)
        ax.plot(polarization_path*(1e3), (1e3)*energy_path,'--', linewidth=1.5, color='grey')
        ax.plot(polarization_path_neb*(1e3), (1e3)*energy_path_neb, '-', color='blue')
        ax.legend(['LI', 'NEB'], loc='upper left')
        ax.add_artist(ab)
        ax.add_artist(ab2)
        fig.tight_layout()
                
        fig.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/E_vs_P_with_insert_F2Li2S2-46174a65d380.png')
        fig.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/E_vs_P_with_insert_F2Li2S2-46174a65d380.pdf')
        plt.close()


    plt.rcParams['font.family'] = 'serif'
    plt.rcParams['font.serif'] = ['Times New Roman'] + plt.rcParams['font.serif']
    plt.rcParams['axes.labelsize'] = 'large'
    plt.rcParams['font.size'] = 12
    if os.path.exists('/home/niflheim/madkru/2D_Ferroelectrics/tree/A2B3/As2Se3/As4Se6-b8c4c860d745/results-asr.polarization_path2.json'):
                
        a, Pa, Pb, Pc  = plot_polarizations('/home/niflheim/madkru/2D_Ferroelectrics/tree/A2B3/As2Se3/As4Se6-b8c4c860d745') 
        
        n=8
        ticks = np.linspace(-1,1,5)
        plt.figure()        
        for x in np.linspace(0, 2*n,2*n+1):
            x = int(x)
            if not x == n:
                plt.plot(a, Pa[x], '--', color='grey')
            if x == n:
                plt.plot(a, Pa[n], '-b', linewidth=3)
        plt.xlabel('$\lambda$')
        plt.ylabel('Polarization')
        plt.xlim([-1,1])
        plt.ylim([-4,4])
        plt.xticks(ticks)
        plt.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/Polarization_shifted_As4Se6-b8c4c860d745.png')
        plt.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/Polarization_shifted_As4Se6-b8c4c860d745.pdf')
        plt.close()

        

    if os.path.exists('/home/niflheim/madkru/2D_Ferroelectrics/tree/A2B3/As2Se3/As4Se6-b8c4c860d745/results-asr.polarization_path2.json'):
                
        a, Pa, Pb, Pc  = plot_polarizations('/home/niflheim/madkru/2D_Ferroelectrics/tree/A2B3/As2Se3/As4Se6-b8c4c860d745') 
        
        n=8
        ticks = np.linspace(-1,1,5)
        plt.figure()        
        for x in np.linspace(0, 2*n,2*n+1):
            x = int(x)
            if x == n:
                plt.plot(a, Pa[x], '--', color='black')
            if not x == n:
                plt.plot(a, Pa[x], '--', color='grey')
            if x == n:
                #plt.plot(a[:8], Pa[n][:8], '-bo', linewidth=3)
                #plt.plot(a[8], Pa[n][8]-2, '-ro', linewidth=3)
                #plt.plot(a[8], Pa[n][8]-1, '-ro', linewidth=3)
                #plt.plot(a[8], Pa[n][8], '-ro', linewidth=3)
                #plt.plot(a[8], Pa[n][8]+1, '-ro', linewidth=3)
                #plt.plot(a[8], Pa[n][8]+2, '-ro', linewidth=3)
                
                #plt.plot(a[0], Pa[n][0], '-bo', linewidth=3)

                plt.plot(a[7], Pa[n][7]-3, '-ro', linewidth=3)
                plt.plot(a[7], Pa[n][7]-2, '-ro', linewidth=3)
                plt.plot(a[7], Pa[n][7]-1, '-ro', linewidth=3)
                plt.plot(a[7], Pa[n][7], '-ro', linewidth=3)
                plt.plot(a[7], Pa[n][7]+1, '-ro', linewidth=3)
                plt.plot(a[7], Pa[n][7]+2, '-ro', linewidth=3)
                plt.plot(a[7], Pa[n][7]+3, '-ro', linewidth=3)
                plt.plot(a[7], Pa[n][7]+4, '-ro', linewidth=3)
                plt.plot(a[7], Pa[n][7]+5, '-ro', linewidth=3)
                plt.plot(a[7], Pa[n][7]+6, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]-5, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]-4, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]-3, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]-2, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]-1, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15], '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]+1, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]+2, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]+3, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]+4, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]+5, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]+6, '-ro', linewidth=3)
                plt.plot(a[15], Pa[n][15]+7, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]-7, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]-6, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]-5, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]-4, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]-3, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]-2, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]-1, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22], '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]+1, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]+2, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]+3, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]+4, '-ro', linewidth=3)
                plt.plot(a[22], Pa[n][22]+5, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]-8, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]-7, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]-6, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]-5, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]-4, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]-3, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]-2, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]-1, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28], '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]+1, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]+2, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]+3, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]+4, '-ro', linewidth=3)
                plt.plot(a[28], Pa[n][28]+5, '-ro', linewidth=3)

                plt.plot(a[0], Pa[n][0], '-bo', linewidth=3)
                plt.plot(a[7], Pa[n][7]-2, '-bo', linewidth=3)
                plt.plot(a[15], Pa[n][15]-4, '-bo', linewidth=3)
                plt.plot(a[22], Pa[n][22]-6, '-bo', linewidth=3)
                plt.plot(a[28], Pa[n][28]-7, '-bo', linewidth=3)
                


        plt.xlabel('$\lambda$')
        #plt.ylabel('Polarization [ea/V]')
        plt.ylabel('Polarization')
        plt.xlim([-1.1,1.1])
        plt.ylim([-4,4])
        plt.xticks(ticks)
        #plt.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/Polarization_shifted_thesis_As4Se6-b8c4c860d745.png')
        plt.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/Polarization_shifted_thesis_As4Se6-b8c4c860d745.pdf')
        plt.close()


    if os.path.exists('/home/niflheim/madkru/2D_Ferroelectrics/tree/A2B3/As2Se3/As4Se6-b8c4c860d745/results-asr.polarization_path2.json'):
                
        a, Pa, Pb, Pc  = plot_polarizations('/home/niflheim/madkru/2D_Ferroelectrics/tree/A2B3/As2Se3/As4Se6-b8c4c860d745') 
        
        n=8
        ticks = np.linspace(-1,1,5)
        plt.figure()        
        for x in np.linspace(0, 2*n,2*n+1):
            x = int(x)
            if x == n:
                plt.plot(a, Pa[x], '--', color='black')
            if not x == n:
                plt.plot(a, Pa[x], '--', color='grey')
            if x == n:
                plt.plot(a[:16], Pa[n][:16], '-bo', linewidth=3)
                plt.plot(a[16], Pa[n][16]-2, '-ro', linewidth=3)
                plt.plot(a[16], Pa[n][16]-1, '-ro', linewidth=3)
                plt.plot(a[16], Pa[n][16], '-ro', linewidth=3)
                plt.plot(a[16], Pa[n][16]+1, '-ro', linewidth=3)
                plt.plot(a[16], Pa[n][16]+2, '-ro', linewidth=3)
 
        plt.xlabel('$\lambda$')
        #plt.ylabel('Polarization [ea/V]')
        plt.ylabel('Polarization')
        plt.xlim([-1.1,1.1])
        plt.ylim([-4,4])
        plt.xticks(ticks)
        #plt.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/Polarization_shifted_thesis2_update_As4Se6-b8c4c860d745.png')
        plt.savefig('/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures/Polarization_shifted_thesis2_As4Se6-b8c4c860d745.pdf')
        plt.close()

