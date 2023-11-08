from ase.phonons import Phonons
from pathlib import Path
import os, re, sys, latextable
from asr.core import read_json
import matplotlib.pyplot as plt
import numpy as np
from ase.io import read
from evgraf import find_inversion_symmetry
from ase.units import kJ
from tabulate import tabulate
from texttable import Texttable
from asr.utils.symmetry import atoms2symmetry
import math
from fractions import Fraction

def verify_neb(folder):
    data1 = read_json(f"{folder}/results-asr.polarization_path.json")
    data2 = read_json(f"{folder}/results-asr.polarization_path2.json")
    P1 = data1["P_tot"]
    P2 = data2["P_tot"]
    #if not np.allclose(P1,P2, rtol=0, atol=0.02):
    #    return False
    
    #Px = data2["Px_path"]
    #Py = data2["Py_path"]
    #Pz = data2["Pz_path"]
    #Ptot = []
    #for i in np.arange(len(Px)):
    #    Ptot.append(np.sqrt((Px[i]-Px[0])**2 + (Py[i]-Py[0])**2 + (Pz[i]-Pz[0])**2 ))
    #for i in np.arange(len(Ptot)-1):
    #    if (Ptot[i+1] - Ptot[i]) < 0:
    #        if not np.allclose( (Ptot[i+1] - Ptot[i]) , 0, rtol=0, atol=0.001):
    #            return False    
    return True
            
def get_topological_polarization(folder):
    
    fractions = [-5/3, -3/2, -4/3, -1, -2/3, -1/2, -1/3, 0, 1/3, 1/2, 2/3, 1, 4/3, 3/2, 5/3]
    fractions_string = ['-2/3', '-1/2', '-1/3', 0, '-2/3', '-1/2', '-1/3', 0, '1/3', '1/2', '2/3', 0, '1/3', '1/2', '2/3']
    data_pol = read_json(f"{folder}/results-asr.polarization_path.json")

    Pa = data_pol["Pa_path"][-1]
    distance = abs(fractions - Pa)
    smallest_dist = np.argmin(distance)
    pol_top_a = fractions_string[smallest_dist]

    Pb = data_pol["Pb_path"][-1]
    distance = abs(fractions - Pb)
    smallest_dist = np.argmin(distance)
    pol_top_b = fractions_string[smallest_dist]

    return pol_top_a, pol_top_b

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
                 [0, 0, -1]],
                 [[-1, 1, 0],
                 [0, 1, 0],
                 [0, 0, -1]],
                 [[0, -1, 0],
                 [-1, 0, 0],
                 [0, 0, -1]],
                 [[0, 1, 0],
                 [1, 0, 0],
                 [0, 0, -1]]]

    atom = read(f"{folder}/structure.json")
    data = atoms2symmetry(atom, tolerance=0.1, angle_tolerance=1) ## tolerance = 0.1 and angle_tolerance = 0.1 in the old version
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

    data_pol = read_json(f"{folder}/results-asr.polarization_path.json")
    if config == 'in plane':
        pol = data_pol["P_tot"]
    if config == 'out of plane':
        pol = abs(data_pol["Pz"])
    if config == '3D':
        pol_in_plane = np.sqrt(data_pol["Px"]**2 + data_pol["Py"]**2)
        pol_out_of_plane = abs(data_pol["Pz"])
        pol_tot = data_pol["P_tot"]
        pol = [pol_in_plane, pol_out_of_plane, pol_tot]
    return config, pol

def get_proper_chemical_symbols(name):
    #name = get_proper_symbolic_order(name)
    new_word = ''
    for x in name:
        if x.isdigit():
            new_word += '$'
            new_word += '_'
            new_word += '{'
            new_word += f'{x}'
            new_word += '}'
            new_word += '$'
        else:
            new_word += f'{x}'
    return new_word

def get_proper_symbolic_order(name):
    name = split_name(name)

    TM = ['Sc', 'Ti', 'V', 'Cr', 'Mn', 'Fe', 'Co', 'Ni',
          'Cu', 'Zn', 'Y', 'Zr', 'Nb', 'Mo', 'Tc', 'Ru',
          'Rh', 'Pd', 'Ag', 'Cd', 'Lu', 'Hf', 'Ta', 'W',
          'Re', 'Os', 'Ir', 'Pt', 'Au', 'Hg']
    
    TM_indices = []
    TM_material = False
    for x in name:
        if x in TM:
            TM_material = True
            index = name.index(x)
            TM_indices.append(index)
            if name[index+1].isdigit():
                TM_indices.append(index+1)
    if not TM_material:
        return name
    new_name = []
    i = -1
    for x in name:
        i += 1
        if i in TM_indices:
            new_name.append(x)
    i = -1
    for x in name:
        i += 1
        if not i in TM_indices:
            new_name.append(x)
    return new_name
    
def split_name(name):

    digit_indices = [[i, c] for i, c in enumerate(f'{name}') if c.isdigit()] 
    
    indices = [index[0] for index in digit_indices]

    if not len(indices) == 0:
        corrected_indices = []
        corrected_indices.append(0)
        for index in indices:
            corrected_indices.append(index)
            corrected_indices.append(index+1)

        corrected_indices = list(dict.fromkeys(corrected_indices))
        parts = [name[i:j] for i,j in zip(corrected_indices, corrected_indices[1:]+[None])] 
        parts.pop(-1)
        adjacent_numbers = []
        for x in parts:
            index = parts.index(x)
            if not index == (len(parts)-1):
                if x.isdigit() and parts[index+1].isdigit():
                    adjacent_numbers.append([index,index+1])
  
        for x, y in adjacent_numbers:
            new_element = parts[x]+parts[y]
            parts[x] = new_element
            parts.pop(y)
        
        split_elements = []
        
        for x in parts:
            j = -1
            if len(x) > 2:
                index = parts.index(x)
                for y in x:
                    j += 1
                    if y.isupper():
                        index_upper = j
                        if not index_upper == len(x)-1:
                            next_letter=x[index_upper+1]
                            if not str(next_letter).isupper():
                                split_elements.append(y+x[index_upper+1])
                            else:
                                split_elements.append(y)
                        if index_upper == len(x)-1:
                            split_elements.append(y)
                i = 0
                for element in split_elements:
                    i += 1
                    parts.insert(index+i, element)
                parts.pop(index)

        
    if len(indices) == 0:
        parts = []
        for x in name:
            index = name.index(x)
            if x.isupper():
                index_upper = name.index(x)
                if not index_upper == len(name)-1:
                    next_letter=name[index_upper+1]
                    if not str(next_letter).isupper():
                        parts.append(x+name[index_upper+1])
                    else:
                        parts.append(x)
                if index_upper == len(name)-1:
                    parts.append(x)
    return parts

def get_proper_spacegroup(spg):
    new_spg = ''
    for x in spg:
        if x in '_':
            new_spg += '$'
            new_spg += '_'
            new_spg += '{'
            index = spg.index(x)
            new_spg += f'{spg[index+1]}'
            new_spg += '}'
            new_spg += '$'
        if 'index' in locals():
            if x == spg[index+1]:
                continue
        else:
            new_spg += f'{x}'
    return new_spg

def check_gaps(folder):
    #lambdas = np.linspace(1, 18, 18)
    lambdas = range(1,19)
    gaps = []
    for x in lambdas:
        dpath = f'{folder}/neb_structure_{x}.txt'
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

def get_stability(folder):
    max_energy_diff = []
    data = read_json(f"{folder}/results-asr.polarization_path.json")
    energy_path = data["E"]
    energy_diff = energy_path[0]-energy_path[-1]
    for x in energy_path:
        max_energy_diff.append(max([abs(y-x) for y in energy_path]))
    max_energy_diff = max(max_energy_diff)    
    comparison = max_energy_diff-energy_diff

    if np.allclose(comparison,0,atol=1e-4):
        return True
    else:
        return False

def sort_folders_by_spacegroup(folders):
    spacegroups = []
    for folder in folders:
        structure_data = read_json(f"{folder}/results-asr.structureinfo.json")
        stoichiometry = structure_data["stoichiometry"]
        spacegroup = structure_data["spglib_dataset"]["international"]
        spacegroups.append([folder, stoichiometry, spacegroup])

    #spacegroups = sorted(spacegroups, key=lambda x: x[1])
    spacegroups = sorted(spacegroups, key=lambda x: x[2])
    folders = []
    for spacegroup in spacegroups:
        folders.append(spacegroup[0])

    return folders
        
def analyze_phonons(folder):    
    os.chdir(f"{folder}/centrosymmetric_structure/")

    atom = read(f'structure.json')
    ph = Phonons(atom, supercell=(1,1,1))    
    ph.read(acoustic=True, symmetrize=5)
                
    branch = 0
    q_c = [0, 0, 0]
    images = 30

    #ph.write_modes(q_c=q_c, branches=branch, nimages=images)
    w_l = ph.band_structure([[0, 0, 0]])
    min_E = min(min(w_l)) 

    return min_E

def verify_polarization(folder):
    if os.path.isfile(f"{folder}/results-asr.polarization_path.json"):
        data = read_json(f"{folder}/results-asr.polarization_path.json")
    else:
        return False
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
    #for i in np.arange(len(Pa)-1):
    #    if abs(Pa[i+1]-Pa[i]) > 1/4:
    #        return False
    #    if abs(Pb[i+1]-Pb[i]) > 1/4:
    #        return False
    #    if abs(Pc[i+1]-Pc[i]) > 1/4:
    #        return False
    
    if np.allclose(pol, 0, atol=0.01) and np.allclose(1e3*(Ebarrier/A), 0, atol=0.01) and np.allclose(rmsd, 0,atol=0.01):                
        #return 'Most likely non polar'
        return False
    return True

def get_gradients_NEB(folder):

    atom = read(f'{folder}/structure.json')
    n = len(atom)
    #cell_vc = atom.get_cell().T
    cell_vc = atom.get_cell().T*1e-10
    A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))
        
    data = read_json(f"{folder}/results-asr.polarization_path2.json")
    a = getattr(data, 'data')
    pol = a["P_tot"]
    Px_path = a["Px_path"]
    Py_path = a["Py_path"]
    Pz_path = a["Pz_path"]
    Ptot_path = []
    for x in np.arange(len(Px_path)):
        Ptot_path.append(np.sqrt((Px_path[x]-Px_path[0])**2 + (Py_path[x]-Py_path[0])**2 + (Pz_path[x]-Pz_path[0])**2))
    E = a["E"]
    path_points = a["path_points"]
    
    #Ptot_path = np.array(Ptot_path)*(1e-7)*A
    #E = np.array(E)*(1/kJ)*(1e-3)
    
    P = np.array(Ptot_path)*(1e-7)*A ## Convert units from nC/m to C*cm (A has units of m^2) 
    E = np.array(E)*(1/kJ) ## Convert from eV to J and from J to kJ

    Coercive_fields_NEB = []    
    for i in np.arange(1,len(E)-1):
        Coercive_fields_NEB.append( (1/2)*((E[i+1]-E[i])/(P[i+1]-P[i]) + (E[i]-E[i-1])/(P[i]-P[i-1])) )

    Coercive_fields_NEB = np.array(Coercive_fields_NEB)
    Coercive_field_NEB = np.max(np.abs(Coercive_fields_NEB)) ## kV/cm
    Coercive_field_NEB = Coercive_field_NEB*(1e-4) ## V/nm
 
    return Coercive_field_NEB

def check_polar_symmetry(folder):
    polar_pointgroups = [1, 2, 3, 4, 6, "m", "mm2", "3m", "4mm", "6mm"]
    data = read_json(f"{folder}/results-asr.structureinfo.json")
    pointgroup = data["pointgroup"]
    if pointgroup in polar_pointgroups:
        return True
    else:
        return False

def get_energy_barrier(folder):
    
    polarization_data = read_json(f"{folder}/results-asr.polarization_path.json")
    energies = polarization_data["E"]
    emax = max(energies)
    emin = min(energies)
    Ebarrier = emax-emin
    return Ebarrier

if __name__ == "__main__":
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="folders to analyse.")

    args = parser.parse_args()
    
    if len(args.folders) > 0:
        folders = [Path(x).absolute() for x in args.folders]
    else:
        folders = [Path(".").absolute()]

    folders = sort_folders_by_spacegroup(folders)
    #number_of_materials = []
    #number_of_in_plane_materials = []
    number_of_out_of_plane_materials = []
    #number_of_3D_materials = []
    

    original_stdout = sys.stdout
    os.chdir("/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures")    

    with open('out_of_plane_materials.txt','w') as f2:
        rows = []
        row = []

        row.append('Name')
        row.append('Spacegroup')
        row.append('P$_{\perp}$ $[\\text{pC}/\\text{m}]$')
        row.append('P$_{\\text{top}}$')
        row.append('$\Delta\\text{E}$ $[\\text{meV}/\\text{Å}^2]$')
        row.append('$\mathcal{E}_{\\text{c}}$ $[\\text{V}/\\text{nm}]$')
        row.append('Gap [eV]')
        row.append('EH $[\\text{eV}/\\text{atom}]$')
        row.append('ID')
  
        rows.append(row)
        
        for folder in folders:   
            row = []
            name = re.split('[/]',f'{folder}')[-1]
            name = re.split('[-]', f'{name}')[0]
            if check_polar_symmetry(folder):
                if os.path.isfile(f"{folder}/results-asr.polarization_path.json"): 
                    if str(get_polarization_direction(folder)[0]) == 'out of plane':
                        if check_gaps(folder):                            
                            polarization_data = read_json(f"{folder}/results-asr.polarization_path.json")
                            pol = get_polarization_direction(folder)[1]
                            pol = (1e3)*pol/2 ## Convert to pC/m and get P_{0} (what is calculated is 2P because the path is from -P to P for out of plane materials)
                            pol_top  = get_topological_polarization(folder)
                            #energy_barrier = polarization_data['E_barrier']
                            energy_barrier = get_energy_barrier(folder)
                            gap_data = read_json(f"{folder}/results-asr.gs.json")
                            gap = gap_data["gap"]
                            #coercive_fields = get_gradients_NEB(folder)
                            #phonon_energy = analyze_phonons(folder)

                            atom = read(f"{folder}/structure.json")
                            cell_vc = atom.get_cell().T
                            A = np.linalg.norm(np.cross(cell_vc[0], cell_vc[1]))
                            rmsd = find_inversion_symmetry(atom).rmsd

                            foldername = "/".join([x for x in re.split('[/]', f'{folder}')[-3:] if x != ""][-3:])
                            C2DB_ASR_tree_path = "/home/niflheim2/cmr/C2DB-ASR/tree/" + foldername                
                            C2DB_ASR_icsd_cod_path = "/home/niflheim2/cmr/C2DB-ASR/icsd_cod_materials/tree/" + foldername

                            structure_data = read_json(f"{folder}/results-asr.structureinfo.json")
                            spacegroup = structure_data["spglib_dataset"]["international"]
                            name = structure_data["formula"]
                            name = get_proper_chemical_symbols(name)
                            spacegroup = get_proper_spacegroup(spacegroup)
                            #phonon_energy = (1e3)*phonon_energy
                            energy_barrier = (1e3)*(energy_barrier/A)
                            
                            #if phonon_energy > -1:
                            #    phonon_energy = 0.0

                            row.append(name)
                            row.append(spacegroup)
                            
                            row.append(str("{:#.3g}".format(pol)).rstrip('.'))
                            row.append((pol_top[0], pol_top[1]))
                            row.append(str("{:#.3g}".format(energy_barrier)).rstrip('.'))
                            if os.path.isfile(f"{folder}/results-asr.polarization_path2.json"):
                                if verify_neb(folder):
                                    coercive_fields = get_gradients_NEB(folder)
                                    row.append(str("{:#.3g}".format(coercive_fields)).rstrip('.'))
                                else:
                                    row.append('-')
                            else:
                                row.append('-')
                            #row.append(str("{:#.3g}".format(coercive_fields)).rstrip('.'))
                            row.append(str("{:#.2g}".format(gap)).rstrip('.'))
                            #row.append(str("{:#.3g}".format(phonon_energy)).rstrip('.'))

                            #path = None
                            #if os.path.isfile(f"{C2DB_ASR_tree_path}/info.json"):
                            #    path = f"{C2DB_ASR_tree_path}"
                            #if os.path.isfile(f"{C2DB_ASR_icsd_cod_path}/info.json"):
                            #    path = f"{C2DB_ASR_icsd_cod_path}"

                            #convex_hull_data = read_json(f"{path}/results-asr.convex_hull.json")
                            convex_hull_data = read_json(f"{folder}/results-asr.convex_hull.json")
                            convex_hull = convex_hull_data["ehull"]
                            if convex_hull < 0:
                                convex_hull = 0.0
                            row.append(str("{:#.1g}".format(convex_hull)).rstrip('.'))
                            
                            if os.path.isfile(f"{folder}/info.json"):
                                info_data = read_json(f"{folder}/info.json")
                                try:
                                    ID = info_data["cod_id"]
                                    row.append(ID)
                                except KeyError:
                                    try:
                                        ID = info_data["icsd_id"]
                                        row.append(ID)
                                    except KeyError:
                                        row.append('-')
                            else:
                                row.append('-')

                            number_of_out_of_plane_materials.append(1)
                            #number_of_materials.append(1)
                            if not len(row) == 0:
                                rows.append(row)
                    
        sys.stdout = f2
        table = Texttable()
        table.set_cols_align(["c"] * 9)
        table.set_deco(Texttable.HEADER | Texttable.VLINES)
        format_array = ["t", "t", "t", "a", "t", "t", "t", "t", "t"] 
        table.set_cols_dtype(format_array)
        table.set_precision(3)
        table.add_rows(rows)
        print('\nTabulate Latex:')
        print(tabulate(rows, headers='firstrow', tablefmt='latex'))
        print('\nTexttable Latex:')
        print(latextable.draw_latex(table, caption="""The table contains materials which 
        have a polarization component out of plane only. The columns show material names, 
        spacegroups, out of plane spontaneous polarization, energy differences, coercive fields,
        band gaps in the polar structure, phonon energies of the lowest phonon mode at the
        $\Gamma$-point of the non-polar structure, energy above convex hull and finally the ICSD or COD id.""",  label="""tab:out-of-plane"""))

    sys.stdout = original_stdout
    f2.close()

print(len(number_of_out_of_plane_materials))    



    
