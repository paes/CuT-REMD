#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  care_graph_rmsd_ranges.py
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

def main():
    """ Main function """
    #colors = ['#000000','#800080','#ff00ff','#ff0000','#ff8000','#ffff00','#66ff33','#00ffff','#1a1aff','#000080']
    #colors = ['#000000','#8b0000','#ff0000','#ff8000','#ffff00','#408000','#66ff33','#00ffff','#1a1aff','#000080']
    colors = ['#67001f','#b2182b','#d6604d','#f4a582','#fddbc7','#d1e5f0','#92c5de','#4393c3','#2166ac','#053061']   
   # colors = ['#eff3ff','#bdd7e7','#6baed6','#2171b5','#fc9272','#de2d26','#bdbdbd', '#636363', '#00FF00' ,'#000000' ]
        
    gnu = """set terminal pngcairo size 2048,1080 enhanced font 'Times-Roman,20'
    
set output '"""
    gnu += args.outfile + "'\n"
    gnu += """set boxwidth 0.75 absolute
set style fill solid 1.00 border lt -1
set key outside reverse nobox right top vertical Left noenhanced autotitle columnhead maxcolumns 1 font ',20'
set key invert spacing 5.5 samplen 4 width -1  height +0.3
set style histogram rowstacked title textcolor lt -1
set datafile missing '-'
set style data histograms
set xtics border in scale 0,0 nomirror autojustify rotate by -45
set xtics font ", 12"
set xtics norangelimit
set xtics ()
#set title "RMSD Ranges Distribution"
set yrange [ 0.00 : 100.00 ] noreverse nowriteback

#SOBRE O GRID
# Line style for axes
set style line 90 lt 1 lc 3
set style line 90 lt rgb "#000000"
# Line style for grid
set style line 81 lt 0  # dashed
set style line 81 lt rgb "#000000"  # not grey
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
set xlabel "Simulation ID"


"""
    gnu += "plot '%s' using (100.*$2/$11):xtic(1) title column(2) lc rgb '%s',\\" %(args.infile, colors[0])
    for i in range(3, 11):
	gnu += "\n     '%s' using (100.*$%d/$11):xtic(1) title column(%d) lc rgb '%s',\\" %(args.infile, i, i, colors[i-2])
    gnu += "\n     '%s' using (100.*$10/$11):xtic(1) title column(10) lc rgb '%s'\n" %(args.infile, colors[9])
    with open(args.outfile+'-temp.gnu', 'w') as out:
	out.write(gnu)
    system('gnuplot %s-temp.gnu' %(args.outfile))
    system('rm %s-temp.gnu' %(args.outfile))
    

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Generates a GNU plot of rmsd distribution among ranges. The type of the plot is an stacked histogram.')
    parser.add_argument('-i', '--in', action='store', required=True, dest='infile', help='The input file with the RMSD indices grouped.')
    parser.add_argument('-o', '--out', action='store', required=True, default='plot.png' ,dest='outfile', help='Specifies the name for the output file. The default name is plot.')
    parser.add_argument('-c', '--col', action='store', type=int, required=False, default=1, dest='column', help='The column where is the RMSD data. Begin with 1.')
    args = parser.parse_args()
    main()
