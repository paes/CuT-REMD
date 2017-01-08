# $1 é uma prot, seguida do [][](o $2) para acessar as 4 primeiras temps.
mkdir OUTROS_GRAFICOS
cd OUTROS_GRAFICOS
head -n 1 ../$1/$1_D1/MD/gdt-Bests.dat >       $1_D_1.Bests.dat
head -n 1 ../$1/$1_F1/MD/gdt-Bests.dat >       $1_F_1.Bests.dat
head -n 1 ../$3/$3_D1/MD/gdt-Bests.dat >       $3_D_1.Bests.dat
head -n 1 ../$3/$3_F1/MD/gdt-Bests.dat >       $3_F_1.Bests.dat
head -n 1 ../$5/$5_D1/MD/gdt-Bests.dat >       $5_D_1.Bests.dat
head -n 1 ../$5/$5_F1/MD/gdt-Bests.dat >       $5_F_1.Bests.dat
head -n 1 ../$7/$7_D1/MD/gdt-Bests.dat >       $7_D_1.Bests.dat
head -n 1 ../$7/$7_F1/MD/gdt-Bests.dat >       $7_F_1.Bests.dat
head -n 1 ../$9/$9_D1/MD/gdt-Bests.dat >       $9_D_1.Bests.dat
head -n 1 ../$9/$9_F1/MD/gdt-Bests.dat >       $9_F_1.Bests.dat
head -n 1 ../${11}/${11}_D1/MD/gdt-Bests.dat > ${11}_D_1.Bests.dat
head -n 1 ../${11}/${11}_F1/MD/gdt-Bests.dat > ${11}_F_1.Bests.dat
head -n 1 ../${13}/${13}_D1/MD/gdt-Bests.dat > ${13}_D_1.Bests.dat
head -n 1 ../${13}/${13}_F1/MD/gdt-Bests.dat > ${13}_F_1.Bests.dat
head -n 1 ../${15}/${15}_D1/MD/gdt-Bests.dat > ${15}_D_1.Bests.dat
head -n 1 ../${15}/${15}_F1/MD/gdt-Bests.dat > ${15}_F_1.Bests.dat
head -n 1 ../${17}/${17}_D1/MD/gdt-Bests.dat > ${17}_D_1.Bests.dat
head -n 1 ../${17}/${17}_F1/MD/gdt-Bests.dat > ${17}_F_1.Bests.dat
head -n 1 ../${19}/${19}_D1/MD/gdt-Bests.dat > ${19}_D_1.Bests.dat
head -n 1 ../${19}/${19}_F1/MD/gdt-Bests.dat > ${19}_F_1.Bests.dat
head -n 1 ../${21}/${21}_D1/MD/gdt-Bests.dat > ${21}_D_1.Bests.dat
head -n 1 ../${21}/${21}_F1/MD/gdt-Bests.dat > ${21}_F_1.Bests.dat


echo "Protein	CLUS CT-REMD CLUS	REMD" > complete.dat
cat $1_D_1.Bests.dat $3_D_1.Bests.dat $5_D_1.Bests.dat $7_D_1.Bests.dat $9_D_1.Bests.dat ${11}_D_1.Bests.dat ${13}_D_1.Bests.dat ${15}_D_1.Bests.dat ${17}_D_1.Bests.dat ${19}_D_1.Bests.dat ${21}_D_1.Bests.dat > all_Bests_D1.dat
cat $1_F_1.Bests.dat $3_F_1.Bests.dat $5_F_1.Bests.dat $7_F_1.Bests.dat $9_F_1.Bests.dat ${11}_F_1.Bests.dat ${13}_F_1.Bests.dat ${15}_F_1.Bests.dat ${17}_F_1.Bests.dat ${19}_F_1.Bests.dat ${21}_F_1.Bests.dat > all_Bests_F1.dat

echo "$1" > proteinas.dat
echo "$3" >> proteinas.dat
echo "$5" >> proteinas.dat
echo "$7" >> proteinas.dat
echo "$9" >> proteinas.dat
echo "${11}" >> proteinas.dat
echo "${13}" >> proteinas.dat
echo "${15}" >> proteinas.dat
echo "${17}" >> proteinas.dat
echo "${19}" >> proteinas.dat
echo "${21}" >> proteinas.dat

paste proteinas.dat all_Bests_D1.dat all_Bests_F1.dat > both.dat
cat both.dat >> complete.dat


#cp ../immigration immigration.dat 
bash boxplot_gdt_teste_31out.sh $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} ${21} ${22} "Best5Clus"



tail -n 1 ../$1/$1_D1/MD/gdt-Bests.dat >       $1_D_1.Bests.dat
tail -n 1 ../$1/$1_F1/MD/gdt-Bests.dat >       $1_F_1.Bests.dat
tail -n 1 ../$3/$3_D1/MD/gdt-Bests.dat >       $3_D_1.Bests.dat
tail -n 1 ../$3/$3_F1/MD/gdt-Bests.dat >       $3_F_1.Bests.dat
tail -n 1 ../$5/$5_D1/MD/gdt-Bests.dat >       $5_D_1.Bests.dat
tail -n 1 ../$5/$5_F1/MD/gdt-Bests.dat >       $5_F_1.Bests.dat
tail -n 1 ../$7/$7_D1/MD/gdt-Bests.dat >       $7_D_1.Bests.dat
tail -n 1 ../$7/$7_F1/MD/gdt-Bests.dat >       $7_F_1.Bests.dat
tail -n 1 ../$9/$9_D1/MD/gdt-Bests.dat >       $9_D_1.Bests.dat
tail -n 1 ../$9/$9_F1/MD/gdt-Bests.dat >       $9_F_1.Bests.dat
tail -n 1 ../${11}/${11}_D1/MD/gdt-Bests.dat > ${11}_D_1.Bests.dat
tail -n 1 ../${11}/${11}_F1/MD/gdt-Bests.dat > ${11}_F_1.Bests.dat
tail -n 1 ../${13}/${13}_D1/MD/gdt-Bests.dat > ${13}_D_1.Bests.dat
tail -n 1 ../${13}/${13}_F1/MD/gdt-Bests.dat > ${13}_F_1.Bests.dat
tail -n 1 ../${15}/${15}_D1/MD/gdt-Bests.dat > ${15}_D_1.Bests.dat
tail -n 1 ../${15}/${15}_F1/MD/gdt-Bests.dat > ${15}_F_1.Bests.dat
tail -n 1 ../${17}/${17}_D1/MD/gdt-Bests.dat > ${17}_D_1.Bests.dat
tail -n 1 ../${17}/${17}_F1/MD/gdt-Bests.dat > ${17}_F_1.Bests.dat
tail -n 1 ../${19}/${19}_D1/MD/gdt-Bests.dat > ${19}_D_1.Bests.dat
tail -n 1 ../${19}/${19}_F1/MD/gdt-Bests.dat > ${19}_F_1.Bests.dat
tail -n 1 ../${21}/${21}_D1/MD/gdt-Bests.dat > ${21}_D_1.Bests.dat
tail -n 1 ../${21}/${21}_F1/MD/gdt-Bests.dat > ${21}_F_1.Bests.dat


echo "Protein	CLUS CT-REMD CLUS	REMD" > complete.dat
cat $1_D_1.Bests.dat $3_D_1.Bests.dat $5_D_1.Bests.dat $7_D_1.Bests.dat $9_D_1.Bests.dat ${11}_D_1.Bests.dat ${13}_D_1.Bests.dat ${15}_D_1.Bests.dat ${17}_D_1.Bests.dat ${19}_D_1.Bests.dat ${21}_D_1.Bests.dat > all_Bests_D1.dat
cat $1_F_1.Bests.dat $3_F_1.Bests.dat $5_F_1.Bests.dat $7_F_1.Bests.dat $9_F_1.Bests.dat ${11}_F_1.Bests.dat ${13}_F_1.Bests.dat ${15}_F_1.Bests.dat ${17}_F_1.Bests.dat ${19}_F_1.Bests.dat ${21}_F_1.Bests.dat > all_Bests_F1.dat

echo "$1" > proteinas.dat
echo "$3" >> proteinas.dat
echo "$5" >> proteinas.dat
echo "$7" >> proteinas.dat
echo "$9" >> proteinas.dat
echo "${11}" >> proteinas.dat
echo "${13}" >> proteinas.dat
echo "${15}" >> proteinas.dat
echo "${17}" >> proteinas.dat
echo "${19}" >> proteinas.dat
echo "${21}" >> proteinas.dat

paste proteinas.dat all_Bests_D1.dat all_Bests_F1.dat > both.dat
cat both.dat >> complete.dat


#cp ../immigration immigration.dat 
bash boxplot_gdt_teste_31out.sh $1 $2 $3 $4 $5 $6 $7 $8 $9  ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} ${21} ${22} "Best"


#bash boxplot_gdt_teste_31out.sh $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $18 $19 $20 $21

#FINAL GDTS


head -n 1 ../$1/$1_D1/MD/rmsd-Bests.dat >       $1_D_1.Bests.dat
head -n 1 ../$1/$1_F1/MD/rmsd-Bests.dat >       $1_F_1.Bests.dat
head -n 1 ../$3/$3_D1/MD/rmsd-Bests.dat >       $3_D_1.Bests.dat
head -n 1 ../$3/$3_F1/MD/rmsd-Bests.dat >       $3_F_1.Bests.dat
head -n 1 ../$5/$5_D1/MD/rmsd-Bests.dat >       $5_D_1.Bests.dat
head -n 1 ../$5/$5_F1/MD/rmsd-Bests.dat >       $5_F_1.Bests.dat
head -n 1 ../$7/$7_D1/MD/rmsd-Bests.dat >       $7_D_1.Bests.dat
head -n 1 ../$7/$7_F1/MD/rmsd-Bests.dat >       $7_F_1.Bests.dat
head -n 1 ../$9/$9_D1/MD/rmsd-Bests.dat >       $9_D_1.Bests.dat
head -n 1 ../$9/$9_F1/MD/rmsd-Bests.dat >       $9_F_1.Bests.dat
head -n 1 ../${11}/${11}_D1/MD/rmsd-Bests.dat > ${11}_D_1.Bests.dat
head -n 1 ../${11}/${11}_F1/MD/rmsd-Bests.dat > ${11}_F_1.Bests.dat
head -n 1 ../${13}/${13}_D1/MD/rmsd-Bests.dat > ${13}_D_1.Bests.dat
head -n 1 ../${13}/${13}_F1/MD/rmsd-Bests.dat > ${13}_F_1.Bests.dat
head -n 1 ../${15}/${15}_D1/MD/rmsd-Bests.dat > ${15}_D_1.Bests.dat
head -n 1 ../${15}/${15}_F1/MD/rmsd-Bests.dat > ${15}_F_1.Bests.dat
head -n 1 ../${17}/${17}_D1/MD/rmsd-Bests.dat > ${17}_D_1.Bests.dat
head -n 1 ../${17}/${17}_F1/MD/rmsd-Bests.dat > ${17}_F_1.Bests.dat
head -n 1 ../${19}/${19}_D1/MD/rmsd-Bests.dat > ${19}_D_1.Bests.dat
head -n 1 ../${19}/${19}_F1/MD/rmsd-Bests.dat > ${19}_F_1.Bests.dat
head -n 1 ../${21}/${21}_D1/MD/rmsd-Bests.dat > ${21}_D_1.Bests.dat
head -n 1 ../${21}/${21}_F1/MD/rmsd-Bests.dat > ${21}_F_1.Bests.dat


echo "Protein	CLUS CT-REMD CLUS	REMD" > complete.dat
cat $1_D_1.Bests.dat $3_D_1.Bests.dat $5_D_1.Bests.dat $7_D_1.Bests.dat $9_D_1.Bests.dat ${11}_D_1.Bests.dat ${13}_D_1.Bests.dat ${15}_D_1.Bests.dat ${17}_D_1.Bests.dat ${19}_D_1.Bests.dat ${21}_D_1.Bests.dat > all_Bests_D1.dat
cat $1_F_1.Bests.dat $3_F_1.Bests.dat $5_F_1.Bests.dat $7_F_1.Bests.dat $9_F_1.Bests.dat ${11}_F_1.Bests.dat ${13}_F_1.Bests.dat ${15}_F_1.Bests.dat ${17}_F_1.Bests.dat ${19}_F_1.Bests.dat ${21}_F_1.Bests.dat > all_Bests_F1.dat

echo "$1" > proteinas.dat
echo "$3" >> proteinas.dat
echo "$5" >> proteinas.dat
echo "$7" >> proteinas.dat
echo "$9" >> proteinas.dat
echo "${11}" >> proteinas.dat
echo "${13}" >> proteinas.dat
echo "${15}" >> proteinas.dat
echo "${17}" >> proteinas.dat
echo "${19}" >> proteinas.dat
echo "${21}" >> proteinas.dat

paste proteinas.dat all_Bests_D1.dat all_Bests_F1.dat > both.dat
cat both.dat >> complete.dat


#cp ../immigration immigration.dat 
bash boxplot_rmsd_teste_31out.sh $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} ${21} ${22} "Best5Clus"



tail -n 1 ../$1/$1_D1/MD/rmsd-Bests.dat >       $1_D_1.Bests.dat
tail -n 1 ../$1/$1_F1/MD/rmsd-Bests.dat >       $1_F_1.Bests.dat
tail -n 1 ../$3/$3_D1/MD/rmsd-Bests.dat >       $3_D_1.Bests.dat
tail -n 1 ../$3/$3_F1/MD/rmsd-Bests.dat >       $3_F_1.Bests.dat
tail -n 1 ../$5/$5_D1/MD/rmsd-Bests.dat >       $5_D_1.Bests.dat
tail -n 1 ../$5/$5_F1/MD/rmsd-Bests.dat >       $5_F_1.Bests.dat
tail -n 1 ../$7/$7_D1/MD/rmsd-Bests.dat >       $7_D_1.Bests.dat
tail -n 1 ../$7/$7_F1/MD/rmsd-Bests.dat >       $7_F_1.Bests.dat
tail -n 1 ../$9/$9_D1/MD/rmsd-Bests.dat >       $9_D_1.Bests.dat
tail -n 1 ../$9/$9_F1/MD/rmsd-Bests.dat >       $9_F_1.Bests.dat
tail -n 1 ../${11}/${11}_D1/MD/rmsd-Bests.dat > ${11}_D_1.Bests.dat
tail -n 1 ../${11}/${11}_F1/MD/rmsd-Bests.dat > ${11}_F_1.Bests.dat
tail -n 1 ../${13}/${13}_D1/MD/rmsd-Bests.dat > ${13}_D_1.Bests.dat
tail -n 1 ../${13}/${13}_F1/MD/rmsd-Bests.dat > ${13}_F_1.Bests.dat
tail -n 1 ../${15}/${15}_D1/MD/rmsd-Bests.dat > ${15}_D_1.Bests.dat
tail -n 1 ../${15}/${15}_F1/MD/rmsd-Bests.dat > ${15}_F_1.Bests.dat
tail -n 1 ../${17}/${17}_D1/MD/rmsd-Bests.dat > ${17}_D_1.Bests.dat
tail -n 1 ../${17}/${17}_F1/MD/rmsd-Bests.dat > ${17}_F_1.Bests.dat
tail -n 1 ../${19}/${19}_D1/MD/rmsd-Bests.dat > ${19}_D_1.Bests.dat
tail -n 1 ../${19}/${19}_F1/MD/rmsd-Bests.dat > ${19}_F_1.Bests.dat
tail -n 1 ../${21}/${21}_D1/MD/rmsd-Bests.dat > ${21}_D_1.Bests.dat
tail -n 1 ../${21}/${21}_F1/MD/rmsd-Bests.dat > ${21}_F_1.Bests.dat


echo "Protein	CLUS CT-REMD CLUS	REMD" > complete.dat
cat $1_D_1.Bests.dat $3_D_1.Bests.dat $5_D_1.Bests.dat $7_D_1.Bests.dat $9_D_1.Bests.dat ${11}_D_1.Bests.dat ${13}_D_1.Bests.dat ${15}_D_1.Bests.dat ${17}_D_1.Bests.dat ${19}_D_1.Bests.dat ${21}_D_1.Bests.dat > all_Bests_D1.dat
cat $1_F_1.Bests.dat $3_F_1.Bests.dat $5_F_1.Bests.dat $7_F_1.Bests.dat $9_F_1.Bests.dat ${11}_F_1.Bests.dat ${13}_F_1.Bests.dat ${15}_F_1.Bests.dat ${17}_F_1.Bests.dat ${19}_F_1.Bests.dat ${21}_F_1.Bests.dat > all_Bests_F1.dat

echo "$1" > proteinas.dat
echo "$3" >> proteinas.dat
echo "$5" >> proteinas.dat
echo "$7" >> proteinas.dat
echo "$9" >> proteinas.dat
echo "${11}" >> proteinas.dat
echo "${13}" >> proteinas.dat
echo "${15}" >> proteinas.dat
echo "${17}" >> proteinas.dat
echo "${19}" >> proteinas.dat
echo "${21}" >> proteinas.dat

paste proteinas.dat all_Bests_D1.dat all_Bests_F1.dat > both.dat
cat both.dat >> complete.dat


#cp ../immigration immigration.dat 
bash boxplot_rmsd_teste_31out.sh $1 $2 $3 $4 $5 $6 $7 $8 $9  ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} ${21} ${22} "Best"


#bash boxplot_rmsd_teste_31out.sh $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $18 $19 $20 $21








cd ..

