#!/bin/bash


TEMPLIST=`cat temperatures.dat`

 AQUI CALCULO OS RMSDS PARA CADA TEMPERATURA !
for ext in $TEMPLIST ; do
rm radgyr-total_Ttraj.$ext.dat
cpptraj job_id.prmtop << EOF
trajin remd_total_Ttraj.$ext.pdb #para cada uma das trajetorias
radgyr out radgyr_Ttraj.$ext.dat
EOF
done

