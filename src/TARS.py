#!/usr/bin/python

import sys, os
from os.path import *
from pprint import pprint
from shutil import copyfile

NOCONFIRM = False

def print_help():
    msg = r"""
    -c <folder-dir>       Copys all files inside <folder-dir> to its destination
                          indicated in its first or second line.
                          Pattern is:
                          location : <abs-path>

    -i <pkgs-list>        Installs all pkgs listed inside <pkgs-list> file. Put
                          a comment and all subsequent lines will be concatened
                          with the pkg manager indicated.
                          # <pkg-manager and args>

    -h                    Show this help.
    """
    print(msg)
    sys.exit()

def run(command, args):
    cmd = ""
    if isinstance(args, list):
        cmd = f'{command} {" ".join(args)}'
    else:
        if len(args) <= 1: return
        cmd = f'{command} {args}'

    if NOCONFIRM or str(input(f"Do you wish run this command? (y/n) \n{cmd}  ")).lower() == 'y':
        os.system(cmd)


def install_pkgs(pkgs_file: str = "") -> bool:
    pkg_manager_with_args = ""
    default_pkgs = ['pacman', 'apt', 'apt-get', 'trizen', 'yay']
    pkgs_list = list()
    flag = 0
    with open(pkgs_file, 'r') as f:
        for line in f.readlines():
            line = line.strip()
            if '#' in line:
                if flag == 1: run(pkg_manager_with_args, pkgs_list)

                pkg_manager_with_args = line.split('#')[-1].strip()

                if any(df_pkg in pkg_manager_with_args for df_pkg in default_pkgs):
                    pkgs_list = list()
                    flag = 1
                else:
                    flag = 2
                    continue
            else:
                pkgs_list.append(line)

            if flag == 2:
                run(pkg_manager_with_args, line)

        if flag == 1: run(pkg_manager_with_args, pkgs_list)


    return True


def copy_files(input_dir: str = "") -> bool:
    input_dir = abspath(input_dir)
    input_dir += '/' if input_dir[-1] != '/' else ''

    files = [input_dir+file for file in os.listdir(input_dir) if isfile(input_dir+file)]

    for file in files:
        with open(file, 'r') as f:
            for i,line in enumerate(f.readlines()):
                if i >= 5: break
                if 'location' in line:
                    location = line.split(':')[-1].strip()

                    if not exists(dirname(location)):
                        os.makedirs(dirname(location))

                    print(file, '\t\t', location)
                    copyfile(file, location)
                    break

    return True



def main():
    argv = sys.argv

    if '-h' in argv:
        print_help()

    if '-i' in argv:
        pkgs_file = argv[ argv.index('-i')+1 ]
        install_pkgs(pkgs_file)

    if '-c' in argv:
        config_folders = argv[ argv.index('-c')+1 ]
        copy_files(config_folders)

    if '--noconfirm' in argv:
        NOCONFIRM = True


if __name__ == '__main__':
    main()
