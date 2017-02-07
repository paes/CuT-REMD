import sys, os, ntpath, subprocess

#Usage: python get_from_tra_create_index <pbd_file> <model_number>

#Get Inputs
input_file = sys.argv[1]
model = sys.argv[2]

#Index File
input_name = os.path.splitext(input_file)[0]
index_file = input_name[3:] + ".index"

#Set Outputs
output_file = input_name[3:] + "_M" + model + ".dat"

#Check if Model Was Already Retrieved
if(os.path.isfile(output_file)):
	sys.exit(0)

#Create Index if wasn't already created
if(not os.path.isfile(index_file)):
	print("Creating Index File From: " + input_name)
	os.system("sed -n '/MODEL/ =' " + input_file + " > " + index_file)

#Get Model
line = subprocess.check_output("sed -n ' " + model + " 'p " + index_file, shell=True).strip()
os.system("sed -n ' " + line + " {n; :loop /ENDMDL/ q; p; n; b loop;}' " + input_file + " > " + output_file)
