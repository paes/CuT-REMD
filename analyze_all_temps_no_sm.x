#!/bin/bash

TEMPLIST=`cat temperatures.dat`

for co in 001 002 003 004 005 006 ; do

for T in $TEMPLIST ; do
		  cpptraj $1.prmtop <<EOF
		trajin remd_$co.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_$co.Ttraj.$T
		go
EOF

#		  cpptraj $1.prmtop <<EOF
#		trajin remd_$co.Ttraj.$T

#		parm $2
#		reference $2 parm $2 [pdb-file]
#		rms remd_$co.Ttraj.$T ref [pdb-file] :1-35@CA,C,N :1-35@CA,C,N  out rmsd-co_$co-temp_$T.dat
#		go
#EOF

done

done
