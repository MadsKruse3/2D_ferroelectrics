from ase.db import connect

db = connect('c2db-first-class-20210115.db')

## See Table 1 in: 'Symmetry breaking in moleuclar ferroelectrics'.
## The list below contain spacegroups derived from the 
## 10 polar point groups: C_1, C_2, C_1h, C_2v, C_4, C_4v, C_3, C_3v, C_6, C_6v.

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
             
             
polar_rows = []

#for row in db.select('gap>0', dynamic_stability_level=3):
#for row in db.select('gap>0', 'dynamic_stability_stiffness: high', 'dynamic_stability_phonons: high'):
for row in db.select('gap>0'):
    if row.spacegroup in polar_spg:
        polar_rows.append(row)

#print(len(polar_rows))

stable_rows = []
for row in polar_rows:

    a = row.get('dynamic_stability_phonons')
    b = row.get('dynamic_stability_stiffness')
    if a == 'high' and b == 'high': 
    #if a == 3:
        stable_rows.append(row)

print(len(stable_rows))

with connect('c2db_polar_test.db') as polardb:
    for row in stable_rows:
        polardb.write(atoms=row.toatoms(), key_value_pairs=row.key_value_pairs, data=row.data)

