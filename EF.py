import os, sys

xyzText = []
funnel_events = 0
summ_intervalos = 0
fruits = [' 1', ' 2', ' 3', ' 4',  ' 5', ' 6', ' 7', ' 8',  ' 9', '10', '11', '12',  '13', '14']
for fruit in fruits:
	controle = 0
	intervalo = 1

	for line in open("remd_total.log", "r"):
		#print(line)
		line1 = line.split()
		replica = line[0:2]
		temp_old = line[36:42]
		temp_new= line[46:52]
		
		#print replica
		#print fruit
		if replica == fruit:
			if controle == 0:
				if temp_old == "269.50" and temp_new != "269.50":
					print("saindo com replica numero %s" % replica)
					#print("Funnel Events ate agora %s" % funnel_events)
					controle += 1
					intervalo = 1

			if controle == 1:
				intervalo += 1
				if temp_old == "537.54" and temp_new != "537.54":
					print("voltando replica numero %s" % replica)
					#print("Funnel Events ate agora %s" % funnel_events)
					controle += 1

			if controle == 2:
				intervalo += 1
				if temp_old != "269.50" and temp_new == "269.50":
					print("fui e voltei replica numero %s" % replica)
					controle = 0
					funnel_events += 1
					print("Funnel Events ate agora %s" % funnel_events)
					print("Intervalo para finalizar TE: %s" % intervalo)
					summ_intervalos += intervalo
					

print funnel_events	
print summ_intervalos / (14 * funnel_events)	
#output = open("test_CA.pdb", "w")
#output.writelines(xyzText)
#output.close			
