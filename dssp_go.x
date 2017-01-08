#!/bin/bash -f
##bash dssp_go.x job_id 1unc

#dssp_go.x job_id 1unc 3.5 [underline/.] [temps/00]

#cp REBACKUP_rmsd_and_dssp.alltemperatures.results.dat RE-REBACKUP_rmsd_and_dssp.alltemperatures.results.dat 
#cp REBACKUPrmsd_and_dssp.alltemperatures.dat RE-REBACKUPrmsd_and_dssp.alltemperatures.dat
#
#cp BACKUP_rmsd_and_dssp.alltemperatures.results.dat REBACKUP_rmsd_and_dssp.alltemperatures.results.dat 
#cp BACKUPrmsd_and_dssp.alltemperatures.dat REBACKUPrmsd_and_dssp.alltemperatures.dat
#
#cp rmsd_and_dssp.alltemperatures.results.dat BACKUP_rmsd_and_dssp.alltemperatures.results.dat
#cp rmsd_and_dssp.alltemperatures.dat BACKUPrmsd_and_dssp.alltemperatures.dat



nrep=`wc temperatures.dat | awk '{print $2}'` #where /media/lipinski/EXT4/SIMULACOES/2016/1UNC/2ns/1UNC_2ns_3_RUN1/temperatures.dat is the temperature.dat complete path
#for ext in `cat temperatures.dat` ; do


for ext in 001 002 003 004 005 006 007 008 009 010 011 012 013 014 ; do
		#rm remd_001.Ttraj.$ext.pdb
	  cpptraj $1.prmtop <<EOF
		trajin remd_001*.ncdf.$ext
		trajin remd_002.ncdf.$ext 1 last 2
		trajin remd_00[3456].ncdf.$ext
		
		secstruct :1-33 out dssp.$ext.dat ptrajformat
		go
EOF
dssp_go_$2.py rmsd_and_dssp.$ext.dat $3
done    


ponto=$4 
temps=$5  
#echo "$ponto"              
#echo "$temps"
if [ "$ponto" = "underline" ]; then
	echo "underline"
	if [ "$temps" = "temps" ]; then
		echo "temps"
		paste dssp.001.dat rmsd-total_Ttraj_3-26_CA.269.5.dat > rmsd_and_dssp.001.dat
		paste dssp.002.dat rmsd-total_Ttraj_3-26_CA.284.53.dat > rmsd_and_dssp.002.dat
		paste dssp.003.dat rmsd-total_Ttraj_3-26_CA.300.24.dat > rmsd_and_dssp.003.dat
		paste dssp.004.dat rmsd-total_Ttraj_3-26_CA.316.62.dat > rmsd_and_dssp.004.dat
		paste dssp.005.dat rmsd-total_Ttraj_3-26_CA.333.73.dat > rmsd_and_dssp.005.dat
		paste dssp.006.dat rmsd-total_Ttraj_3-26_CA.351.57.dat > rmsd_and_dssp.006.dat
		paste dssp.007.dat rmsd-total_Ttraj_3-26_CA.370.19.dat > rmsd_and_dssp.007.dat
		paste dssp.008.dat rmsd-total_Ttraj_3-26_CA.389.61.dat > rmsd_and_dssp.008.dat
		paste dssp.009.dat rmsd-total_Ttraj_3-26_CA.409.86.dat > rmsd_and_dssp.009.dat
		paste dssp.010.dat rmsd-total_Ttraj_3-26_CA.431.01.dat > rmsd_and_dssp.010.dat
		paste dssp.011.dat rmsd-total_Ttraj_3-26_CA.453.11.dat > rmsd_and_dssp.011.dat
		paste dssp.012.dat rmsd-total_Ttraj_3-26_CA.476.12.dat > rmsd_and_dssp.012.dat
		paste dssp.013.dat rmsd-total_Ttraj_3-26_CA.500.14.dat > rmsd_and_dssp.013.dat
		paste dssp.014.dat rmsd-total_Ttraj_3-26_CA.525.21.dat > rmsd_and_dssp.014.dat
	else :
		echo "0*"
		paste dssp.001.dat rmsd-total_Ttraj_3-26_CA.001.dat > rmsd_and_dssp.001.dat
		paste dssp.002.dat rmsd-total_Ttraj_3-26_CA.002.dat > rmsd_and_dssp.002.dat
		paste dssp.003.dat rmsd-total_Ttraj_3-26_CA.003.dat > rmsd_and_dssp.003.dat
		paste dssp.004.dat rmsd-total_Ttraj_3-26_CA.004.dat > rmsd_and_dssp.004.dat
		paste dssp.005.dat rmsd-total_Ttraj_3-26_CA.005.dat > rmsd_and_dssp.005.dat
		paste dssp.006.dat rmsd-total_Ttraj_3-26_CA.006.dat > rmsd_and_dssp.006.dat
		paste dssp.007.dat rmsd-total_Ttraj_3-26_CA.007.dat > rmsd_and_dssp.007.dat
		paste dssp.008.dat rmsd-total_Ttraj_3-26_CA.008.dat > rmsd_and_dssp.008.dat
		paste dssp.009.dat rmsd-total_Ttraj_3-26_CA.009.dat > rmsd_and_dssp.009.dat
		paste dssp.010.dat rmsd-total_Ttraj_3-26_CA.010.dat > rmsd_and_dssp.010.dat
		paste dssp.011.dat rmsd-total_Ttraj_3-26_CA.011.dat > rmsd_and_dssp.011.dat
		paste dssp.012.dat rmsd-total_Ttraj_3-26_CA.012.dat > rmsd_and_dssp.012.dat
		paste dssp.013.dat rmsd-total_Ttraj_3-26_CA.013.dat > rmsd_and_dssp.013.dat
		paste dssp.014.dat rmsd-total_Ttraj_3-26_CA.014.dat > rmsd_and_dssp.014.dat
	fi
else :
	echo "ponto"
	if [ "$temps" = "temps" ]; then
		echo "temps"
		paste dssp.001.dat rmsd-total_Ttraj_3-26.CA.269.5.dat > rmsd_and_dssp.001.dat
		paste dssp.002.dat rmsd-total_Ttraj_3-26.CA.284.53.dat > rmsd_and_dssp.002.dat
		paste dssp.003.dat rmsd-total_Ttraj_3-26.CA.300.24.dat > rmsd_and_dssp.003.dat
		paste dssp.004.dat rmsd-total_Ttraj_3-26.CA.316.62.dat > rmsd_and_dssp.004.dat
		paste dssp.005.dat rmsd-total_Ttraj_3-26.CA.333.73.dat > rmsd_and_dssp.005.dat
		paste dssp.006.dat rmsd-total_Ttraj_3-26.CA.351.57.dat > rmsd_and_dssp.006.dat
		paste dssp.007.dat rmsd-total_Ttraj_3-26.CA.370.19.dat > rmsd_and_dssp.007.dat
		paste dssp.008.dat rmsd-total_Ttraj_3-26.CA.389.61.dat > rmsd_and_dssp.008.dat
		paste dssp.009.dat rmsd-total_Ttraj_3-26.CA.409.86.dat > rmsd_and_dssp.009.dat
		paste dssp.010.dat rmsd-total_Ttraj_3-26.CA.431.01.dat > rmsd_and_dssp.010.dat
		paste dssp.011.dat rmsd-total_Ttraj_3-26.CA.453.11.dat > rmsd_and_dssp.011.dat
		paste dssp.012.dat rmsd-total_Ttraj_3-26.CA.476.12.dat > rmsd_and_dssp.012.dat
		paste dssp.013.dat rmsd-total_Ttraj_3-26.CA.500.14.dat > rmsd_and_dssp.013.dat
		paste dssp.014.dat rmsd-total_Ttraj_3-26.CA.525.21.dat > rmsd_and_dssp.014.dat
	else :
		echo "0*"
		paste dssp.001.dat rmsd-total_Ttraj_3-26.CA.001.dat > rmsd_and_dssp.001.dat
		paste dssp.002.dat rmsd-total_Ttraj_3-26.CA.002.dat > rmsd_and_dssp.002.dat
		paste dssp.003.dat rmsd-total_Ttraj_3-26.CA.003.dat > rmsd_and_dssp.003.dat
		paste dssp.004.dat rmsd-total_Ttraj_3-26.CA.004.dat > rmsd_and_dssp.004.dat
		paste dssp.005.dat rmsd-total_Ttraj_3-26.CA.005.dat > rmsd_and_dssp.005.dat
		paste dssp.006.dat rmsd-total_Ttraj_3-26.CA.006.dat > rmsd_and_dssp.006.dat
		paste dssp.007.dat rmsd-total_Ttraj_3-26.CA.007.dat > rmsd_and_dssp.007.dat
		paste dssp.008.dat rmsd-total_Ttraj_3-26.CA.008.dat > rmsd_and_dssp.008.dat
		paste dssp.009.dat rmsd-total_Ttraj_3-26.CA.009.dat > rmsd_and_dssp.009.dat
		paste dssp.010.dat rmsd-total_Ttraj_3-26.CA.010.dat > rmsd_and_dssp.010.dat
		paste dssp.011.dat rmsd-total_Ttraj_3-26.CA.011.dat > rmsd_and_dssp.011.dat
		paste dssp.012.dat rmsd-total_Ttraj_3-26.CA.012.dat > rmsd_and_dssp.012.dat
		paste dssp.013.dat rmsd-total_Ttraj_3-26.CA.013.dat > rmsd_and_dssp.013.dat
		paste dssp.014.dat rmsd-total_Ttraj_3-26.CA.014.dat > rmsd_and_dssp.014.dat
	fi
fi


ponto=$4 
temps=$5  
#echo "$ponto"              
#echo "$temps"
if [ "$ponto" = "underline" ]; then
	echo "underline"
	if [ "$temps" = "temps" ]; then
		echo "temps"
		cat rmsd-total_Ttraj_3-26.CA.269.5.dat   rmsd-total_Ttraj_3-26.CA.351.57.dat  rmsd-total_Ttraj_3-26.CA.453.11.dat rmsd-total_Ttraj_3-26.CA.284.53.dat  rmsd-total_Ttraj_3-26.CA.370.19.dat  rmsd-total_Ttraj_3-26.CA.476.12.dat rmsd-total_Ttraj_3-26.CA.300.24.dat  rmsd-total_Ttraj_3-26.CA.389.61.dat  rmsd-total_Ttraj_3-26.CA.500.14.dat rmsd-total_Ttraj_3-26.CA.316.62.dat  rmsd-total_Ttraj_3-26.CA.409.86.dat  rmsd-total_Ttraj_3-26.CA.525.21.dat rmsd-total_Ttraj_3-26.CA.333.73.dat  rmsd-total_Ttraj_3-26.CA.431.01.dat > rmsd.alltemperatures.dat
	else :
		echo "0*"
		cat rmsd-total_Ttraj_3-33_CA.001.dat  rmsd-total_Ttraj_3-33_CA.003.dat  rmsd-total_Ttraj_3-33_CA.005.dat  rmsd-total_Ttraj_3-33_CA.007.dat  rmsd-total_Ttraj_3-33_CA.009.dat  rmsd-total_Ttraj_3-33_CA.011.dat  rmsd-total_Ttraj_3-33_CA.013.dat rmsd-total_Ttraj_3-33_CA.002.dat  rmsd-total_Ttraj_3-33_CA.004.dat  rmsd-total_Ttraj_3-33_CA.006.dat  rmsd-total_Ttraj_3-33_CA.008.dat  rmsd-total_Ttraj_3-33_CA.010.dat  rmsd-total_Ttraj_3-33_CA.012.dat  rmsd-total_Ttraj_3-33_CA.014.dat > rmsd.alltemperatures.dat
	fi
else :
	echo "ponto"
	if [ "$temps" = "temps" ]; then
		echo "temps"
		cat rmsd-total_Ttraj_3-26.CA.269.5.dat   rmsd-total_Ttraj_3-26.CA.351.57.dat  rmsd-total_Ttraj_3-26.CA.453.11.dat rmsd-total_Ttraj_3-26.CA.284.53.dat  rmsd-total_Ttraj_3-26.CA.370.19.dat  rmsd-total_Ttraj_3-26.CA.476.12.dat rmsd-total_Ttraj_3-26.CA.300.24.dat  rmsd-total_Ttraj_3-26.CA.389.61.dat  rmsd-total_Ttraj_3-26.CA.500.14.dat rmsd-total_Ttraj_3-26.CA.316.62.dat  rmsd-total_Ttraj_3-26.CA.409.86.dat  rmsd-total_Ttraj_3-26.CA.525.21.dat rmsd-total_Ttraj_3-26.CA.333.73.dat  rmsd-total_Ttraj_3-26.CA.431.01.dat > rmsd.alltemperatures.dat
	else :
		echo "0*"
		cat rmsd-total_Ttraj_3-33.CA.001.dat  rmsd-total_Ttraj_3-33.CA.003.dat  rmsd-total_Ttraj_3-33.CA.005.dat  rmsd-total_Ttraj_3-33.CA.007.dat  rmsd-total_Ttraj_3-33.CA.009.dat  rmsd-total_Ttraj_3-33.CA.011.dat  rmsd-total_Ttraj_3-33.CA.013.dat rmsd-total_Ttraj_3-33.CA.002.dat  rmsd-total_Ttraj_3-33.CA.004.dat  rmsd-total_Ttraj_3-33.CA.006.dat  rmsd-total_Ttraj_3-33.CA.008.dat  rmsd-total_Ttraj_3-33.CA.010.dat  rmsd-total_Ttraj_3-33.CA.012.dat  rmsd-total_Ttraj_3-33.CA.014.dat > rmsd.alltemperatures.dat
	fi
fi



cat rmsd_and_dssp.001.dat rmsd_and_dssp.001-2.dat rmsd_and_dssp.002.dat  rmsd_and_dssp.003.dat  rmsd_and_dssp.004.dat  rmsd_and_dssp.005.dat  rmsd_and_dssp.006.dat  rmsd_and_dssp.007.dat rmsd_and_dssp.008.dat   rmsd_and_dssp.009.dat rmsd_and_dssp.010.dat rmsd_and_dssp.011.dat  rmsd_and_dssp.012.dat  rmsd_and_dssp.013.dat  rmsd_and_dssp.014.dat > rmsd_and_dssp.alltemperatures.dat

#paste dssp.alltemperatures.dat rmsd.alltemperatures.dat > rmsd_and_dssp.alltemperatures.dat


dssp_go_$2.py rmsd_and_dssp.alltemperatures.dat $3                      
echo " DSSP of trajectories generated! " 
