import sys, os, ntpath

# Usage: %program traj.pdb #model

# Set Input File
input_name = os.path.splitext(sys.argv[1])[0]
model_name = input_name[3:] + "_M" + sys.argv[2] + ".dat"

# Check Results Directory
directory = "../Results/Probscore/"

if (not os.path.exists(directory)):
	os.makedirs(directory)

# Set Output File
output_name = input_name[6:] + "_M" + sys.argv[2]
output_file = directory + output_name + "_molprob.dat"

if(os.path.isfile(output_file)):
	os.system("rm " + output_file)

# Check Output Files
clashscore_file = output_name + ".clashscore.dat"
ramalyze_file = output_name + ".ramalyze.dat"
rotalyze_file = output_name + ".rotalyze.dat"

if(os.path.isfile(clashscore_file)):
	os.system("rm " + clashscore_file)

if(os.path.isfile(ramalyze_file)):
	os.system("rm " + ramalyze_file)

if(os.path.isfile(rotalyze_file)):
	os.system("rm " + rotalyze_file)

# Create Analysis Files
os.system("phenix.clashscore " + model_name + " | grep \"clashscore\" | cut -d \" \" -f 3 >> " + clashscore_file)
os.system("phenix.ramalyze " + model_name + " | grep \"favored (G\" | cut -d \" \" -f 2 | cut -d % -f 1 >> " + ramalyze_file)
os.system("phenix.rotalyze " + model_name + " | grep \"outliers (G\" | cut -d \" \" -f 2 | cut -d % -f 1 >> " + rotalyze_file)

# Compute Probscore
os.system("probityScore.py " + clashscore_file + " " + rotalyze_file + " " + ramalyze_file + " " + output_file)

# Remove Temp Files
os.system("rm " + clashscore_file)
os.system("rm " + ramalyze_file)
os.system("rm " + rotalyze_file)
