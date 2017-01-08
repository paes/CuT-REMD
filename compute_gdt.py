#!/usr/bin/python
import sys
import numpy as np

## THIS .py scans 14 .rmsd.dat (each replica) and returns a file with the Temperature(T) LowestValue(LV) LowerQuartile(Q1) MiddleQuartile(Q2) HigherQuartile(Q3) e HighestValue(HV)
## usage: python compute_AMM.py output input1 input2 input3 ... inputn
#in_file = open(sys.argv[1], "rw") ........ 


#IMPORTANTE, O C-MD eh o 4 na numeracao das pastas,  ele continua o dados4.dat, e isso eh solucionado na hora de criar o grafico yerrorbars para os graficos com quartis, eu modifiquei antes, ou seja, o dados7 virou o 8, arrumando a ordem e assim acabando com a necessidade de tratar isso na hora de criar o grafico de candlebars
text = ''

x = 2
while (x < 16):
	in_file = sys.argv[x]
	method = in_file.split('-')	
	if method[0] == "rmsd" :
		with open(in_file, 'r') as f:
			#next(f)
			#print "pulei"
			#print method[0]	
			col=[float(row.split("  ")[-1]) for row in f]
    	else: 
		with open(in_file, 'r') as f:
			#print "nao pulei, gdt" NAO ENTENDI PQ O RMSD TA ENTRANDO AQUI!
			#print method[0]	
			#next(f)			
			col=[float(row.split("  ")[-1]) for row in f]		

	words = in_file.split('.')
#aqui eu tenho o col contendo todos os rmsds daquela temperatura
	#print col
	#print "teste"
	LV = min(col) # LV WRONG?
	HV = max(col) #HV WRONG?
	#print words
	if words[1] == "001" or words[1] == "269" :
		saida = "001"                  
	if words[1] == "002" or words[1] == "285" :
		saida = "003"                  
	if words[1] == "003" or words[1] == "301" :
		saida = "005"                  
	if words[1] == "004" or words[1] == "318" :
		saida = "007"                  
	if words[1] == "005" or words[1] == "336" :
		saida = "009"                  
	if words[1] == "006" or words[1] == "355" :
		saida = "011"                  
	if words[1] == "007" or words[1] == "374" :
		saida = "013"                  
	if words[1] == "008" or words[1] == "395" :
		saida = "015"                  
	if words[1] == "009" or words[1] == "416" :
		saida = "017"	                
	if words[1] == "010" or words[1] == "438" :
		saida = "019"                  
	if words[1] == "011" or words[1] == "461" :
		saida = "021"                  
	if words[1] == "012" or words[1] == "485" :
		saida = "023"                  
	if words[1] == "013" or words[1] == "511" :
		saida = "025"	                
	if words[1] == "014" or words[1] == "537" :
		saida = "027"
	
	
	line = saida + ', {}, {},'.format(LV,HV) + '\n' #ultima virgula necessaria pq uso o paste dps em mais de um arquivo
	#print line	
	text += line	
	x = x + 1
#print text
out = open(sys.argv[1], 'w')
out.write(text)
out.close()
