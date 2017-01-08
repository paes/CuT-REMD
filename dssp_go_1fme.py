#!/usr/bin/python
import sys
import numpy as np

text = ''

in_file = sys.argv[1]
#exchanges = sys.argv[2]
#in_file2 = sys.argv[2]

with open(in_file, 'r') as f:
	count_strand1 = 0
	count_strand2 = 0
	count_helice3 = 0
	count_strand12 = 0
	count_strand13 = 0
	count_strand23 = 0
	count_rmsd_folded = 0
	count_strand123_t1 = 0
	count_strand123_t2 = 0
	count_strand123_t3 = 0
	count_strand123_t1_rmsd = 0
	count_strand123_t2_rmsd = 0
	count_strand123_t3_rmsd = 0
	for row in f:
		row = row.split()
		#print row

		index = 1
		primeira_fita = 0
		segunda_fita = 0
		terceira_helice = 0
		rmsd_folded = 0
		#print len(row)
		#print row
		for value in row:
		
		#INDEX 3 eh o PRIMEIRO!! logo, se 3 eh 1,   para todo index tem que ser adicionado 2
			#print value
			#if index == 3:
			#print "index " + str(index) + ":" + value
			if index in range (7,8): #  (5-6)
				#print "frame: " + row[0] + " residue: " + str(index - 2) + " value: " + value
				if value == "S":
					#print "frame: " + row[0] + " residue: " + str(index) +  " eh um H"
					primeira_fita = primeira_fita + 1
#					print primeira_fita
		 	#print index
		 	if index in range (13,14): # (11-12)
		 		#print "frame: " + row[0] + " residue: " + str(index - 2) + " value: " + value
		 		if value == "S":
		 			#print "frame: " + row[0] + " residue: " + str(index) +  " eh um H"
		 			segunda_fita = segunda_fita + 1		
		 	if index in range (17,26): # (15-24)
		 		#print "frame: " + row[0] + " residue: " + str(index - 2) + " value: " + value
		 		if value == "H":
		 			#print "frame: " + row[0] + " residue: " + str(index) +  " eh um H"
		 			terceira_helice = terceira_helice + 1		
			
			threshold =  float(sys.argv[2])
			#print threshold - esse esta OK
			if index == 31:
				#print value
				if "remd" in value:
					print "no!!!!"
				else:
					#print value
					rmsd = float(value)
					#print rmsd
					if rmsd <= threshold:
						#print rmsd
						rmsd_folded = 1
						count_rmsd_folded = count_rmsd_folded + 1
					else:
						rmsd_folded = 0
			index = index + 1
	 	#if primeira_fita != 0 : 
			#print "neste frame o numero de residuos 3a8 que aderem ao formato helice primeira_fita eh: " + str(primeira_fita)
		#print rmsd_folded
		if primeira_fita > 0: #(80%)
			#print "ieba"
			count_strand1 = count_strand1 + 1
		if segunda_fita > 0: #(80%)
			#print "xieba"
			count_strand2 = count_strand2 + 1
		
		if terceira_helice > 6: #(80%)  
			#print "xieba"
			count_helice3 = count_helice3 + 1
		
		if primeira_fita > 0 and segunda_fita > 0:
			#print "xilaieba"
			count_strand12 = count_strand12 + 1
		
		if primeira_fita > 0 and terceira_helice > 6:
			#print "xilaieba"
			count_strand13 = count_strand13 + 1
		
		if segunda_fita > 0 and terceira_helice > 6:
			#print "xilaieba"
			count_strand23 = count_strand23 + 1
		
		
		#tipo 1
		if primeira_fita > 0 and segunda_fita > 0 and terceira_helice > 7:
			#print "xilaieba"
			count_strand123_t1 = count_strand123_t1 + 1
			if rmsd_folded > 0:
				count_strand123_t1_rmsd = count_strand123_t1_rmsd + 1

#outra possibilidade (tipo 2)
		if primeira_fita > 0 and (segunda_fita + terceira_helice) > 7:
			count_strand123_t2 = count_strand123_t2 + 1
			if rmsd_folded > 0:
				count_strand123_t2_rmsd = count_strand123_t2_rmsd + 1
#ou assim (tipo 3)
		if (primeira_fita + segunda_fita + terceira_helice) > 8:
			#print "xilaieba"
			count_strand123_t3 = count_strand123_t3 + 1
			
			if rmsd_folded > 0:
				count_strand123_t3_rmsd = count_strand123_t3_rmsd + 1
	
	print "numero total de fita1: " + str(count_strand1)	
	print "numero total de fita2: " + str(count_strand2)	
	print "numero total de helice: " + str(count_helice3)	
	print "numero total de fita 1 e 2: " + str(count_strand12)	
	print "numero total de fita 1 e helice: " + str(count_strand13)	
	print "numero total de fila 2 e helice: " + str(count_strand23)	
	print "numero total de fitas 1 e 2 e helice 3 (tipo 1): " + str(count_strand123_t1)	
	print "numero total de fitas 1 e 2 e helice 3 (tipo 2): " + str(count_strand123_t2)	
	print "numero total de fitas 1 e 2 e helice 3 (tipo 3): " + str(count_strand123_t3)
	print "numero total de fitas 1 e 2 e helice 3 (tipo 1) + rmsd: " + str(count_strand123_t1_rmsd)	
	print "numero total de fitas 1 e 2 e helice 3 (tipo 2) + rmsd: " + str(count_strand123_t2_rmsd)	
	print "numero total de fitas 1 e 2 e helice 3 (tipo 3) + rmsd: " + str(count_strand123_t3_rmsd)
	print "numero total de rmsds abaixo de " + str(sys.argv[2]) + " : " + str(count_rmsd_folded)	
	
	line = "numero total de fita1: " + str(count_strand1)				+ "\n"
	text += line
	line = "numero total de fita2: " + str(count_strand2)	            + "\n"
	text += line
	line = "numero total de helice3: " + str(count_helice3)	            + "\n"
	text += line
	line = "numero total de fita 1 e 2: " + str(count_strand12)	    + "\n"
	text += line
	line = "numero total de fita 1 e helice: " + str(count_strand13)	    + "\n"
	text += line
	line = "numero total de fita 2 e helice: " + str(count_strand23)	    + "\n"
	text += line
	line = "numero total de fitas 1 e 2 e helice 3 (tipo 1): " + str(count_strand123_t1)	+ "\n"
	text += line
	line = "numero total de fitas 1 e 2 e helice 3 (tipo 2): " + str(count_strand123_t2)	+ "\n"
	text += line
	line = "numero total de fitas 1 e 2 e helice 3 (tipo 3): " + str(count_strand123_t3)	+ "\n"
	text += line
	line = "numero total de fitas 1 e 2 e helice 3 (tipo 1) + rmsd: " + str(count_strand123_t1_rmsd)	+ "\n"
	text += line
	line = "numero total de fitas 1 e 2 e helice 3 (tipo 2) + rmsd: " + str(count_strand123_t2_rmsd)	+ "\n"
	text += line
	line = "numero total de fitas 1 e 2 e helice 3 (tipo 3) + rmsd: " + str(count_strand123_t3_rmsd)	+ "\n"
	text += line
	line = "numero total de rmsds abaixo de " + str(sys.argv[2]) + " : " + str(count_rmsd_folded)	 + "\n"
	text += line
	
#	col=[row.split("\t")[-1] for row in f]
#	print col[1]
#	for value in col:
	#	new_col= (float(value))
	#	new_col= new_col / exchanges
	#	#print new_col
	
#line = str(new_col)	+ "\n"
	#	text += line	

words = in_file.split('.')
#words = words[0].split('/')
print "rmsd_and_dssp."  + words[1] + ".results.dat"
output = "rmsd_and_dssp."  + words[1] + ".results.dat"


out = open(output, 'w')
out.write(text)
out.close()


#   "269.50" 1 , 

#   "285.22" 3 , 

#   "301.66" 5 , 

#   "318.76" 7 , 

#   "336.61" 9 , 

#   "355.26" 11 , 

#   "374.74" 13 , 

#   "395.07" 15 , 

#   "416.32" 17 , 

#   "438.50" 19 , 

#   "461.67" 21 , 

#   "485.87" 23 , 

#   "511.14" 25 , 

#   "537.54" 27 )

