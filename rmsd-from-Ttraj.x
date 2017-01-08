#!/bin/bash


TEMPLIST=`cat temperatures.dat`

## AQUI EU ESTOU GERANDO, A PARTIR DOS rend_00x.Ttraj.TEMP, usando os  .PARMS,  os NCDF TOTAL PARA CADA TEMPERATURA!!!
#for ext in 001 002 003 004 005 006 007 008 009 010 011 012 013 014 ; do
#	rm remd_total_Ttraj.$ext.ncdf
#	for co in 001 002 003 004 005 006 ; do

#	cpptraj $1.prmtop << EOF
#	trajin remd_$co.ncdf.$ext
#	parm $2
#	reference $2 parm $2 [pdb-file]
#	trajout remd_total_Ttraj.$ext.pdb pdb append
#	go
#EOF
#	done
#done


 AQUI CALCULO OS RMSDS PARA CADA TEMPERATURA !
for ext in $TEMPLIST ; do
rm rmsd-total_Ttraj_$3-$4.$ext.dat
rm rmsd-total_Ttraj_$3-$4_CA.$ext.dat
cpptraj $1.prmtop << EOF
trajin remd_total_Ttraj.$ext.pdb #para cada uma das trajetorias
parm $2
reference $2 parm $2 [pdb-file]
rms remd_total_Ttraj.$ext.pdb ref [pdb-file] :$3-$4@CA,C,N :$3-$4@CA,C,N out rmsd-total_Ttraj_$3-$4.$ext.dat
EOF

cpptraj $1.prmtop << EOF
trajin remd_total_Ttraj.$ext.pdb #para cada uma das trajetorias
parm $2
reference $2 parm $2 [pdb-file]
rms remd_total_Ttraj.$ext.pdb ref [pdb-file] :$3-$4@CA :$3-$4@CA out rmsd-total_Ttraj_$3-$4_CA.$ext.dat
EOF
done
