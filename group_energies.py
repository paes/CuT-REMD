#!/usr/bin/python
#-*- coding: utf-8 -*-

#exemplo python group_energies.py dist_269.5.dat dist_269.52.dat 1 plotteste

import os, sys, math

input = list(open(sys.argv[1], "r"))
input2 = list(open(sys.argv[2], "r"))
window = int(sys.argv[3])
plotinput = sys.argv[4]


if float(input[0].split()[0]) <= float(input2[0].split()[0]):
	higher = input2
	lower = input
else:
	higher = input
	lower = input2
	
if float(input[-1].split()[0]) <= float(input2[-1].split()[0]):
	threshold = len(input)
else:
	threshold = len(input2)

	

i, j = 0, 0
flag = True
high_line = higher[0].split()

while i < threshold and flag:
	low_line = lower[i].split()
	if low_line[0] == high_line[0]:
		flag = False
	else:
		i += 1

w_up = float(high_line[0])
w_up = int(w_up)
w_up /= 10
w_up += 1
w_up *= 10

buffer = ""

sums = []
sums2 = []
while i < threshold:
	### #line = lower[i].split()
	### line2 = higher[j].split()
	### sum_temp = 0
	### sum_temp2 = 0
	###while i < threshold and float(line2[0]) < w_up:
	###	sum_temp += float(lower[i].split()[0])
	###	sum_temp2 += float(higher[j].split()[0])
	

	#print lower[i].split()[0] + ' <----> ' + higher[j].split()[0]
	newline = lower[i].split()[0] + ' ' + lower[i].split()[1] + ' ' + higher[j].split()[1] + "\n"
	buffer = buffer + newline
				
		###i += 1
		###j += 1
		####line = lower[i].split()
		###line2 = higher[j].split()
	###w_up += window
	i += 1
	j += 1
	###sums.append(sum_temp)
	###sums2.append(sum_temp2)
	#print i	
out = "out1.dat"
with open(out, "w") as output:
	output.write(buffer)



### AQUI VOU PEGAR Out1.dat e, a partir dele, gerar as janelas.


comjanelas = open(out, 'r')
arq_jan = list(comjanelas)
comjanelas.close()


m = 0 
energias1 = []
energias2 = []
entrys = []
w_up = float(arq_jan[0].split()[0])
#print w_up
w_up = int(w_up)
#print w_up
w_up /= 10
#print w_up
w_up *= 10
#print w_up
inferior_thrs = w_up
w_up += window
#print w_up
final_result = 0
while m < len(arq_jan):
	#print "%%%%%%%%%"
	#print "linha:" + str(m)
	sum_temp = 0
	sum_temp2 = 0
	inferior_thrs = w_up
	#print "limite inferior" + str(inferior_thrs)
	while m< len(arq_jan) and float(arq_jan[m].split()[0]) <= w_up:
		#print arq_jan[m]
		sum_temp += float(arq_jan[m].split()[1])
		sum_temp2 += float(arq_jan[m].split()[2])
		#print "valor entrada 1-> " + str(float(arq_jan[m].split()[1]))
		#print "valor entrada 2-> " + str(float(arq_jan[m].split()[2]))
		m += 1
	#print "limite inferior" + str(inferior_thrs)
	#print "valor janela atual 1->" + str(sum_temp)
	#print "valor janela atual 2->" + str(sum_temp2)
	energias1.append(sum_temp)
	energias2.append(sum_temp2)
	entrys.append(inferior_thrs)
	
	#newline = lower[i].split()[0] + ' ' + lower[i].split()[1] + ' ' + higher[j].split()[1] + "\n"
	#final_result += float(input[i].split()[1]) * float(input[i].split()[2])
	#m += 1
	w_up += window
#final_result = (sum_temp/10) * (sum_temp2/10)
#print len(entrys)
#print entrys
#print " "
#print len(energias1)
#print energias1
#print " "
#print len(energias2)
#print energias2 	

num = 0
buffer = "" 
while num < len(entrys):
	if energias1[num] != 0 and energias2[num] != 0 :			
		newline = str(entrys[num]) + ' ' + str(energias1[num]) + ' ' + str(energias2[num]) + "\n"
		buffer = buffer + newline
	num = num + 1
	
out = plotinput
with open(out, "w") as output:
	output.write(buffer)
	















### A PARTIR DAQUI É A PARTE EM QUE ELE LE O out1.dat e COMPUTA O OVERLAP!!!
asd = open(out, 'r')
input = list(asd)
asd.close()
i = 0
results = []
results2 = []
w_up = float(input[0].split()[0])
w_up = int(w_up)
w_up /= 10
w_up *= 10
w_up += window

final_result = 0
while i < len(input):
	#sum_temp = 0
	#sum_temp2 = 0
	#while i< len(input) and float(input[i].split()[0]) <= w_up:
	#	#print input[i]
	#	sum_temp += float(input[i].split()[1])
	#	sum_temp2 += float(input[i].split()[2])
	#	i += 1
	#results.append(sum_temp)
	#results2.append(sum_temp2)
	final_result += math.sqrt(float(input[i].split()[1])/10) * math.sqrt(float(input[i].split()[2])/10)
	i += 1
	#w_up += window


#final_result = (sum_temp/10) * (sum_temp2/10)

# print results
# print len(results)
# print len(input)
# print results2
# print len(results2)
# print len(input)


#if atype == 1:
print final_result
print "error: " + str((1 - final_result)*100) + " %"
#else:
#	print "Creating ln plot"
