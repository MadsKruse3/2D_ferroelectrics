"""Script that produces the table in the Supplementary material in in https://www.nature.com/articles/s41524-023-00999-5"""

from pathlib import Path
import os, re, sys, latextable
import numpy as np

from asr.core import read_json

from ase.io import read

from tabulate import tabulate
from texttable import Texttable

def get_proper_chemical_symbols(name):
    #name = get_proper_symbolic_order(name)
    new_word = ''
    for x in name:
        index = name.index(x)
        try:
            y = name[index+1]
            if name[index+1].isdigit() and x.isdigit():
                new_word += '$'
                new_word += '_'
                new_word += '{'
                new_word += f'{x}'
                new_word += f'{y}'
                new_word += '}'
                new_word += '$'
                continue
        except:
            pass
        if x.isdigit():
            if name[index-1].isdigit():
                continue
            new_word += '$'
            new_word += '_'
            new_word += '{'
            new_word += f'{x}'
            new_word += '}'
            new_word += '$'
        if not x.isdigit():
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

def sort_folders_by_spacegroup(folders):
    spacegroups = []
    for folder in folders:
        structure_data = read_json(f"{folder}/results-asr.structureinfo.json")
        stoichiometry = structure_data["stoichiometry"]
        spacegroup = structure_data["spglib_dataset"]["international"]
        spacegroups.append([folder, stoichiometry, spacegroup])

    spacegroups = sorted(spacegroups, key=lambda x: x[2])
    folders = []
    for spacegroup in spacegroups:
        folders.append(spacegroup[0])

    return folders
        
def check_polar_symmetry(folder):
    polar_pointgroups = [1, 2, 3, 4, 6, "m", "mm2", "3m", "4mm", "6mm"]
    data = read_json(f"{folder}/results-asr.structureinfo.json")
    pointgroup = data["pointgroup"]
    if pointgroup in polar_pointgroups:
        return True
    else:
        return False

def countX(lst, x):
    count = 0
    for ele in lst:
        if (ele == x):
            count = count + 1
    return count

def get_symbolic_numbers(symbols):    
    symbolic_number = []
    symbols_added = []
    for i in range(0, len(symbols)):
        count_s = countX(symbols_added, symbols[i])
        symbolic_number.append(1 + count_s)
        symbols_added.append(symbols[i])
        

    for i in range(0, len(symbols)):
        symbols[i] = f'{symbols[i]}' + f'{symbolic_number[i]}'            
    return symbols

def format_data(a1, a2, a3, pos):
    for i in range(0, len(a1)):
        a1[i] = str("{:#.3f}".format(a1[i])).rstrip('.')
        a2[i] = str("{:#.3f}".format(a2[i])).rstrip('.')
        a3[i] = str("{:#.3f}".format(a3[i])).rstrip('.')

    for i in range(0, len(pos)):
        x = pos[i]
        for j in range(0, len(x)):
            pos[i][j] = str("{:#.3f}".format(pos[i][j])).rstrip('.')

    return tuple(a1), tuple(a2), tuple(a3), pos

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
    number_of_materials = []
    
    original_stdout = sys.stdout
    cwd = os.getcwd()
    os.chdir(cwd + '/plots_and_figures')
    
    with open('supplementary_materials.txt', 'w') as f1:        
        rows = []
        row = []

        row.append('Name')
        row.append('Unit cell vectors [Å]')
        row.append('Atomic positions [Å]')

        rows.append(row)
        for folder in folders:
            row = []
            if check_polar_symmetry(folder):
                if os.path.isfile(f"{folder}/results-asr.polarization_path.json"): 
                    if check_gaps(folder):
                        atom = read(f"{folder}/structure.json")
                        cell_vc = atom.get_cell().T
                        
                        a1 = cell_vc[0]
                        a2 = cell_vc[1]
                        a3 = cell_vc[2]
                        
                        structure_data = read_json(f"{folder}/results-asr.structureinfo.json")
                        name = structure_data["formula"]
                        name = get_proper_chemical_symbols(name)

                        pos = atom.get_positions()
                        symbols = atom.get_chemical_symbols()
                        symbols = get_symbolic_numbers(symbols)
                    
                        a1, a2, a3, pos = format_data(a1, a2, a3, pos)

                        positions = []
                        for i in range(0, len(symbols)):
                            if not i % 3 == 0:
                                positions.append(f'{symbols[i]}:' + f'{tuple(pos[i])}')
                            if i % 3 == 0:
                                positions.append(f'{symbols[i]}:' + f'{tuple(pos[i])}' + '\\' + '\\')

                        table_pos = '\makecell{'
                        for i in positions:
                            table_pos = table_pos + ' '+ i
                        table_pos = table_pos + ' '+ '}'
                        
                        row.append(name)
                        row.append('\makecell{' + 'a1:' + f'{a1}' + '\\' + '\\' + 'a2:' f'{a2}' + '\\' + '\\' + 'a3:' + f'{a3}' + '}')
                        row.append(table_pos)

                        number_of_materials.append(1)
                        if not len(row) == 0:
                            rows.append(row)
                            
                
        sys.stdout = f1
        table = Texttable()
        table.set_cols_align(["c"] * 3)
        #table.set_deco(Texttable.HEADER | Texttable.VLINES | Texttable.HLINES)
        table.set_deco(Texttable.HEADER | Texttable.VLINES | Texttable.HLINES | Texttable.BORDER)
        format_array = ["t", "t", "t"] 
        table.set_cols_dtype(format_array)
        table.set_precision(3)
        table.add_rows(rows) 
        print('\nTabulate Latex:')
        print(tabulate(rows, headers='firstrow', tablefmt='latex'))
        print('\nTexttable Latex:')
        print(latextable.draw_latex(table, caption="""The table contains materials contained in tables I, II and III in the main text.
        The columns show material names, lattice vectors, atomic positions, and unique ID.""", label="""tab:supp-table""")) 

    sys.stdout = original_stdout
    f1.close()
    
print(len(number_of_materials))