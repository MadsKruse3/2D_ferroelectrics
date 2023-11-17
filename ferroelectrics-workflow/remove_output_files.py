import os, sys
from pathlib import Path
import numpy as np

from ase.io import read

def remove_formal(folder, dryrun=False):

    if os.path.exists(f'{folder}/structure.json'):
        atom = read(f'{folder}/structure.json')

        f0 = f"{folder}/neb_structure_*.gpw"

        if os.path.exists(f0): 
            if not dryrun:
                print(f"Removing {f0}")
                os.remove(f0))
            else:
                print(f"Would remove {f0}")


#        f0 = f"{folder}/phonon.eq.pckl"
#        if os.path.exists(f0): 
#            if not dryrun:
#                print(f"Removing {f0}")
#                os.remove(f0)
#            else:
#                print(f"Would remove {f0}")

#        for i in np.linspace(0, points-1, points):
#            j = int(i)

#            f1 = f"{folder}/phonon.{j}x+.pckl"
#            f2 = f"{folder}/phonon.{j}x-.pckl"
#            f3 = f"{folder}/phonon.{j}y+.pckl"
#            f4 = f"{folder}/phonon.{j}y-.pckl"
#            f5 = f"{folder}/phonon.{j}z+.pckl"
#            f6 = f"{folder}/phonon.{j}z-.pckl"

#            if os.path.exists(f1): 
#                if not dryrun:
#                    print(f"Removing {f1}")
#                    os.remove(f1)
#                else:
#                    print(f"Would remove {f1}")

#            if os.path.exists(f2): 
#                if not dryrun:
#                    print(f"Removing {f2}")
#                    os.remove(f2)
#                else:
#                    print(f"Would remove {f2}")

#            if os.path.exists(f3): 
#                if not dryrun:
#                    print(f"Removing {f3}")
#                    os.remove(f3)
#                else:
#                    print(f"Would remove {f3}")

#            if os.path.exists(f4): 
#                if not dryrun:
#                    print(f"Removing {f4}")
#                    os.remove(f4)
#                else:
#                    print(f"Would remove {f4}")

#            if os.path.exists(f5): 
#                if not dryrun:
#                    print(f"Removing {f5}")
#                    os.remove(f5)
#                else:
#                    print(f"Would remove {f5}")

#            if os.path.exists(f6): 
#                if not dryrun:
#                    print(f"Removing {f6}")
#                    os.remove(f6)
#                else:
#                    print(f"Would remove {f6}")


#        for i in np.linspace(0, 99, 100):
#            j = int(i)
            
#            f1 = f"{folder}/phonons.{j}+.json"
#            f2 = f"{folder}/phonons.{j}-.json"
      

#            if os.path.exists(f1): 
#                if not dryrun:
#                    print(f"Removing {f1}")
#                    os.remove(f1)
#                else:
#                    print(f"Would remove {f1}")

#                if os.path.exists(f2):
#                    if not dryrun:
#                        print(f"Removing {f2}")
#                        os.remove(f2)
#                else:
#                    print(f"Would remove {f2}")


#            if os.path.exists(f"{folder}/phonon/"):
#                if not dryrun:
#                    print(f"Removing {folder}/phonon/")
#                    os.rmdir(f"{folder}/phonon/")
#                else:
#                    print(f"Would remove {folder}/phonon/")

#        if os.path.exists(f'{folder}/phonon/'):
#            os.chdir(f"{folder}/phonon")
#            f0 = "cache.eq.json"
#            if os.path.exists(f0): 
#                if not dryrun:
#                    print(f"Removing {f0}")
#                    os.remove(f0)
#                else:
#                    print(f"Would remove {f0}")
        
#            for i in np.linspace(0, points-1, points):
#                j = int(i)    

#                f1 = f"cache.{j}x+.json"
#                f2 = f"cache.{j}x-.json"
#                f3 = f"cache.{j}y+.json"
#                f4 = f"cache.{j}y-.json"
#                f5 = f"cache.{j}z+.json"
#                f6 = f"cache.{j}z-.json"
#                if os.path.exists(f1): 
#                    if not dryrun:
#                        print(f"Removing {f1}")
#                        os.remove(f1)
#                    else:
#                        print(f"Would remove {f1}")
#                if os.path.exists(f2): 
#                    if not dryrun:
#                        print(f"Removing {f2}")
#                        os.remove(f2)
#                    else:
#                        print(f"Would remove {f2}")
#                if os.path.exists(f3): 
#                    if not dryrun:
#                        print(f"Removing {f3}")
#                        os.remove(f3)
#                    else:
#                        print(f"Would remove {f3}")
#                if os.path.exists(f4): 
#                    if not dryrun:
#                        print(f"Removing {f4}")
#                        os.remove(f4)
#                    else:
#                        print(f"Would remove {f4}")
#                if os.path.exists(f5): 
#                    if not dryrun:
#                        print(f"Removing {f5}")
#                        os.remove(f5)
#                    else:
#                        print(f"Would remove {f5}")
#                if os.path.exists(f6): 
#                    if not dryrun:
#                        print(f"Removing {f6}")
#                        os.remove(f6)
#                    else:
#                        print(f"Would remove {f6}")

if __name__ == "__main__":
    """Remove any memory heavy files (like .gpw) that might be leftover from failed calculations."""
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("folders", nargs="*", help="folders to cleanup.")
    parser.add_argument("-z", "--dryrun", action="store_true", help="Do dry-run.")
    args = parser.parse_args()

    if len(args.folders) > 0:
        folders = [Path(x).absolute() for x in args.folders]
    else:
        folders = [Path(".").absolute()]
        

    for folder in folders:
        remove_formal(folder, args.dryrun)
