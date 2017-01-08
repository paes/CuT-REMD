#!/bin/bash


TEMPLIST=`cat temperatures.dat`


## AQUI EU ESTOU GERANDO, A PARTIR DOS rend_00x.Ttraj.TEMP, usando os  .PARMS,  os NCDF TOTAL PARA CADA TEMPERATURA!!!


for ext in $TEMPLIST ; do
	rm remd_001.Ttraj.$ext.pdb
	for sm in 001 002 003 004 005 ; do

	cpptraj $1.prmtop << EOF
	trajin remd_001_small_$sm.Ttraj.$ext
	parm $2
	reference $2 parm $2 [pdb-file]
	trajout remd_total_Ttraj.$ext.ncdf ncdf append
	go
EOF
	done
done




for ext in $TEMPLIST ; do
	rm remd_total_Ttraj.$ext.pdb
	for co in 002 003 004 005 006 ; do

	cpptraj $1.prmtop << EOF
	trajin remd_$co.Ttraj.$ext
	parm $2
	reference $2 parm $2 [pdb-file]
	trajout remd_total_Ttraj.$ext.ncdf ncdf append
	go
EOF
	done
done


