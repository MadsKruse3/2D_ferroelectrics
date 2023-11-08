import numpy as np
from ase.io import read
from ase.io.trajectory import Trajectory
from evgraf import find_inversion_symmetry

## Full gs calculation needed. The forces on all atoms in these structures must be known.
#initial = read(f'centrosymmetric_structure/structure.json')
final = read('structure.json')

initial = find_inversion_symmetry(final).atoms

path_points = 30
path_points_array = np.linspace(-1, 1, path_points)

atoms_polar = read('structure.json')
atoms_non_polar = read('centrosymmetric_structure/structure.json')

p1 = atoms_non_polar.get_positions()
p2 = atoms_polar.get_positions()

p3 = p2 - p1

images = Trajectory('structures.traj', mode='w')

for x in path_points_array:
        
        p4 = p1 + p3*x
        
        atoms_polar.set_positions(p4)
        images.write(atoms_polar)

        #E.append(atoms_non_polar.get_potential_energy())
        #calc.write(f'structure_{x}.gpw', mode='all')
