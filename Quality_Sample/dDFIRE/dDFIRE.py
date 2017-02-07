import sys, os, ntpath, subprocess

#Usage: python dDFIRE <pbd_file> <model_number>

# Get Inputs
input_name = os.path.splitext(sys.argv[1])[0]
model_name = input_name[3:] + "_M" + sys.argv[2] + ".dat"

# Check Results Directory
directory = "../Results/dDFIRE/"

if (not os.path.exists(directory)):
	os.makedirs(directory)

# Set Outputs
output_file = directory + input_name[6:] + "_M" + sys.argv[2] + "_dDFIRE.dat"

if(os.path.isfile(output_file)):
	os.system("rm " + output_file)

#Get dDFIRE
os.system("./dDFIRE " + model_name + " >> " + output_file)
