#!/bin/bash


TEMPLIST=`cat temperatures.dat`

 AQUI CALCULO OS RMSDS PARA CADA TEMPERATURA !
for ext in 001 002 003 004 005 006 007 008 009 010 011 012 013 014 ; do
rm radgyr-total_Ttraj.$ext.dat
cpptraj job_id.prmtop << EOF
trajin remd_total.$ext.pdb #para cada uma das trajetorias
radgyr out radgyr_Ttraj.$ext.dat
EOF

done
