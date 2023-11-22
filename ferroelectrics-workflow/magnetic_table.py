""" Script used to generate Table IV in:
https://www.nature.com/articles/s41524-023-00999-5"""

from pathlib import Path
import os
import re
import sys
import numpy as np

from ase.io import read

from asr.core import read_json
from asr.utils.symmetry import atoms2symmetry

from tabulate import tabulate
from texttable import Texttable
import latextable


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
    data = atoms2symmetry(atom, tolerance=0.1, angle_tolerance=1)
    # tolerance = 0.1 and angle_tolerance = 0.1 in the old version
    pointgroup = data.dataset['pointgroup']
    config = ''
    if pointgroup in polarpointgroups1:
        data = read_json(f"{folder}/results-asr.structureinfo.json")
        rot_matrices = data["spglib_dataset"]["rotations"]
        for x in rot_matrices:
            for y in rotations:
                if np.array_equal(x, y):
                    config = '$\parallel$'
        if config == '':
            config = '3D'
    if pointgroup in polarpointgroups2:
        config = '$\perp$'
    return config


def get_spin_fraction(spin):
    fractions = [-2, -3/2, -1, -1/2, 0, 1/2, 1, 3/2, 2]
    fractions_string = ['-2', '-3/2', '-1', '-1/2', 0, '1/2', '1', '3/2', '2']

    distance = abs(np.array(fractions) - spin)
    smallest_dist = np.argmin(distance)
    spin_frac = fractions_string[smallest_dist]
    return spin_frac


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


def get_proper_chemical_symbols(name):
    name = get_proper_symbolic_order(name)
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
            try:
                name[index+1].isdigit()
                if name[index+1].isdigit():
                    TM_indices.append(index+1)
            except Exception:
                continue
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
        if i not in TM_indices:
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
        parts = [name[i:j] for i, j in zip(corrected_indices, corrected_indices[1:]+[None])]
        parts.pop(-1)
        adjacent_numbers = []
        for x in parts:
            index = parts.index(x)
            if not index == (len(parts)-1):
                if x.isdigit() and parts[index+1].isdigit():
                    adjacent_numbers.append([index, index+1])

        if len(adjacent_numbers) == 1:
            for x, y in adjacent_numbers:
                new_element = parts[x]+parts[y]
                parts[x] = new_element
                parts.pop(y)

        if len(adjacent_numbers) > 1:
            correction_index = 1
            for z in adjacent_numbers:
                correction_index += -1
                new_element = parts[z[0] + correction_index] + parts[z[1] + correction_index]
                parts[z[0] + correction_index] = new_element
                parts.pop(z[1] + correction_index)

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
                            next_letter = x[index_upper + 1]
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
                    next_letter = name[index_upper + 1]
                    if not str(next_letter).isupper():
                        parts.append(x+name[index_upper+1])
                    else:
                        parts.append(x)
                if index_upper == len(name)-1:
                    parts.append(x)
    return parts


def sort_folders_by_spacegroup(folders):
    spacegroups = []
    for folder in folders:
        if os.path.isfile(f"{folder}/results-asr.structureinfo.json"):
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


def check_polar_symmetry(folder):
    polar_pointgroups = [1, 2, 3, 4, 6, "m", "mm2", "3m", "4mm", "6mm"]
    data = read_json(f"{folder}/results-asr.structureinfo.json")
    pointgroup = data["pointgroup"]
    if pointgroup in polar_pointgroups:
        return True
    else:
        return False


def check_magnetism(folder):
    data = read_json(f"{folder}/results-asr.magstate.json")
    magnetism = data["is_magnetic"]
    return magnetism


def check_stability(folder):
    #foldername = "/home/niflheim2/cmr/C2DB-ASR/tree/" + "/".join([x for x in re.split('[/]', f'{folder}')[-3:] if x != ""][-3:])
    #if os.path.isfile(f"{foldername}/results-asr.stiffness.json") and os.path.isfile(f"{foldername}/results-asr.phonons.json"):
    if os.path.isfile(f"{folder}/results-asr.stiffness.json") and os.path.isfile(f"{folder}/results-asr.phonons.json"):
        data = read_json(f"{folder}/results-asr.stiffness.json")
        data2 = read_json(f"{folder}/results-asr.phonons.json")
        dyn_stab_stiffness = data["dynamic_stability_stiffness"]
        dyn_stab_phonons = data2["dynamic_stability_phonons"]
        if dyn_stab_stiffness == 'high' and dyn_stab_phonons == 'high':
            return True
        else:
            return False
    if not os.path.isfile(f"{folder}/results-asr.stiffness.json") or not os.path.isfile(f"{folder}/results-asr.phonons.json"):
        return False


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
    os.chdir("/home/niflheim/madkru/2D_Ferroelectrics/plots_and_figures")

    with open('magnetic_materials.txt', 'w') as f1:
        rows = []
        row = []

        row.append('Name')
        row.append('Spacegroup')
        row.append('Gap [eV]')
        row.append('J [meV]')
        row.append('Spin')
        row.append('Axis')
        row.append('EH $[\\text{eV}/\\text{atom}]$')
        row.append('ID')

        rows.append(row)
        for folder in folders:
            row = []
            if os.path.isfile(f"{folder}/results-asr.structureinfo.json"):
                if check_stability(folder):
                    if check_polar_symmetry(folder):
                        if check_magnetism(folder):
                            gap_data = read_json(f"{folder}/results-asr.gs.json")
                            gap = gap_data["gap"]
                            if gap > 0.01:
                                foldername = "/".join([x for x in re.split('[/]', f'{folder}')[-3:] if x != ""][-3:])
                                C2DB_ASR_tree_path = "/home/niflheim2/cmr/C2DB-ASR/tree/" + foldername
                                C2DB_ASR_icsd_cod_path = "/home/niflheim2/cmr/C2DB-ASR/icsd_cod_materials/tree/" + foldername
                                structure_data = read_json(f"{folder}/results-asr.structureinfo.json")
                                spacegroup = structure_data["spglib_dataset"]["international"]

                                name = structure_data["formula"]
                                name = get_proper_chemical_symbols(name)
                                spacegroup = get_proper_spacegroup(spacegroup)

                                row.append(name)
                                row.append(spacegroup)
                                row.append(str("{:#.2g}".format(gap)).rstrip('.'))
                                if os.path.isfile(f"{folder}/results-asr.exchange.json"):
                                    exchange_data = read_json(f"{folder}/results-asr.exchange.json")
                                    exchange = exchange_data["J"]
                                    spin = exchange_data["spin"]
                                    spin = get_spin_fraction(spin)
                                    row.append(str("{:#.2g}".format(exchange)).rstrip('.'))
                                    row.append(spin)

                                if not os.path.isfile(f"{folder}/results-asr.exchange.json"):
                                    row.append('-')
                                    row.append('-')

                                config = get_polarization_direction(folder)
                                row.append(f'{config}')
                                #if os.path.isfile(f"{C2DB_ASR_tree_path}/info.json"):
                                #    path = f"{C2DB_ASR_tree_path}"
                                #if os.path.isfile(f"{C2DB_ASR_icsd_cod_path}/info.json"):
                                #    path = f"{C2DB_ASR_icsd_cod_path}"

                                #path = False
                                #if os.path.isfile(f"{folder}/info.json"):
                                #    path = f"{folder}"

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

                                number_of_materials.append(folder)
                                if not len(row) == 0:
                                    rows.append(row)

        sys.stdout = f1
        table = Texttable()
        table.set_cols_align(["c"] * 8)
        table.set_deco(Texttable.HEADER | Texttable.VLINES)
        format_array = ["t", "t", "t", "t", "t", "t", "t", "t"]
        table.set_cols_dtype(format_array)
        table.set_precision(3)
        table.add_rows(rows)
        print('\nTabulate Latex:')
        print(tabulate(rows, headers='firstrow', tablefmt='latex'))
        print('\nTexttable Latex:')
        print(latextable.draw_latex(table, caption="""The table contains polar
        magnetic materials which may be ferroelectric, but are not captured
        by the workflow. The columns show material names, spacegroups,
        band gaps, nearest neighbor exchange interactions, spin, direction
        of polarization, energy above convex hull and finally the ICSD or
        COD id.""",  label="""tab:magnets"""))

        sys.stdout = original_stdout

        f1.close()
        print(len(number_of_materials))
