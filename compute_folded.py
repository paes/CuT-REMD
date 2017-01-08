#!/usr/bin/python
import sys
import numpy as np

text = ''

in_file = sys.argv[1]
#exchanges = sys.argv[2]
threshold = float(sys.argv[2])
#print exchanges
with open(in_file, 'r') as f:
	col=[row.split("                     ")[-1] for row in f]
	#print col
	x = 0
	first = 0
	count_structures = 0
	num_folded = 0
	relative_num = 0
	for value in col:
		if value[0] != "#":
#		if x > 0:
			#print value
			count_structures = count_structures + 1
			relative_num = relative_num + 1
			if float(value) <= threshold:
				num_folded = num_folded + 1
				if first == 0:
					first = relative_num - 1
		else:
			relative_num =0		
	
		x = x + 1
		
	print "###"	
	print num_folded
	print count_structures
	print float( float(num_folded) / float(count_structures)) * 100
	print float (first) # mas aqui first dos 700000 mil!! concatenados
	print "###"
	
	
	## nao esta fucnionando para descobrir o menor tempo em que se encontra < 2.0
#words = in_file.split('.')
#words = words[0].split('/')
#output = words[-1] + "_results.dat"


#out = open(output, 'w')
#out.write(text)
#out.close()


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

