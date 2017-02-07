import sys, os
from os import path

#Usage: python rwplus.py <pbd_file> <model_number>

# Get Inputs
input_name = os.path.splitext(sys.argv[1])[0]
model_name = input_name[3:] + "_M" + sys.argv[2] + ".dat"

# Check Results Directory
directory = "../Results/RW_Plus/"

if (not os.path.exists(directory)):
	os.makedirs(directory)

# Set Outputs
output_file = directory + input_name[6:] + "_M" + sys.argv[2] + "_rwplus.dat"

if(os.path.isfile(output_file)):
	os.system("rm " + output_file)

#Get RW
os.system("chmod 777 calRWplus")
os.system("./calRWplus " + model_name + " >> " + output_file)
