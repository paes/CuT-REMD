#!/bin/bash


TEMPLIST=`cat temperatures.dat`
mv cluster cluster.pdb

cpptraj $1.prmtop << EOF
trajin cluster.pdb 
parm $2
reference $2 parm $2 [pdb-file]
rms remd_total_Ttraj.$ext.pdb ref [pdb-file] :$3-$4@CA :3-33@CA out rmsd-clusters.dat
EOF

clusco_cpu -t cluster.pdb -s gdt -e ../LEAP/1UNC01-Hs.pdb -o gdt-clusters.dat
 sed s/"         0     "//g gdt-clusters.dat > gdt-clusters.dat2
mv gdt-clusters.dat2 gdt-clusters.dat


head rmsd-clusters.dat -n 6 > rmsd-top5-clusters.dat
head gdt-clusters.dat -n 5 > gdt-top5-clusters.dat

awk '{if(min>$2||NR==1){min=$2;a[$2]=$0}}END{print a[min]}' rmsd-top5-clusters.dat > rmsd-Bests.dat
awk '{if(min>$2||NR==1){min=$2;a[$2]=$0}}END{print a[min]}' rmsd-total_Ttraj_3-33.CA.*.dat >> rmsd-Bests.dat


awk '{if(max<$2||NR==1){max=$2;a[$2]=$0}}END{print a[max]}' gdt-top5-clusters.dat > gdt-Bests.dat
awk '{if(max<$2||NR==1){max=$2;a[$2]=$0}}END{print a[max]}' gdt-total*.dat >> gdt-Bests.dat
