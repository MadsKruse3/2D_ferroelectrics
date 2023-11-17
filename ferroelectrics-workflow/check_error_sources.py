from pathlib import Path
import os, logging
import numpy as np

from asr.core import read_json
from asr.utils.symmetry import atoms2symmetry

from ase.io import read

from gpaw import GPAW

from evgraf import find_inversion_symmetry

def verify_neb(folder):
    """Check to see if the polarizations from different Nudged Elastic Band (NEB) calculations are identical or not."""
    data1 = read_json(f"{folder}/results-asr.polarization_path.json")
    data2 = read_json(f"{folder}/results-asr.polarization_path2.json")
    P1 = data1["P_tot"]
    P2 = data2["P_tot"]
    if not np.allclose(P1,P2, rtol=0, atol=0.02):
        return False
    
    Px = data2["Px_path"]
    Py = data2["Py_path"]
    Pz = data2["Pz_path"]
    Ptot = []
    for i in np.arange(len(Px)):
        Ptot.append(np.sqrt((Px[i]-Px[0])**2 + (Py[i]-Py[0])**2 + (Pz[i]-Pz[0])**2 ))
    for i in np.arange(len(Ptot)-1):
        if (Ptot[i+1] - Ptot[i]) < 0:
            if not np.allclose( (Ptot[i+1] - Ptot[i]) , 0, rtol=0, atol=0.001):
                return False    
    return True

def get_polarization_direction(folder):
    """Get the direction of polarization for the polar materials."""
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
        pol_in_plane = np.array(data_pol["Px"]**2 + data_pol["Py"]**2)
        pol_out_of_plane = abs(data_pol["Pz"])
        pol_tot = data_pol["P_tot"]
        pol = [pol_in_plane, pol_out_of_plane, pol_tot]
    return config, pol

def get_pyroelectric_direction(folder):
    """For the materials that are non-polar but 
    still pyroeletric check the orientation of the polar axis."""
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
    return gaps

def check_polarization_errors(folder):
    """Check the polarization calculations to see if there is any errors."""
    if os.path.exists(f"{folder}/asr.polarization_path.state"):
        list_of_files = os.listdir(f"{folder}")
        job_numbers = []
        for fil in list_of_files:
            if fil.startswith("asr.polarization_path."):
                if fil.endswith("err"):
                    job_number = fil.split('.', 3)
                    job_numbers.append(job_number[2])

        mq_job_id = max(job_numbers)
        dpath = f"{folder}/asr.polarization_path.{mq_job_id}.err"
 
        with open(f'{folder}/asr.polarization_path.{mq_job_id}.err', 'r') as read_obj:
            error_lines = []
            for line in read_obj:
                if 'assert np.all(kpt.f_n[:nocc] > 1e-6' in line:
                    return 'state is metallic'
              
                if 'assert np.allclose(M, calc.get_magnetic_moment(), atol=0.05)' in line:
                    return 'state is metallic'
    
                if 'assert np.allclose(np.sum(nocc_s), nvalence' in line:
                    return 'state is metallic'

                if 'Check if the polarization along the a axis has discontinuity' in line:
                    return 'discontinuous polarization path'
                 
                if 'Check if the polarization along the b axis has discontinuity' in line:
                    return 'discontinuous polarization path'
                 
                if 'Check if the polarization along the c axis has discontinuity' in line:
                    return 'discontinuous polarization path'
                 
                if 'gpaw.KohnShamConvergenceError: Did not converge!' in line:
                    return 'One of the DFT calculations did not converge'

            return 'Some other error is present' 
    return []

def check_relaxation_errors(folder):
    """Check the relaxation calculations to see if there is errors."""
    if not os.path.exists(f"{folder}/centrosymmetric_structure/result-asr.relax.json"):
        list_of_files = os.listdir(f"{folder}/centrosymmetric_structure")
        job_numbers = []
        for fil in list_of_files:
            if fil.startswith("asr.relax."):
                if fil.endswith("err"):
                    job_number = fil.split('.', 3)
                    job_numbers.append(job_number[2])

        mq_job_id = max(job_numbers)
        dpath = f"{folder}/centrosymmetric_structure/asr.relax.{mq_job_id}.err" 
        with open(f'{folder}/centrosymmetric_structure/asr.relax.{mq_job_id}.err', 'r') as read_obj:
            error_lines = []
            for line in read_obj:
                if 'gpaw.KohnShamConvergenceError: Did not converge!' in line:
                    return 'One of the DFT calculations did not converge'
                    
                if 'gpaw.utilities.AtomsTooClose: Atoms are too close' in line:
                    return 'Atoms too close to each other'
                
                if 'ValueError: Some atom is too close to the zero-boundary!' in line:
                    return 'Atoms too close to zero boundary'

                if 'RuntimeError: Broken symmetry!' in line:
                    return 'Broken Symmetry'
            
            return 'Some other error is present' 
    return []

def check_neb_path_errors(folder):
    """Check the Nudged Elastic Band (NEB) calculations."""
    if not os.path.exists(f"{folder}/result-asr.neb_path.json"):
        list_of_files = os.listdir(f"{folder}")
        job_numbers = []
        for fil in list_of_files:
            if fil.startswith("asr.neb_path."):
                if fil.endswith("err"):
                    job_number = fil.split('.', 3)
                    job_numbers.append(job_number[2])

        if not len(job_numbers) == 0:
            mq_job_id = max(job_numbers)
            dpath = f"{folder}/asr.neb_path.{mq_job_id}.err" 
            with open(f'{folder}/asr.neb_path.{mq_job_id}.err', 'r') as read_obj:
                error_lines = []
                for line in read_obj:
                    if 'gpaw.KohnShamConvergenceError: Did not converge!' in line:
                        return 'One of the DFT calculations did not converge'
                    
                    if 'slurmstepd: error: *** JOB' in line:
                        return 'TIMEOUT error'
  
                    if 'ValueError: Images have different boundary conditions' in line:
                        return 'boundary error'
              
                    if 'RuntimeError: Parallel NEB failed!' in line:
                        return 'Parallel NEB failed!'

                return 'Some other error is present' 
    return []

def check_polar_symmetry(folder):
    """Check wheter material is polar or not."""
    polar_pointgroups = [1, 2, 3, 4, 6, "m", "mm2", "3m", "4mm", "6mm"]
    data = read_json(f"{folder}/results-asr.structureinfo.json")
    pointgroup = data["pointgroup"]
    if pointgroup in polar_pointgroups:
        return True
    else:
        return False
    
def check_inversion_symmetry(folder):
    """Check for inversion symmetry."""
    data = read_json(f"{folder}/results-asr.structureinfo.json")
    invsym = data["has_inversion_symmetry"]
    return invsym

def check_phonons(folder):
    """Check wheter the phonon calculations completed or not."""
    if os.path.exists(f"{folder}/centrosymmetric_structure/results-asr.phonons_new.FAILED"):
        list_of_files = os.listdir(f"{folder}/centrosymmetric_structure")
        job_numbers = []
        for fil in list_of_files:
            if fil.startswith("asr.phonons_new."):
                if fil.endswith("err"):
                    job_number = fil.split('.', 3)
                    job_numbers.append(job_number[2])

        mq_job_id = max(job_numbers)
        dpath = f"{folder}/centrosymmetric_structure/asr.phonons_new.{mq_job_id}.err" 
        with open(f'{folder}/centrosymmetric_structure/asr.phonons_new.{mq_job_id}.err', 'r') as read_obj:
            error_lines = []
            for line in read_obj:
                if 'gpaw.KohnShamConvergenceError: Did not converge!' in line:
                    read_obj.close()
                    return 'One of the DFT calculations did not converge'
                    
            return 'Some other error is present' 
        read_obj.close()
    return []

def check_monotonicity(folder):
    """Check wheter polarization monotonically increases or not."""
    data = read_json(f"{folder}/results-asr.polarization_path.json")
    Px = data["Px_path"]
    Py = data["Py_path"]
    Pz = data["Pz_path"]
    Ptot = []

    for i in np.arange(len(Px)):
        Ptot.append(np.sqrt((Px[i]-Px[0])**2 + (Py[i]-Py[0])**2 + (Pz[i]-Pz[0])**2 ))
    for i in np.arange(len(Ptot)-1):
        if (Ptot[i+1] - Ptot[i]) < 0:
            if not np.allclose( (Ptot[i+1] - Ptot[i]) , 0, rtol=0, atol=0.001):
                return False    
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
        if (Ptot[i+1] - Ptot[i]) < 0:
            if not np.allclose( (Ptot[i+1] - Ptot[i]) , 0, rtol=0, atol=0.001):
                return False    
    return True

def polarization_quantum_comparison(folder):
    data = read_json(f"{folder}/results-asr.polarization_path.json")
    Pa = data["Pa"]
    Pb = data["Pb"]
    Pc = data["Pc"]
    
    if Pa > 1:
        return True
    if Pb > 1:
        return True
    if Pc > 1:
        return True

    return False

if __name__ == "__main__":
    from argparse import ArgumentParser

    logging.basicConfig(level=logging.INFO, 
    format='[%(asctime)s] %(levelname)s - %(message)s',
    handlers=[
    logging.StreamHandler(),  # Log to console
    logging.FileHandler('error_sources.log')  # Log to file
    ])
    logger = logging.getLogger(__name__) 

    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="Monolayer folders to analyse.")
    parser.add_argument("-z", "--dryrun", action="store_true", help="Do dry-run.")
    args = parser.parse_args()
    if len(args.folders) > 0:
        folders = [Path(x).absolute() for x in args.folders]
    else:
        folders = [Path(".").absolute()]

    convergence =  []
    convergence_relaxation = []

    error_metal_state = []
    no_gaps = []
    atoms_too_close = []

    inversion_sym = []
    non_polar = []
    almost_non_polar = []
    polar = []

    non_monotonic = []
    polarizations = []
    ferromagnets = []
    pol_pol_q = []

    FE_in_plane = []
    FE_out_of_plane = []
    FE_threedim = []

    PE_in_plane = []
    PE_out_of_plane = []
    PE_threedim = []
    
    neb_done = []
    neb_failed = []
    good_neb = []
    phonons_done = []
    phonons_failed = []

    files_exists = []

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

    folders = sort_folders_by_spacegroup(folders)

    for folder in folders:
        if check_inversion_symmetry(folder):
            inversion_sym.append(folder)
        if check_polar_symmetry(folder):
            polar.append(folder)
            error_relaxation = check_relaxation_errors(folder)
            if error_relaxation == 'Atoms too close to each other':
                atoms_too_close.append(folder)
            if error_relaxation == 'One of the DFT calculations did not converge':
                convergence_relaxation.append(folder)
            error_polarization = check_polarization_errors(folder)
            if error_polarization == 'state is metallic':
                error_metal_state.append(folder)
            if error_polarization == 'One of the DFT calculations did not converge':
                convergence.append(folder)
            if os.path.exists(f"{folder}/results-asr.polarization_path.json") and os.path.exists(f"{folder}/centrosymmetric_structure/results-asr.phonons_new.json"):
                gaps = check_gaps(folder)
                if 'No gap' in gaps:
                    no_gaps.append(folder)
                if not 'No gap' in gaps:
                    if not check_monotonicity(folder):
                        non_monotonic.append(folder)
                    polarizations.append(folder)
                    config = get_polarization_direction(folder)[0]
                    if config == 'in plane':
                        FE_in_plane.append(folder)
                    if config == 'out of plane':
                        FE_out_of_plane.append(folder)
                    if config == '3D':
                        FE_threedim.append(folder)
                    if os.path.exists(f"{folder}/results-asr.magstate.json"):
                        magstate = read_json(f"{folder}/results-asr.magstate.json")
                        magstate = magstate["magstate"]

                    if polarization_quantum_comparison(folder):
                        pol_pol_q.append(folder)

    pyroelectric = atoms_too_close + error_metal_state + no_gaps + non_monotonic + convergence + convergence_relaxation
    
    for folder in pyroelectric:
        config = get_pyroelectric_direction(folder)
        if config == 'in plane':
            PE_in_plane.append(folder)
        if config == 'out of plane':
            PE_out_of_plane.append(folder)
        if config == '3D':
            PE_threedim.append(folder)

    #print('Number of materials where atoms in the centrosymmetric structure are too close to perform a relaxation:', len(atoms_too_close))
    logger.info(f'Number of materials where atoms in the centrosymmetric structure are too close to perform a relaxation: {len(atoms_too_close)}')
    #print('Number of materials with a metallic state along the polarization path:', len(error_metal_state))
    logger.info(f'Number of materials with a metallic state along the polarization path: {len(error_metal_state)}')
    #print('Number of materials without a bandgap in one of the structures along the polarization path (not detected in reciple):', len(no_gaps))
    logger.info(f'Number of materials without a bandgap in one of the structures along the polarization path (not detected in reciple): {len(no_gaps)}')
    #print('Number of materials where a relaxation did not converge:', len(convergence_relaxation))
    logger.info(f'Number of materials where a relaxation did not converge: {len(convergence_relaxation)}')
    #print('Number of materials where a polarization calculation did not converge:', len(convergence))
    logger.info(f'Number of materials where a polarization calculation did not converge: {len(convergence)}')
    #print('Number of materials with a polarization which is not monotonically increasing:', len(non_monotonic))
    logger.info(f'Number of materials with a polarization which is not monotonically increasing: {len(non_monotonic)}')
    #print('Number of materials with a polarization calculation:', len(polarizations))
    logger.info(f'Number of materials with a polarization calculation: {len(polarizations)}')

    #print('Total number of materials:', len(folders))
    logger.info(f'Total number of materials: {len(folders)}')
    #print('Number of ferromagnetic materials with a polarization:', len(ferromagnets))
    logger.info(f'Number of ferromagnetic materials with a polarization: {len(ferromagnets)}')
    #print('Materials where polarization exceeds polarization quantum:', len(pol_pol_q))
    logger.info(f'Materials where polarization exceeds polarization quantum: {len(pol_pol_q)}')

    #print('Phonons done:', len(phonons_done))
    logger.info(f'Phonons done: {len(phonons_done)}')
    #print('Phonons failed:', len(phonons_failed))
    logger.info(f'Phonons failed: {len(phonons_failed)}')
    #print('NEB done:', len(neb_done))
    logger.info(f'NEB done: {len(neb_done)}')
    #print('good NEB:', len(good_neb))
    logger.info(f'good NEB: {len(good_neb)}')
    #print('Pyroelectric materials:', len(atoms_too_close) + len(error_metal_state) + len(no_gaps) + len(non_monotonic) + len(convergence) + len(convergence_relaxation))
    logger.info(f'Pyroelectric materials: {len(atoms_too_close) + len(error_metal_state) + len(no_gaps) + len(non_monotonic) + len(convergence) + len(convergence_relaxation)}')
    #print('Pyroelectric materials in plane:', len(PE_in_plane))
    logger.info(f'Pyroelectric materials in plane: {len(PE_in_plane)}')
    #print('Pyroelectric materials out of plane:', len(PE_out_of_plane))
    logger.info(f'Pyroelectric materials out of plane: {len(PE_out_of_plane)}')
    #print('Pyroelectric materials 3D:', len(PE_threedim))
    logger.info(f'Pyroelectric materials 3D: {len(PE_threedim)}')
    #print('Ferroelectric materials in plane:', len(FE_in_plane))
    logger.info(f'Ferroelectric materials in plane: {len(FE_in_plane)}')
    #print('Ferroelectric materials out of plane:', len(FE_out_of_plane))
    logger.info(f'Ferroelectric materials out of plane: {len(FE_out_of_plane)}')
    #print('Ferroelectric materials 3D:', len(FE_threedim))
    logger.info(f'Ferroelectric materials 3D: {len(FE_threedim)}')
    #print('Inversion symmetric materials:', len(inversion_sym))
    logger.info(f'Inversion symmetric materials: {len(inversion_sym)}')
    #print('Polar materials:', len(polar))
    logger.info(f'Polar materials: {len(polar)}')

    materials_accounted_for =  almost_non_polar + atoms_too_close + error_metal_state + no_gaps + convergence + convergence_relaxation + polarizations 
    materials_not_accounted_for = []
    for folder in polar:
        if not folder in materials_accounted_for:
            materials_not_accounted_for.append(folder)
            
    #print('Polar materials accounted for:', len(materials_accounted_for))
    logger.info(f'Polar materials accounted for: {len(materials_accounted_for)}')
    #print('Polar materials not accounted for:', len(materials_not_accounted_for))
    logger.info(f'Polar materials not accounted for: {len(materials_not_accounted_for)}')