#!/bin/bash

TEMPLIST=`cat temperatures.dat`


for sm in 001 002 003 004 005 006 007 008 009 010; do
for T in $TEMPLIST ; do
		rm remd_001_small_$sm.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_001_small_$sm.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_001_small_$sm.Ttraj.$T
		go
EOF
done

done



for co in 002 003 004 005 006 ; do
for T in $TEMPLIST ; do
		rm remd_$co.Ttraj.$T
		  cpptraj $1.prmtop <<EOF
		trajin remd_$co.ncdf.001 remdtraj remdtrajtemp $T
		trajout remd_$co.Ttraj.$T
		go
EOF
done
done


#for co in 006 ; do
#for T in $TEMPLIST ; do
 #                 cpptraj $1.prmtop <<EOF
  #              trajin remd_teste.ncdf.001 remdtraj remdtrajtemp $T
   #             trajout remd_$co.Ttraj.$T
    #            go
#EOF
#done
#done

