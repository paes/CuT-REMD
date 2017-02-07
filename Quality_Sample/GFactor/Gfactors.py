import sys, os, ntpath

# Usage: python GFactors.py traj.pdb #model

# Check Results Directory
directory = "../Results/GFactor/"

if (not os.path.exists(directory)):
	os.makedirs(directory)

# Check Output File
input_name = os.path.splitext(sys.argv[1])[0]
output_file = directory + input_name[6:] + "_M" + sys.argv[2] + "_GFactor.dat"

if(os.path.isfile(output_file)):
	os.system("rm " + output_file)

# Compute GFactor
model_name = input_name[3:] + "_M" + sys.argv[2] + ".dat"
os.system("procheckTC.scr " + model_name + " 1.5")
os.system("grep \"Means\" *.sdh | awk '/Means/ {print $7}' >> " + output_file)

# Delete Temp File
base_name = input_name[6:] + "_M" + sys.argv[2]

os.system("rm fort.27")
os.system("rm procheck.prm")
os.system("rm " + base_name + ".lan")
os.system("rm " + base_name + ".nb")
os.system("rm " + base_name + ".new")
os.system("rm " + base_name + ".pln")
os.system("rm " + base_name + ".rin")
os.system("rm " + base_name + ".sdh")
os.system("rm " + base_name + ".sum")
