#!/usr/bin/python
import sys
import numpy as np

text = ''

in_file = sys.argv[1]
#exchanges = sys.argv[2]
threshold = float(sys.argv[2])
#print exchanges
with open(in_file, 'r') as f:
	col=[row.split("\t")[-1] for row in f]
	x = 0
	first = 0
	count_structures = 0
	num_folded = 0
	relative_num = 0
	control = 1	
	for value in col:
		if value[0] != "#":
			#print "col[0] is: " + str(col[0])
			count_structures = count_structures + 1
			if float(value) < threshold and (control < 1):
				first = count_structures
	#			print "controlll: " + str(control)
				break
			if float(value) < threshold and (control > 0):
	#			print "control: " + str(control)
				control = 0
				count_structures = count_structures - 1
				#print first
				
		#break
	
			
		
	print "###"	
	print first
	print "###"
	
	
words = in_file.split('.dat')
words = words[0].split('/')
output = words[-1] + "_first.dat"

#print words[-1]
temperature = words[-1].split('_')
print temperature[1]
out = open(output, 'w')
text =  temperature[1] + " " + str(first) + "\n"
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

