#!/bin/bash -f
##usage bash dssp_go.x job_id 1unc
nrep=`wc temperatures.dat | awk '{print $2}'` #where /media/lipinski/EXT4/SIMULACOES/2016/1UNC/2ns/1UNC_2ns_3_RUN1/temperatures.dat is the temperature.dat complete path
#for ext in `cat temperatures.dat` ; do



ponto=$4 
temps=$5  
#echo "$ponto"              
#echo "$temps"



for ext in 001 002 003 004 005 006 007 008 009 010 011 012 013 014 ; do
		#rm remd_001.Ttraj.$ext.pdb
		  cpptraj $1.prmtop <<EOF
		trajin remd_001*.ncdf.$ext
		trajin remd_002.ncdf.$ext 1 last 2
		trajin remd_003.ncdf.$ext
		trajin remd_004.ncdf.$ext
		trajin remd_005.ncdf.$ext
		trajin remd_006.ncdf.$ext
		
		secstruct :1-33 out dssp.$ext.dat ptrajformat
		go
EOF


if [ "$ponto" = "underline" ]; then
	echo "underline"
	if [ "$temps" = "temps" ]; then
		echo "temps"
		paste dssp.001.dat rmsd-total_Ttraj_3-33_CA.269.50.dat > rmsd_and_dssp.001.dat
		paste dssp.002.dat rmsd-total_Ttraj_3-33_CA.285.22.dat > rmsd_and_dssp.002.dat
		paste dssp.003.dat rmsd-total_Ttraj_3-33_CA.301.66.dat > rmsd_and_dssp.003.dat
		paste dssp.004.dat rmsd-total_Ttraj_3-33_CA.318.76.dat > rmsd_and_dssp.004.dat
		paste dssp.005.dat rmsd-total_Ttraj_3-33_CA.336.61.dat > rmsd_and_dssp.005.dat
		paste dssp.006.dat rmsd-total_Ttraj_3-33_CA.355.26.dat > rmsd_and_dssp.006.dat
		paste dssp.007.dat rmsd-total_Ttraj_3-33_CA.374.74.dat > rmsd_and_dssp.007.dat
		paste dssp.008.dat rmsd-total_Ttraj_3-33_CA.395.07.dat > rmsd_and_dssp.008.dat
		paste dssp.009.dat rmsd-total_Ttraj_3-33_CA.416.32.dat > rmsd_and_dssp.009.dat
		paste dssp.010.dat rmsd-total_Ttraj_3-33_CA.438.50.dat > rmsd_and_dssp.010.dat
		paste dssp.011.dat rmsd-total_Ttraj_3-33_CA.461.67.dat > rmsd_and_dssp.011.dat
		paste dssp.012.dat rmsd-total_Ttraj_3-33_CA.485.87.dat > rmsd_and_dssp.012.dat
		paste dssp.013.dat rmsd-total_Ttraj_3-33_CA.511.14.dat > rmsd_and_dssp.013.dat
		paste dssp.014.dat rmsd-total_Ttraj_3-33_CA.537.54.dat > rmsd_and_dssp.014.dat
	else :
		echo "0*"
		paste dssp.001.dat rmsd-total_Ttraj_3-33_CA.001.dat > rmsd_and_dssp.001.dat
		paste dssp.002.dat rmsd-total_Ttraj_3-33_CA.002.dat > rmsd_and_dssp.002.dat
		paste dssp.003.dat rmsd-total_Ttraj_3-33_CA.003.dat > rmsd_and_dssp.003.dat
		paste dssp.004.dat rmsd-total_Ttraj_3-33_CA.004.dat > rmsd_and_dssp.004.dat
		paste dssp.005.dat rmsd-total_Ttraj_3-33_CA.005.dat > rmsd_and_dssp.005.dat
		paste dssp.006.dat rmsd-total_Ttraj_3-33_CA.006.dat > rmsd_and_dssp.006.dat
		paste dssp.007.dat rmsd-total_Ttraj_3-33_CA.007.dat > rmsd_and_dssp.007.dat
		paste dssp.008.dat rmsd-total_Ttraj_3-33_CA.008.dat > rmsd_and_dssp.008.dat
		paste dssp.009.dat rmsd-total_Ttraj_3-33_CA.009.dat > rmsd_and_dssp.009.dat
		paste dssp.010.dat rmsd-total_Ttraj_3-33_CA.010.dat > rmsd_and_dssp.010.dat
		paste dssp.011.dat rmsd-total_Ttraj_3-33_CA.011.dat > rmsd_and_dssp.011.dat
		paste dssp.012.dat rmsd-total_Ttraj_3-33_CA.012.dat > rmsd_and_dssp.012.dat
		paste dssp.013.dat rmsd-total_Ttraj_3-33_CA.013.dat > rmsd_and_dssp.013.dat
		paste dssp.014.dat rmsd-total_Ttraj_3-33_CA.014.dat > rmsd_and_dssp.014.dat
	fi
else :
	echo "ponto"
	if [ "$temps" = "temps" ]; then
		echo "temps"
		paste dssp.001.dat rmsd-total_Ttraj_3-33.CA.269.50.dat > rmsd_and_dssp.001.dat
		paste dssp.002.dat rmsd-total_Ttraj_3-33.CA.285.22.dat > rmsd_and_dssp.002.dat
		paste dssp.003.dat rmsd-total_Ttraj_3-33.CA.301.66.dat > rmsd_and_dssp.003.dat
		paste dssp.004.dat rmsd-total_Ttraj_3-33.CA.318.76.dat > rmsd_and_dssp.004.dat
		paste dssp.005.dat rmsd-total_Ttraj_3-33.CA.336.61.dat > rmsd_and_dssp.005.dat
		paste dssp.006.dat rmsd-total_Ttraj_3-33.CA.355.26.dat > rmsd_and_dssp.006.dat
		paste dssp.007.dat rmsd-total_Ttraj_3-33.CA.374.74.dat > rmsd_and_dssp.007.dat
		paste dssp.008.dat rmsd-total_Ttraj_3-33.CA.395.07.dat > rmsd_and_dssp.008.dat
		paste dssp.009.dat rmsd-total_Ttraj_3-33.CA.416.32.dat > rmsd_and_dssp.009.dat
		paste dssp.010.dat rmsd-total_Ttraj_3-33.CA.438.50.dat > rmsd_and_dssp.010.dat
		paste dssp.011.dat rmsd-total_Ttraj_3-33.CA.461.67.dat > rmsd_and_dssp.011.dat
		paste dssp.012.dat rmsd-total_Ttraj_3-33.CA.485.87.dat > rmsd_and_dssp.012.dat
		paste dssp.013.dat rmsd-total_Ttraj_3-33.CA.511.14.dat > rmsd_and_dssp.013.dat
		paste dssp.014.dat rmsd-total_Ttraj_3-33.CA.537.54.dat > rmsd_and_dssp.014.dat
	else :
		echo "0*"
		paste dssp.001.dat rmsd-total_Ttraj_3-33.CA.001.dat > rmsd_and_dssp.001.dat
		paste dssp.002.dat rmsd-total_Ttraj_3-33.CA.002.dat > rmsd_and_dssp.002.dat
		paste dssp.003.dat rmsd-total_Ttraj_3-33.CA.003.dat > rmsd_and_dssp.003.dat
		paste dssp.004.dat rmsd-total_Ttraj_3-33.CA.004.dat > rmsd_and_dssp.004.dat
		paste dssp.005.dat rmsd-total_Ttraj_3-33.CA.005.dat > rmsd_and_dssp.005.dat
		paste dssp.006.dat rmsd-total_Ttraj_3-33.CA.006.dat > rmsd_and_dssp.006.dat
		paste dssp.007.dat rmsd-total_Ttraj_3-33.CA.007.dat > rmsd_and_dssp.007.dat
		paste dssp.008.dat rmsd-total_Ttraj_3-33.CA.008.dat > rmsd_and_dssp.008.dat
		paste dssp.009.dat rmsd-total_Ttraj_3-33.CA.009.dat > rmsd_and_dssp.009.dat
		paste dssp.010.dat rmsd-total_Ttraj_3-33.CA.010.dat > rmsd_and_dssp.010.dat
		paste dssp.011.dat rmsd-total_Ttraj_3-33.CA.011.dat > rmsd_and_dssp.011.dat
		paste dssp.012.dat rmsd-total_Ttraj_3-33.CA.012.dat > rmsd_and_dssp.012.dat
		paste dssp.013.dat rmsd-total_Ttraj_3-33.CA.013.dat > rmsd_and_dssp.013.dat
		paste dssp.014.dat rmsd-total_Ttraj_3-33.CA.014.dat > rmsd_and_dssp.014.dat
	fi
fi





dssp_go_$2.py rmsd_and_dssp.$ext.dat $3
done                       


cat rmsd_and_dssp.001.dat rmsd_and_dssp.001-2.dat rmsd_and_dssp.002.dat  rmsd_and_dssp.003.dat  rmsd_and_dssp.004.dat  rmsd_and_dssp.005.dat  rmsd_and_dssp.006.dat  rmsd_and_dssp.007.dat rmsd_and_dssp.008.dat   rmsd_and_dssp.009.dat rmsd_and_dssp.010.dat rmsd_and_dssp.011.dat  rmsd_and_dssp.012.dat  rmsd_and_dssp.013.dat  rmsd_and_dssp.014.dat > rmsd_and_dssp.alltemperatures.dat

#paste dssp.alltemperatures.dat rmsd.alltemperatures.dat > rmsd_and_dssp.alltemperatures.dat


dssp_go_$2.py rmsd_and_dssp.alltemperatures.dat $3                      
echo " DSSP of trajectories generated! " 
