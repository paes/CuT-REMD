#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  correlation_coefficient.py
#  
#  Copyright 2016 THIAGO LIPINSKI PAES <thiagopaes@gmail.com>
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

import argparse, math
from os import system, listdir, path, getcwd
import time
import numpy as np
from scipy.stats.stats import pearsonr   

kb=0.0019872041

system("rm correlations.txt")
#print listdir('.')
output=[]
files = [f for f in sorted(listdir('.')) if path.isfile(f)]
for f in files:
	obtained = []
	theoretical_values = []
	entrada = f
	if entrada[5] == 'r': 
		x = 1
	else:
		x = 0
	f = f.replace('.','_')
	sep = f.split('_')
	#print sep
	#print entrada
	primeira_temp = sep[x+1] + "." + sep[x+2]
	primeira_temp = float(primeira_temp)
	#print primeira_temp
	segunda_temp = sep[x+4] + "." + sep[x+5]
	segunda_temp = float(segunda_temp)
	#print segunda_temp
	run = sep[x+3]
	#print run
	cutoff = sep[x+8]
	#print cutoff
	method = sep[x+7]
	#print method
	win = sep[x+9].split('window')
	window = win[1]
	#print window
	

	diretorio = getcwd().split('/')[-1]
	#print diretorio
	
	
	if x == 1:  #remd
		type = diretorio[-1]
	else: #ctremd
		type = diretorio[-4]
	
	theoretical = (1 /(kb*primeira_temp)) - (1/(kb*segunda_temp))
	#print theoretical
	arquivo = np.loadtxt(entrada)

	i = 0
	for b in arquivo[:,2]:
		obtained.append(math.log(b/arquivo[i,1]))
		i+=1
	#print obtained
	
	for b in arquivo[:,0]:
		theoretical_values.append( b * theoretical)
		i+=1
	#print theoretical_values
	coef = pearsonr(obtained,theoretical_values)[0]
	
	#print type
	
	tupla = type, cutoff, window, primeira_temp, segunda_temp, run, coef
	output.append(tupla)
	#print tupla
	
print time.asctime()

correl = "correlations" + time.asctime() + ".txt"
with open(correl,"w") as out:
	linha = ""
	for t in output:
		linha += "%s %s %d %.2f %.2f %d %f\n" %(t[0],t[1],int(t[2]),t[3],t[4],int(t[5]),t[6])
	out.write(linha)

