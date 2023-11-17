import os, sys
from pathlib import Path
import numpy as np

def remove_formal(folder, dryrun=False):

    f1 = f"{folder}/info.json"
    #f1 = f"{folder}/centrosymmetric_structure/results-asr.phonopy.json"
    #f1 = f"{folder}/results-asr.structureinfo.json"
    #f1 = f"{folder}/results-asr.neb_path.json"
    #f1 = f"{folder}/results-asr.polarization_path.json"
    #f1 = f"{folder}/results-asr.polarization_path2.json"

    if os.path.exists(f1): 
        if not dryrun:
            print(f"Removing {f1}")
            os.remove(f1)
        else:
            print(f"Would remove {f1}")

if __name__ == "__main__":¨
    """Remove result files in folders where the calculations were run by accident
    (typically because the material turned out the be non-polar) """
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="Bilayer folder to cleanup.")
    parser.add_argument("-z", "--dryrun", action="store_true", help="Do dry-run.")
    args = parser.parse_args()
    
    if len(args.folders) > 0:
        folders = [Path(x).absolute() for x in args.folders]
    else:
        folders = [Path(".").absolute()]
        
    for folder in folders:
        remove_formal(folder, args.dryrun)