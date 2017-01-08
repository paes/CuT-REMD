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


 AQUI CALCULO OS GDTS PARA CADA TEMPERATURA !
for ext in $TEMPLIST ; do
	clusco_cpu -t remd_total_Ttraj.$ext.pdb -s gdt -e ../1UNC01-Hs.pdb -o gdt-total_Ttraj.$ext.dat
	 sed s/"         0     "//g gdt-total_Ttraj.$ext.dat > gdt-total_Ttraj.$ext.dat2
	#rm gdt-total_Ttraj.$ext.dat
	mv gdt-total_Ttraj.$ext.dat2 gdt-total_Ttraj.$ext.dat
done



