import numpy as np
import sys

"""
usage:
> python replacer.py <rough xyzfile> <precise xyzfile> <path to new xyz file>

"""

def read_xyz(xyzpath):
    with open(xyzpath) as f:
        xyz = f.read().strip()
        xyz = xyz.split("\n")[2:]
        xyz = [row.strip() for row in xyz]
    return xyz

def replace_with_more_accurate(c_rough, c_full, threshold=0.01):
    c_rough = c_rough[:]
    already_visited = []
    for i1, row1 in enumerate(c_rough):
        coord1 = np.asfarray(row1.split()[1:])
        for i2, row2 in enumerate(c_full):
            if i2 in already_visited:
                continue
            coord2 = np.asfarray(row2.split()[1:])
            d = np.linalg.norm(coord1 - coord2)
            if d<threshold:
                already_visited.append(i2)
                c_rough[i1] = row2
                continue
    return c_rough

def write_xyz(outf, xyzstring):
    xyzf = "{}\n\n{}".format(len(xyzstring), "\n".join(xyzstring))
    with open(outf, 'w') as f:
        f.write(xyzf)

c_rough = read_xyz(sys.argv[1])
c_full = read_xyz(sys.argv[2])
outf = sys.argv[3]

c_new = replace_with_more_accurate(c_rough, c_full)

write_xyz(outf, c_new)