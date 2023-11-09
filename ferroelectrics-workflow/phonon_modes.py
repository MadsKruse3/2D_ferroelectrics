from pathlib import Path
import os, re

import matplotlib.pyplot as plt
import numpy as np

from gpaw import GPAW

from asr.core import read_json
from asr.utils.symmetry import atoms2symmetry

from ase.phonons import Phonons
from ase.spacegroup import get_spacegroup, Spacegroup
from ase.units import kB, kJ
from ase.io.trajectory import TrajectoryWriter
from ase.io import read, iread

def get_polarization_direction(folder):
    polarpointgroups1 = ['1', '2', 'm', 'mm2']
    polarpointgroups2 = ['3', '3m', '4', '4mm', '6', '6mm']
    rotations = [[[1, 0, 0],
                 [0, 1, 0],
                 [0, 0, -1]],
                 [[-1, 0, 0],
                 [0, 1, 0],
                 [0, 0, -1]],
                 [[1, 0, 0],
                 [0, -1, 0],
                 [0, 0, -1]]]

    atom = read(f"{folder}/structure.json")
    data = atoms2symmetry(atom, tolerance=0.1, angle_tolerance=0.1)
    pointgroup = data.dataset['pointgroup']                   
    config = ''
    if pointgroup in polarpointgroups1:
        data = read_json(f"{folder}/results-asr.structureinfo.json")
        rot_matrices = data["spglib_dataset"]["rotations"]
        for x in rot_matrices:
            for y in rotations:
                if np.array_equal(x,y):
                    config = 'in plane'
        if config == '':
            config = '3D'
    if pointgroup in polarpointgroups2:
        config = 'out of plane'
    
    return config

def check_polar_symmetry(folder):
    polar_pointgroups = [1, 2, 3, 4, 6, "m", "mm2", "3m", "4mm", "6mm"]
    data = read_json(f"{folder}/results-asr.structureinfo.json")
    pointgroup = data["pointgroup"]
    if pointgroup in polar_pointgroups:
        return True
    else:
        return False

def get_energies(folder):
    max_energy_diff = []
    name = re.split('[/]',f'{folder}')[-2]
    for sf in os.listdir(str(folder)):
        os.chdir(folder)
        dpath = f'{sf}'
        if dpath == 'results-asr.polarization_path.json':
            data = read_json(dpath)
            a = getattr(data, 'data')
            energy_path = a["E"]
            energy_diff = energy_path[0]-energy_path[-1]
            for x in energy_path:
                max_energy_diff.append(max([abs(y-x) for y in energy_path]))
            max_energy_diff = max(max_energy_diff)    
    
    comparison = max_energy_diff-energy_diff
    comparison_name = {f'{name}': comparison}

    return max_energy_diff, energy_diff, comparison, comparison_name

def analyze_phonons(folder):

    dpath = f"{folder}/centrosymmetric_structure/results-asr.phonons_new.json"

    data = read_json(dpath)
    eigenvalues = data["omega_kl"]
    eigenvalues = eigenvalues[0]

    return eigenvalues

def get_energy_curvature_NEB(folder):

    atom = read(f'{folder}/structure.json')
    n = len(atom)
    cell_vc = atom.get_cell().T
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))
    
    x = 16
    x = x + 2
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
    neb_path2 = -neb_path[::-1]
    neb_path2 = np.delete(neb_path2, -1)
    neb_path2 = list(neb_path2)
    for i in neb_path:
        neb_path2.append(i)
    neb_path = neb_path2 
    
    energies2 = energies[::-1]
    energies2.pop(-1)
    energies = energies2 + energies
    E2 = read_json(f'{folder}/results-asr.polarization_path2.json')["E"]

    E = np.array(energies)
    energy_slope = []
    
    for i in np.arange(1,len(E)-1):
        energy_slope.append( (1/2)*((E[i+1]-E[i])/(neb_path[i+1]-neb_path[i]) + (E[i]-E[i-1])/(neb_path[i]-neb_path[i-1])) )

    neb_path.pop(-1)
    neb_path.pop(0)
    
    energy_curvature = []
    for i in np.arange(1,len(energy_slope)-1):
        energy_curvature.append( (1/2)*((energy_slope[i+1]-energy_slope[i])/(neb_path[i+1]-neb_path[i]) + (energy_slope[i]-energy_slope[i-1])/(neb_path[i]-neb_path[i-1])) )

    energy_curvature = energy_curvature[int((len(energy_curvature)-1)/2)] ## (len(E)-1)/2 ??
    return energy_curvature

def get_energy_curvature(folder):

    atom = read(f'{folder}/structure.json')
    n = len(atom)
    cell_vc = atom.get_cell().T
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))
        
    data = read_json(f"{folder}/results-asr.polarization_path.json")
    a = getattr(data, 'data')
    E = a["E"]
    
    #E2 = E[::-1]
    #E2.pop(-1)
    #E = E2 + E

    path_points = a["path_points"]

    E = np.array(E)/A
    #E = np.array(E)*(1/kJ)*(1e3)/(A*(1e-2))
    energy_curvature = np.diff(E,2)
    #energy_curvature = energy_curvature[len(path_points)]
    energy_curvature = energy_curvature[0]
    
    return energy_curvature


def verify_polarization(folder):
    data = read_json(f"{folder}/results-asr.polarization_path.json")
    Pa = data["Pa_path"]
    Pb = data["Pb_path"]
    Pc = data["Pc_path"]
    pol = data["P_tot"]
    Ebarrier = data["E_barrier"]
    atom = read(f"{folder}/structure.json")
    rmsd = find_inversion_symmetry(atom).rmsd

    n = len(atom)
    cell_vc = atom.get_cell().T
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))
    for i in np.arange(len(Pa)-1):
        if abs(Pa[i+1]-Pa[i]) > 1/4:
            return False
        if abs(Pb[i+1]-Pb[i]) > 1/4:
            return False
        if abs(Pc[i+1]-Pc[i]) > 1/4:
            return False
    if np.allclose(pol, 0, atol=0.01) and np.allclose(1e3*(Ebarrier/A), 0, atol=0.01) and np.allclose(rmsd, 0, atol=0.01):                
        return False
    return True

def check_monotonicity(folder):
    data = read_json(f"{folder}/results-asr.polarization_path.json")
    Px = data["Px_path"]
    Py = data["Py_path"]
    Pz = data["Pz_path"]
    Ptot = []
    for i in np.arange(len(Px)):
        Ptot.append(np.sqrt((Px[i]-Px[0])**2 + (Py[i]-Py[0])**2 + (Pz[i]-Pz[0])**2 ))
    for i in np.arange(len(Ptot)-1):
        if (Ptot[i+1] - Ptot[i]) < 0:
            return False
        else:
            continue
    return True

def check_monotonicity_NEB(folder):
    data = read_json(f"{folder}/results-asr.polarization_path2.json")
    Px = data["Px_path"]
    Py = data["Py_path"]
    Pz = data["Pz_path"]
    Ptot = []
    for i in np.arange(len(Px)):
        Ptot.append(np.sqrt((Px[i]-Px[0])**2 + (Py[i]-Py[0])**2 + (Pz[i]-Pz[0])**2 ))
    for i in np.arange(len(Ptot)-1):
        print(Ptot[i+1] - Ptot[i])
        if (Ptot[i+1] - Ptot[i]) < 0:
            return False
        else:
            continue
    return True

def check_gaps(folder):
    lambdas = np.linspace(0, 1, 15)
    gaps = []
    for x in lambdas:
        dpath = f'{folder}/structure_{x}.txt'
        lines = []
        with open(dpath, 'r') as read_obj:                
            for line in read_obj:
                line = line.strip()
                lines.append(line)
                if 'Gap' in line:
                    newline = str(str(line).split("(")[-1]).split(",")[-1]
                    newline = str(newline).split(")")[-1]
                    gap = newline
                    gaps.append(gap)

                if 'No gap' in line:
                    newline = str(str(line).split("(")[-1]).split(",")[-1]
                    gap = newline
                    gaps.append(gap)
        read_obj.close()

    if 'No gap' in gaps:
        return False
    if not 'No gap' in gaps:
        return True

if __name__ == "__main__":
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="Monolayer folders to analyse.")

    args = parser.parse_args()
    
    if len(args.folders) > 0:
        folders = [Path(x).absolute() for x in args.folders]
    else:
        folders = [Path(".").absolute()]


    #The list below can be found in for example:
    #Chem.Soc.Rev.,2016,45,3811: "Symmetry breaking in molecular ferroelectrics"
    #DOI: 10.1039/c5cs00308c

    polar_spg = ['P1', 'P2', 'P2_1', 'C2', 'Pm', 'Pc', 
                 'Cm', 'Cc', 'Pmm2', 'Pmc2_1', 'Pcc2', 'Pma2', 
                 'Pca2_1', 'Pnc2', 'Pmn2_1', 'Pba2', 'Pna2_1', 'Pnn2',
                 'Cmm2', 'Cmc2_1', 'Ccc2', 'Amm2', 'Abm2', 'Ama2',
                 'Aba2', 'Fmm2', 'Fdd2', 'Imm2', 'Iba2', 'Ima2',
                 'P4', 'P4_1', 'P4_2', 'P4_3', 'I4', 'I4_1',
                 'P4mm', 'P4bm', 'P4_2cm', 'P4_2nm', 'P4cc', 'P4nc', 'P4_2mc',
                 'P4_2bc', 'I4mm', 'I4cm', 'I4_1md', 'I4_1cd', 
                 'P3', 'P3_1', 'P3_2', 'R3',
                 'P3m1', 'P31m', 'P3c1', 'P31c', 'R3m', 'R3c',
                 'P6', 'P6_1', 'P6_5', 'P6_2', 'P6_4', 'P6_3',
                 'P6mm', 'P6cc', 'P6_3cm', 'P6_3mc']

    
    tolerance = 0.1 ## Default is 1e-7
    #kT = 1e-7 ## Default is kB*300 (appox 25,8 meV) (0.0258) 
    
    Energy_curvature = []
    Phonon_energies = []

    Energy_curvature_neb = []
    Phonon_energies_neb = []

    energy_curvature_neb_in_plane = []
    energy_curvature_neb_out_of_plane = []
    energy_curvature_neb_3D = []
    phonon_energies_in_plane = []
    phonon_energies_out_of_plane = []
    phonon_energies_3D = []


    proper_ferroelectric = []
    other_ferroelectric = []
    metastable = []

    for folder in folders:
        if os.path.isfile(f"{folder}/results-asr.polarization_path.json"):
            if check_polar_symmetry(folder):
                if os.path.isfile(f"{folder}/centrosymmetric_structure/results-asr.phonons_new.json"):
                    #if check_monotonicity_NEB(folder):
                    #if check_monotonicity(folder):
                    if check_gaps(folder):
                        atom = read(f'{folder}/centrosymmetric_structure/structure.json')
                        os.chdir(f"{folder}/centrosymmetric_structure/")
                        
                        ph = Phonons(atom, supercell=(1,1,1))
                        ph.read(acoustic=True, symmetrize=5)
                
                        branch = 0
                        #branch = len(atom)*3-1
                        #branches = list(range(0,len(atom)*3))
                                
                        q_c = [0,0,0]
                        images = 30
                        max_energy_path, energy_diff, comparison, comparison_name = get_energies(folder)
                        energy_curvature = get_energy_curvature(folder)
                        os.chdir(f"{folder}/centrosymmetric_structure/")
                        ph.write_modes(q_c=q_c, branches=branch, nimages=images)
            
                        w_l = ph.band_structure([[0, 0, 0]])
        
                        
                        
                        #Phonon_energies.append(min(min(w_l)))
                        #if min(min(w_l)) > -0.001:
                        #    positive_phonon_energy.append(folder)
                        #else:
                        #    if comparison > 0.01:
                        #        negative_phonon_energy_abnormal_path.append(folder)
                        #    else:
                        #        negative_phonon_energy.append(folder)
                            
                        if os.path.isfile(f"{folder}/results-asr.neb_path.json"):
                            energy_curvature_neb = get_energy_curvature_NEB(folder)
                            Energy_curvature_neb.append(energy_curvature_neb)
                            Phonon_energies_neb.append(min(min(w_l)))

                            config = get_polarization_direction(folder)
                            if config == 'in plane':
                                energy_curvature_neb_in_plane.append(energy_curvature_neb)
                                phonon_energies_in_plane.append(min(min(w_l)))
                            #if config == 'out of plane':
                            #    energy_curvature_neb_out_of_plane.append(energy_curvature_neb)
                            #    phonon_energies_out_of_plane.append(min(min(w_l)))
                            if config == '3D':
                                energy_curvature_neb_3D.append(energy_curvature_neb)
                                phonon_energies_3D.append(min(min(w_l)))

                            Energy_curvature.append(energy_curvature)
                            Phonon_energies.append(min(min(w_l)))
                                #if energy_curvature_neb < -70:
                                #    print(folder)
                            if min(min(w_l)) < 0: 
                                if energy_curvature_neb > 0:
                                    metastable.append(folder)
                            if min(min(w_l)) < 0: 
                                if energy_curvature_neb < 0:
                                    pos0 = atom.get_positions()
                                    phonons = read(f'{folder}/centrosymmetric_structure/phonon.mode.{branch}.traj@-{images}:')
                                    new_phonons = TrajectoryWriter(f'new_phonon.mode.{branch}.traj','w')
                                    for x in np.arange(len(phonons)):
                                        phonon = phonons[x]
                                
                                        pos_phonon = phonon.get_positions()
                                        xmax = max([np.linalg.norm(y) for y in (pos_phonon-pos0)]) ## Maximal mode measured by eucledian norm.
                                        new_pos = ((pos_phonon-pos0)/xmax)
                                        phonon.set_positions((pos0 + new_pos))
                                        new_phonons.write(phonon)

                                    new_phonons.close()
                                    symmetry = atoms2symmetry(phonon,
                                                          tolerance=0.1,
                                                          angle_tolerance=1)
                                    
                                    dataset = symmetry.dataset
                                    sg = dataset['international']
                                    if sg in polar_spg:
                                        proper_ferroelectric.append(folder)
                                    if not sg in polar_spg:
                                        other_ferroelectric.append(folder)
                                        print(folder)
                                

    print('Proper Ferroelectric:', len(proper_ferroelectric))
    print('Other Ferroelectric:', len(other_ferroelectric))
    print('Metastable:', len(metastable))

    cwd = os.getcwd()
    os.chdir(cwd + '/plots_and_figures')

    plt.rcParams['font.family'] = 'serif'
    plt.rcParams['font.serif'] = ['Times New Roman'] + plt.rcParams['font.serif']
    plt.rcParams['axes.labelsize'] = 'large'
    plt.rcParams['font.size'] = 12
 
    plt.figure(figsize=[5, 4])
    #plt.scatter(Energy_curvature_neb, (1e3)*np.array(Phonon_energies_neb), c='b', alpha=0.5)
    l4 = plt.scatter(energy_curvature_neb_in_plane, (1e3)*np.array(phonon_energies_in_plane), c='blue', alpha=0.5)
    #l5 = plt.scatter(energy_curvature_neb_out_of_plane, (1e3)*np.array(phonon_energies_out_of_plane), c='red', alpha=0.5)
    l6 = plt.scatter(energy_curvature_neb_3D, (1e3)*np.array(phonon_energies_3D), c='orange', alpha=0.5)
    #plt.gca().legend((l4, l5, l6), ('in plane', 'out of plane', 'mixed'), loc='upper right', shadow=True)
    plt.gca().legend((l4, l6), ('in plane', 'mixed'), loc='upper right', shadow=True)
    #plt.gca().legend((l1, l2), ('NM', 'FM'), loc='upper left', shadow=True, bbox_to_anchor=(1, 1))
    #plt.xlim([-15000, 5000])
    #plt.ylim([-60, 0.0])
    plt.axhline(y=0.0, color='grey', linestyle='--')
    plt.axvline(x=0.0, color='grey', linestyle='--')
    #plt.xlabel('NEB Energy curvature [eV]')
    plt.xlabel('NEB Energy curvature [eV/$Å^{2}$]')
    plt.ylabel('Phonon energies [meV]')
    #plt.title('Phonon energies - NEB Energy curvatures scatterplot')
    plt.tight_layout()
    plt.savefig('phonon_vs_neb_curvature_energies.png')
    plt.savefig('phonon_vs_neb_curvature_energies.pdf')
    

    fig, ax = plt.subplots(figsize=[5, 4])
    l4 = ax.scatter(energy_curvature_neb_in_plane, (1e3)*np.array(phonon_energies_in_plane), c='blue', alpha=0.5)
    #l5 = ax.scatter(energy_curvature_neb_out_of_plane, (1e3)*np.array(phonon_energies_out_of_plane), c='red', alpha=0.5)
    l6 = ax.scatter(energy_curvature_neb_3D, (1e3)*np.array(phonon_energies_3D), c='orange', alpha=0.5)
    #plt.gca().legend((l4, l5, l6), ('in plane', 'out of plane', 'mixed'), loc='bottom right', shadow=True)
    #plt.gca().legend((l4, l5, l6), ('in plane', 'out of plane', 'mixed'), shadow=True, bbox_to_anchor=(0.45, 0.775))
    plt.gca().legend((l4, l6), ('in plane', 'mixed'), shadow=True, bbox_to_anchor=(0.365, 0.895))
    #ax.scatter(Energy_curvature_neb, (1e3)*np.array(Phonon_energies_neb), c='b', alpha=0.5)
    plt.xlim([-115, 30])
    #plt.ylim([-60, 0.0])
    ax.axhline(y=0.0, color='grey', linestyle='--')
    ax.axvline(x=0.0, color='grey', linestyle='--')
    #ax.set_xlabel('NEB Energy curvature [eV]')
    #ax.set_xlabel('NEB Energy curvature [eV/$Å^{2}$]')
    ax.set_xlabel('NEB Energy curvature')
    ax.set_ylabel('Phonon energies [meV]')
    
    axins = ax.inset_axes([0.02, 0.02, 0.45, 0.45])
    #axins.scatter(Energy_curvature_neb, (1e3)*np.array(Phonon_energies_neb), c='b', alpha=0.5)
    axins.scatter(energy_curvature_neb_in_plane, (1e3)*np.array(phonon_energies_in_plane), c='blue', alpha=0.5)
    #axins.scatter(energy_curvature_neb_out_of_plane, (1e3)*np.array(phonon_energies_out_of_plane), c='red', alpha=0.5)
    axins.scatter(energy_curvature_neb_3D, (1e3)*np.array(phonon_energies_3D), c='orange', alpha=0.5)
    x1, x2, y1, y2 = -8.4, 4.5, -32, 1
    axins.set_xlim(x1, x2)
    axins.set_ylim(y1, y2)
    axins.set_xticklabels([])
    axins.set_yticklabels([])
    axins.axhline(y=0.0, color='grey', linestyle='--')
    axins.axvline(x=0.0, color='grey', linestyle='--')
    ax.indicate_inset_zoom(axins, edgecolor="black")
    plt.tight_layout()
    plt.savefig('phonon_vs_neb_curvature_energies_with_insert.png')
    plt.savefig('phonon_vs_neb_curvature_energies_with_insert.pdf')
    
