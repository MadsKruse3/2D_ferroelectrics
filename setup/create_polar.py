from ase.db import connect
import logging
import sys

logging.basicConfig(level=logging.INFO, 
format='[%(asctime)s] %(levelname)s - %(message)s',
handlers=[
    logging.StreamHandler(),  # Log to console
    logging.FileHandler('polar_db.log')  # Log to file
    ])
logger = logging.getLogger(__name__)

def create_polar_db(db_name):
    try:
        db = connect(db_name)
        logger.info(f'Succesfully connected to the {db_name} database')
    except:
        logger.critical("Database file not found!")

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
    for row in db.select('gap>0'):
        if row.spacegroup in polar_spg:
            polar_rows.append(row)
    logger.info(f"The database contains a total of {len(polar_rows)} polar materials")

    stable_rows = []
    for row in polar_rows:
        a = row.get('dynamic_stability_phonons')
        b = row.get('dynamic_stability_stiffness')
        if a == 'high' and b == 'high': 
            stable_rows.append(row)
    logger.info(f"The database contains a total of {len(stable_rows)} stable polar materials")

    with connect('c2db_polar.db') as polardb:
        for row in stable_rows:
            polardb.write(atoms=row.toatoms(), key_value_pairs=row.key_value_pairs, data=row.data)

    logger.info(f"database named c2db_polar.db succesfully created")
    return     

db_name_default = 'c2db-first-class-20210115.db' 
"""Database used at the time of project completion. 
More materials have been added since.
check https://cmr.fysik.dtu.dk/c2db/c2db.html 
for an updated version."""

db_name_input = input("""Enter the name of the database 
(with a .db extension). If not the default will be 
the original database used for the project: """)

if isinstance(db_name_input, str) and db_name_input.endswith(".db"):
    db_name = db_name_input
else:
    db_name = db_name_default

create_polar_db(db_name)