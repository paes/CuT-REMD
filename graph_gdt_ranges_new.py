#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  care_graph_gdt_ranges.py
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
from os import system
import numpy as np

def edit_input():
    """
    """
    with open(args.infile, 'r') as orig:
	data_list = list(orig)
	ranges = data_list[1].split()[1:]
	pos = 2
	names = []
	while pos<len(data_list):
	    names.append(data_list[pos].split()[0])
	    pos += 1
    data_matrix = np.loadtxt(args.infile, skiprows=2, usecols=range(1,11))
    data_matrix = data_matrix.T
    out_data = '# GDT Proportions\nRanges '
    out_data += ' '.join(names) + '\n'
    for i,ran in enumerate(ranges):
	out_data += ran
	for data in data_matrix[i]:
	    out_data += ' %d' %(data)
	out_data += ' %d\n' %(data_matrix[i].sum())
    with open(args.infile+'.temp', 'w') as temp:
	temp.write(out_data)
    args.infile = args.infile+'.temp'

def main():
    """ Main function """
    if args.transform:
	edit_input()
	#colors = ['#40004b','#762a83','#9970ab','#c2a5cf','#e7d4e8','#d9f0d3','#a6dba0','#5aae61','#1b7837','#00441b']
	colors = ['#7f3b08','#b35806','#e08214','#fdb863','#fee0b6','#d8daeb','#b2abd2','#8073ac','#542788','#2d004b']
	colors = ['#67001f','#b2182b','#d6604d','#f4a582','#fddbc7','#d1e5f0','#92c5de','#4393c3','#2166ac','#053061']
	colors.reverse()
    else:
	colors = ['#67001f','#b2182b','#d6604d','#f4a582','#fddbc7','#d1e5f0','#92c5de','#4393c3','#2166ac','#053061']  
    gnu = """set terminal pngcairo size 2048,1080 enhanced font 'Times-Roman,20'
set output '"""
    gnu += args.outfile + "'\n"
    gnu += """set boxwidth 0.75 absolute
set style fill solid 1.00 border lt -1
set key outside reverse nobox right top vertical Left noenhanced autotitle columnhead maxcolumns 1 font ',20'
set key spacing 5.5 samplen 4 width 1.5  height +1.75
set style histogram rowstacked title textcolor lt -1
set datafile missing '-'
set style data histograms
set xtics border in scale 0,0 nomirror autojustify rotate by -45 
set xtics norangelimit
set xtics ()
#set title "GDT Ranges Distribution"
set yrange [ 0.00 : 100.00 ] noreverse nowriteback

#SOBRE O GRID
# Line style for axes
set style line 90 lt 1 lc 3
set style line 90 lt rgb "#000000"
# Line style for grid
set style line 81 lt 0  # dashed
set style line 81 lt rgb "#000000"  # grey

set grid back linestyle 81

set border 3 linestyle 90 
# Remove border on top and right.  These
# borders are useless and make it harder
# to see plotted lines near the border.
# Also, put it in grey; no need for so much emphasis on a border.

set ytics 10
set border 2 front linewidth 1.000
#set xtics  norangelimit nomirror


#set ytics border in scale 1,0.5 nomirror norotate  autojustify
# Put X and Y labels
set ylabel "Percentage (%)"
set xlabel "GDT (TS) Ranges

set xrange [ -0.6 : 9.7 ] noreverse nowriteback
"""
    gnu += "plot '%s' using (100.*$2/$11):xtic(1) title column(2) lc rgb '%s',\\" %(args.infile, colors[0])
    for i in range(3, 10):
	gnu += "\n     '%s' using (100.*$%d/$11):xtic(1) title column(%d) lc rgb '%s',\\" %(args.infile, i, i, colors[i-2])
    gnu += "\n     '%s' using (100.*$10/$11):xtic(1) title column(11) lc rgb '%s'\n" %(args.infile, colors[9])
    with open(args.outfile+'-temp.gnu', 'w') as out:
	out.write(gnu)
    system('gnuplot %s-temp.gnu' %(args.outfile))
    #system('rm %s-temp.gnu' %(args.outfile))
    #if args.transform:
	#system('rm %s' %(args.infile))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Generates a GNU plot of gdt distribution among ranges. The type of the plot is an stacked histogram.')
    parser.add_argument('-i', '--in', action='store', required=True, dest='infile', help='The input file with the GDT indices grouped.')
    parser.add_argument('-o', '--out', action='store', required=True, default='plot.png' ,dest='outfile', help='Specifies the name for the output file. The default name is plot.')
    parser.add_argument('-c', '--col', action='store', type=int, required=False, default=1, dest='column', help='The column where is the GDT data. Begin with 1.')
    parser.add_argument('-t', '--transform', action='store_true', required=False, dest='transform', help='Transform the type of graph. Instead of group by treatments, group by ranges.')
    args = parser.parse_args()
    main()
