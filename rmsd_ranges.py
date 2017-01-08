#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  care_gdt_ranges.py
#  
#  Copyright 2016 Carlos Eduardo Sequeiros Borja <casebor@gmail.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  


import argparse
import numpy as np
from os import path

def main():
    """ Main function """
    data = np.loadtxt(args.infile, usecols=(args.column-1,), comments="#")
    #gdts = [0]*10
    gdts = np.zeros(9)
    for value in data:
	if value <= 1.0:
	  gdts[0] += 1
	elif value <= 1.5:
	  gdts[1] += 1
	elif value <= 2.0:
	  gdts[2] += 1
	elif value <= 2.5:
	  gdts[3] += 1
	elif value <= 3.0:
	  gdts[4] += 1	  
	elif value <= 3.5:
	  gdts[5] += 1
	elif value <= 4.0:
	  gdts[6] += 1	
	elif value <= 4.5:
	  gdts[7] += 1
	elif value <= 5.0:
	  gdts[8] += 1
#	elif value > 5.0:
#	  gdts[9] += 1
#	elif value <= 2.0:
#	  gdts[2] += 1
	
#	index = int(value*10)
#	if index == 10:
#	    index = 9
#	gdts[index] += 1
    out = '# RMSD range quantity\n'
    out +=  'Treatment 0.5-1.0 1.0-1.5 1.5-2.0 2.0-2.5 2.5-3.0 3.0-3.5 3.5-4.0 4.0-4.5 4.5-5.0\n'
    out +=  '%s ' %(path.splitext(args.infile)[0])
    for value in gdts:
	out += '%d ' %(value)
    out += '%d\n' %(gdts.sum())
    args.outfile.write(out)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Divide results of RMSD indices into 10 ranges.')
    parser.add_argument('-i', '--in', action='store', required=True, dest='infile', help='The input file with the GDT indices.')
    parser.add_argument('-o', '--out', action='store', type=argparse.FileType('w'), required=True, dest='outfile', help='Specifies the name for the output file.')
    parser.add_argument('-c', '--col', action='store', type=int, required=False, default=1, dest='column', help='The column where is the GDT data. Begin with 1.')
    args = parser.parse_args()
    main()
