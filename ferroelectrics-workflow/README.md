**Getting Started:**

1: Start by running the script generate_polar_db.py. This will pick out the dynamically stable polar materials from c2db.db.

2: Unfold polar.db into a tree. 

3. Now run the script unwrap_structure.py in each folder. This script will create a subfolder for each folder called "centrosymmetric_structure". The subfolder contains a unrelaxed.json file which contains an atoms object which is the closest centrosymmetric structure found from the original structure.json file. 

Furthermore the script also adds another filed unrelaxed.json (to the folder not the subfolder). We need this for the relaxation part of the workflow.

Now that everything is setup, we can continue with the workflow.

**Ferroelectrics Workflow:**

The workflow to run the workflow type in: 
"mq workflow <PathTobilayerworkflow Repo>/ferroelectrics_workflow.py tree/ * / * / * /".

The workflow performs 2 relaxations: One for the polar structure, and one for the non-polar structure. Subsequently the workflow runs computes the polarization path, that is the formal polarization at each step along an adiabatic path connecting the centrosymmetric and noncentrosymmetric structures.  

