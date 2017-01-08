#!/bin/bash


TEMPLIST=`cat temperatures.dat`
TEMPLIST2=`cat temperatures2.dat`

## AQUI EU ESTOU GERANDO, A PARTIR DOS rend_00x.Ttraj.TEMP, usando os  .PARMS,  os NCDF TOTAL PARA CADA TEMPERATURA!!!


for ext in $TEMPLIST ; do
rm remd_001.Ttraj.$ext
	for sm in 001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 ; do

	cpptraj $1.prmtop << EOF
	trajin remd_001_small_$sm.Ttraj.$ext
	parm $2
	reference $2 parm $2 [pdb-file]
	trajout remd_001.Ttraj.$ext append
	go
EOF
	done
done


#for ext in $TEMPLIST ; do
#cp remd_002.Ttraj.$ext.backup remd_002.Ttraj.$ext
#done

########for ext in $TEMPLIST ; do ## TEM QUE DIMINUIR A ENTRADA 002 , por isso estou fazendo tudo isso
######## 		mkdir BACKUPS
########        cp /BACKUPS/remd_002.Ttraj.$ext.backup2 BACKUPS/remd_002.Ttraj.$ext.backup3 
########        cp remd_002.Ttraj.$ext.backup BACKUPS/remd_002.Ttraj.$ext.backup2 
########        cp remd_002.Ttraj.$ext remd_002.Ttraj.$ext.backup
########        rm remd_002.Ttraj.$ext
######## 	cpptraj $1.prmtop << EOF
######## 	trajin remd_002.Ttraj.$ext.backup 1 last 2
######## 	parm $2                                                                                                       
########        reference $2 parm $2 [pdb-file]                                                                               
########        trajout remd_002.Ttraj.$ext append                                                         
########        go 
########EOF
######## done

for ext in $TEMPLIST ; do
	rm remd_total_Ttraj.$ext.pdb
	for co in 001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 ; do

	cpptraj $1.prmtop << EOF
	trajin remd_$co.Ttraj.$ext
	parm $2
	reference $2 parm $2 [pdb-file]
	trajout remd_total_Ttraj.$ext.pdb pdb append
	go
EOF
	done
done


