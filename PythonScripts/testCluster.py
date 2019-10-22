#!/usr/bin/env python
# coding: utf-8

import sys

args = sys.argv
n_args = len(args[1:])

assert (n_args==3), "Please give `$(pwd)`, data folder name, and the number from `CollectAndSortFiles.sh`."

project_folder = args[1]
theName = args[2]

import re
project_folder = re.sub('PythonScripts$', '', project_folder)

# The `.csv`-file will be in path:
path2csv = project_folder + "{}/Data_Collection.csv".format(theName)
path2out = project_folder + "{}/outputs/".format(theName)

n_perm = int(args[3])            # Number of ways in which to combine the protonation states of the single molecules forming a neutral cluster

print("Project folder:",project_folder)
print("Data folder:",theName)
print("CSV file:",path2csv)
print("Permutations:",n_perm)
print("""

Welcome to Clusterin'Clusters!
Please enjoy your coffee while we take care of your clusters...

You will find the results in {}

"We're a lighthouse, your call."

""".format(path2out))
