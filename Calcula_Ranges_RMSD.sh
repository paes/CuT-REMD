# $1 é uma prot, seguida do [][](o $2) para acessar as 4 primeiras temps.
mkdir RANGES_RMSD
cd RANGES_RMSD
cat ../$1/$1_D1/MD/rmsd-total_Ttraj*$2* > $1_D_1.dat
cat ../$1/$1_F1/MD/rmsd-total_Ttraj*$2* > $1_F_1.dat
cat ../$3/$3_D1/MD/rmsd-total_Ttraj*$4* > $3_D_1.dat
cat ../$3/$3_F1/MD/rmsd-total_Ttraj*$4* > $3_F_1.dat
cat ../$5/$5_D1/MD/rmsd-total_Ttraj*$6* > $5_D_1.dat
cat ../$5/$5_F1/MD/rmsd-total_Ttraj*$6* > $5_F_1.dat
cat ../$7/$7_D1/MD/rmsd-total_Ttraj*$8* > $7_D_1.dat
cat ../$7/$7_F1/MD/rmsd-total_Ttraj*$8* > $7_F_1.dat
cat ../$9/$9_D1/MD/rmsd-total_Ttraj*${10}* > $9_D_1.dat
cat ../$9/$9_F1/MD/rmsd-total_Ttraj*${10}* > $9_F_1.dat
cat ../${11}/${11}_D1/MD/rmsd-total_Ttraj*${12}* > ${11}_D_1.dat
cat ../${11}/${11}_F1/MD/rmsd-total_Ttraj*${12}* > ${11}_F_1.dat
cat ../${13}/${13}_D1/MD/rmsd-total_Ttraj*${14}* > ${13}_D_1.dat
cat ../${13}/${13}_F1/MD/rmsd-total_Ttraj*${14}* > ${13}_F_1.dat
cat ../${15}/${15}_D1/MD/rmsd-total_Ttraj*${16}* > ${15}_D_1.dat
cat ../${15}/${15}_F1/MD/rmsd-total_Ttraj*${16}* > ${15}_F_1.dat
cat ../${17}/${17}_D1/MD/rmsd-total_Ttraj*${18}* > ${17}_D_1.dat
cat ../${17}/${17}_F1/MD/rmsd-total_Ttraj*${18}* > ${17}_F_1.dat
cat ../${19}/${19}_D1/MD/rmsd-total_Ttraj*${20}* > ${19}_D_1.dat
cat ../${19}/${19}_F1/MD/rmsd-total_Ttraj*${20}* > ${19}_F_1.dat
cat ../${21}/${21}_D1/MD/rmsd-total_Ttraj*${22}* > ${21}_D_1.dat
cat ../${21}/${21}_F1/MD/rmsd-total_Ttraj*${22}* > ${21}_F_1.dat
cat ../${23}/${23}_D1/MD/rmsd-total_Ttraj*${24}* > ${23}_D_1.dat
cat ../${23}/${23}_F1/MD/rmsd-total_Ttraj*${24}* > ${23}_F_1.dat
cat ../${25}/${25}_S_D1/MD/rmsd-total_Ttraj*${26}* > ${25}_S_D_1.dat
cat ../${25}/${25}_S_F1/MD/rmsd-total_Ttraj*${26}* > ${25}_S_F_1.dat
cat ../${27}/${27}_B_D1/MD/rmsd-total_Ttraj*${28}* > ${27}_B_D_1.dat
cat ../${27}/${27}_B_F1/MD/rmsd-total_Ttraj*${28}* > ${27}_B_F_1.dat
cat ../${29}/${29}_D1/MD/rmsd-total_Ttraj*${30}* > ${29}_D_1.dat
cat ../${29}/${29}_F1/MD/rmsd-total_Ttraj*${30}* > ${29}_F_1.dat
#cat ../${31}/${31}_D1/MD/gdt-total_Ttraj.${32}* > ${31}_D_1.dat
#cat ../${31}/${31}_F1/MD/gdt-total_Ttraj.${32}* > ${31}_F_1.dat



rmsd_ranges.py -i $1_D_1.dat -o rmsd_range_$1_d1.dat -c 2
rmsd_ranges.py -i $1_F_1.dat -o rmsd_range_$1_f1.dat -c 2
rmsd_ranges.py -i $3_D_1.dat -o rmsd_range_$3_d1.dat -c 2
rmsd_ranges.py -i $3_F_1.dat -o rmsd_range_$3_f1.dat -c 2
rmsd_ranges.py -i $5_D_1.dat -o rmsd_range_$5_d1.dat -c 2
rmsd_ranges.py -i $5_F_1.dat -o rmsd_range_$5_f1.dat -c 2
rmsd_ranges.py -i $7_D_1.dat -o rmsd_range_$7_d1.dat -c 2
rmsd_ranges.py -i $7_F_1.dat -o rmsd_range_$7_f1.dat -c 2
rmsd_ranges.py -i $9_D_1.dat -o rmsd_range_$9_d1.dat -c 2
rmsd_ranges.py -i $9_F_1.dat -o rmsd_range_$9_f1.dat -c 2
rmsd_ranges.py -i ${11}_D_1.dat -o rmsd_range_${11}_d1.dat -c 2
rmsd_ranges.py -i ${11}_F_1.dat -o rmsd_range_${11}_f1.dat -c 2
rmsd_ranges.py -i ${13}_D_1.dat -o rmsd_range_${13}_d1.dat -c 2
rmsd_ranges.py -i ${13}_F_1.dat -o rmsd_range_${13}_f1.dat -c 2
rmsd_ranges.py -i ${15}_D_1.dat -o rmsd_range_${15}_d1.dat -c 2
rmsd_ranges.py -i ${15}_F_1.dat -o rmsd_range_${15}_f1.dat -c 2
rmsd_ranges.py -i ${17}_D_1.dat -o rmsd_range_${17}_d1.dat -c 2
rmsd_ranges.py -i ${17}_F_1.dat -o rmsd_range_${17}_f1.dat -c 2
rmsd_ranges.py -i ${19}_D_1.dat -o rmsd_range_${19}_d1.dat -c 2
rmsd_ranges.py -i ${19}_F_1.dat -o rmsd_range_${19}_f1.dat -c 2
rmsd_ranges.py -i ${21}_D_1.dat -o rmsd_range_${21}_d1.dat -c 2
rmsd_ranges.py -i ${21}_F_1.dat -o rmsd_range_${21}_f1.dat -c 2
rmsd_ranges.py -i ${23}_D_1.dat -o rmsd_range_${23}_d1.dat -c 2
rmsd_ranges.py -i ${23}_F_1.dat -o rmsd_range_${23}_f1.dat -c 2
rmsd_ranges.py -i ${25}_S_D_1.dat -o rmsd_range_${25}_s_d1.dat -c 2
rmsd_ranges.py -i ${25}_S_F_1.dat -o rmsd_range_${25}_s_f1.dat -c 2
rmsd_ranges.py -i ${27}_B_D_1.dat -o rmsd_range_${27}_b_d1.dat -c 2
rmsd_ranges.py -i ${27}_B_F_1.dat -o rmsd_range_${27}_b_f1.dat -c 2
rmsd_ranges.py -i ${29}_D_1.dat -o rmsd_range_${29}_d1.dat -c 2
rmsd_ranges.py -i ${29}_F_1.dat -o rmsd_range_${29}_f1.dat -c 2


cat rmsd_range_$1_d1.dat > ranges_grouped.dat
tail -n 1 rmsd_range_$1_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_$3_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_$3_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_$5_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_$5_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_$7_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_$7_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_$9_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_$9_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${11}_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${11}_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${13}_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${13}_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${15}_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${15}_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${17}_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${17}_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${19}_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${19}_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${21}_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${21}_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${23}_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${23}_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${25}_s_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${25}_s_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${27}_b_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${27}_b_f1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${29}_d1.dat >> ranges_grouped.dat
tail -n 1 rmsd_range_${29}_f1.dat >> ranges_grouped.dat

graph_rmsd_ranges.py -i ranges_grouped.dat -o ranges_rmsd.png

grep -e "#" -e "Tr" -e "$1" ranges_grouped.dat  >   ranges_$1.dat
grep -e "#" -e "Tr" -e "$3" ranges_grouped.dat  >   ranges_$3.dat
grep -e "#" -e "Tr" -e "$5" ranges_grouped.dat  >   ranges_$5.dat
grep -e "#" -e "Tr" -e "$7" ranges_grouped.dat  >   ranges_$7.dat
grep -e "#" -e "Tr" -e "$9" ranges_grouped.dat  >   ranges_$9.dat
grep -e "#" -e "Tr" -e "${11}" ranges_grouped.dat > ranges_${11}.dat
grep -e "#" -e "Tr" -e "${13}" ranges_grouped.dat > ranges_${13}.dat
grep -e "#" -e "Tr" -e "${15}" ranges_grouped.dat > ranges_${15}.dat
grep -e "#" -e "Tr" -e "${17}" ranges_grouped.dat > ranges_${17}.dat
grep -e "#" -e "Tr" -e "${19}" ranges_grouped.dat > ranges_${19}.dat
grep -e "#" -e "Tr" -e "${21}" ranges_grouped.dat > ranges_${21}.dat
grep -e "#" -e "Tr" -e "${23}" ranges_grouped.dat > ranges_${23}.dat
grep -e "#" -e "Tr" -e "${25}_S" ranges_grouped.dat > ranges_${25}_S.dat
grep -e "#" -e "Tr" -e "${27}_B" ranges_grouped.dat > ranges_${27}_B.dat
grep -e "#" -e "Tr" -e "${29}" ranges_grouped.dat > ranges_${29}.dat


#graph_gdt_ranges_individual.py -i ranges_$1.dat -o    ranges_$1.png -t
#graph_gdt_ranges_individual.py -i ranges_$3.dat -o    ranges_$3.png -t
#graph_gdt_ranges_individual.py -i ranges_$5.dat -o    ranges_$5.png -t
#graph_gdt_ranges_individual.py -i ranges_$7.dat -o    ranges_$7.png -t
#graph_gdt_ranges_individual.py -i ranges_$9.dat -o    ranges_$9.png -t
#graph_gdt_ranges_individual.py -i ranges_${11}.dat -o ranges_${11}.png -t
#graph_gdt_ranges_individual.py -i ranges_${13}.dat -o ranges_${13}.png -t
#graph_gdt_ranges_individual.py -i ranges_${15}.dat -o ranges_${15}.png -t
#graph_gdt_ranges_individual.py -i ranges_${17}.dat -o ranges_${17}.png -t
#graph_gdt_ranges_individual.py -i ranges_${19}.dat -o ranges_${19}.png -t
#graph_gdt_ranges_individual.py -i ranges_${21}.dat -o ranges_${21}.png -t
#graph_gdt_ranges_individual.py -i ranges_${23}.dat -o ranges_${23}.png -t
#graph_gdt_ranges_individual.py -i ranges_${25}_S.dat -o ranges_${25}_S.png -t
#graph_gdt_ranges_individual.py -i ranges_${27}_B.dat -o ranges_${27}_B.png -t
#graph_gdt_ranges_individual.py -i ranges_${29}.dat -o ranges_${29}.png -t


#Calcula_Ranges_GDT.sh 1L2Y [23][6802] 1E0Q [23][6913][9025] 1VII [23][6891][938].[5636] 1RIJ [23][6802][976]

#Calcula_Ranges_GDT.sh 1E0L [23][6891][9383].[5636] 1E0Q [23][6913][9025] 1FME [23][6801][9406].[526][!1] 1L2Y [23][6802] 1LE1 [23][6914] 1PRB [23][6890]  1RIJ [23][6802][976] 1UAO [23] 1UNC [23][6801] 1VII [23][6891][938].[5636] GTT [23][6914]


#first Calcula_Ranges_RMSD.sh 1L2Y [23][6802] 1PRB [23][6890] 1RIJ [23][6802][976]  1UNC [23][6801] 1VII [23][6891][938].[5636] 2WXC  [23][68902][9258] 1E0L [23][6891][9383].[5636] 1E0Q [23][6913][9025] 1LE1 [23][6914] 1UAO [23] 1FME [23][6801][9406].[526][!1] GTT [23][6914] 2HBA [23][6810][9406] 2HBA [23][68902][9258] 1PSV [23][6801]

#second= 1PRB e 1E0Q com 6 Calcula_Ranges_GDT.sh 1L2Y [23][6802] 1PRB [23][689013][0706924].[58683][!6] 1RIJ [23][6802][976]  1UNC [23][6801] 1VII [23][6891][938].[5636] 2WXC  [23][68902][9258] 1E0L [23][6891][9383].[5636] 1E0Q [23][69138][69025] 1LE1 [23][6914] 1UAO [23] 1FME [23][6801][9406].[526][!1] GTT [23][6914] 2HBA [23][6810][9406] 2HBA [23][68902][9258] 1PSV [23][6801]

#third= 1PRB e 1E0Q com 4 Calcula_Ranges_GDT.sh 1L2Y [23][6802] 1PRB [23][6890][9024] 1RIJ [23][6802][976]  1UNC [23][6801] 1VII [23][6891][938].[5636] 2WXC  [23][68902][9258] 1E0L [23][6891][9383].[5636] 1E0Q [23][6913][9025].[524] 1LE1 [23][6914] 1UAO [23] 1FME [23][6801][9406].[526][!1] GTT [23][6914]  2HBA [23][6810][9406] 2HBA [23][68902][9258] 1PSV [23][6801]


# SOMENTE ALFA Calcula_Ranges_GDT.sh 1L2Y [23][6802] 1PRB [23][6890] 1RIJ [23][6802][976]  1UNC [23][6801] 1VII [23][6891][938].[5636] 1WXC  [23][68902][9258]

# SOMENTE BETA Calcula_Ranges_GDT.sh 1E0L [23][6891][9383].[5636] 1E0Q [23][6913][9025] 1LE1 [23][6914] 1UAO [23] 

# SOMENTE ALFA-BETA Calcula_Ranges_GDT.sh 1FME [23][6801][9406].[526][!1] GTT [23][6914] 2HBA_S [23][6810][9406] 2HBA_B [23][68902][9258] 1PSV [23][6801]



