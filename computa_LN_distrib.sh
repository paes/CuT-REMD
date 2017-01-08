#!/bin/bash

#$1 sao os mdouts que servem de entrada
#e $2 o tamanho da janela $3 $4 $5 $6 x e y

# agora vou tornar isso aqui mais simples de ser rodado
# vou adicionar $7 $8 e $9 referentes as distribuicoes que gerei
# e $10 $11 $12 referentes as simulacoes com as quais vou comparar.
# $13 dirá qual tipo da simulacao1 (A B C D E F G H ou I)
# $14 dirá qual tipo da simulacao2 (A B C D E F G H ou I)
# $15 caminho completo para pasta destino - onde serao gerados os dados e os graficos (lá vou criar uma pasta baseada em 13 e 14)


#exemplo --> bash computa_LN_distrib.sh remd_001 1 -650 400 -4 4 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN3 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN3 A E /home/lipinski/Desktop/SIMULACOES/LN_RESULTS

# bash computa_LN_distrib.sh remd_001 1 -650 400 -4 4 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN4 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN5 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CTREMD/1UNC_1ns_1_RUN6 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN4 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN5 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN6 B F /home/lipinski/Desktop/SIMULACOES/LN_RESULTS 







cd $7/MD/EnergyDistribution/
cp /home/lipinski/Dropbox/gtk_remd/src/energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/

mkdir ${15}/Ln_${13}vs${14} #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)

cp /home/lipinski/programs/ctremd/group_energies.py ${15}/Ln_${13}vs${14}/group_energies.py
#cp ../../../../verify_distribution.py ${15}/Ln_${13}vs${14}/verify_distribution.py
cp $7/MD/temperatures.dat ${15}/Ln_${13}vs${14}/temperatures.dat

      tail -n +13 dist-energy_269.5.xvg >  ${15}/Ln_${13}vs${14}/dist_269.5_1.dat 
      tail -n +13 dist-energy_285.22.xvg >  ${15}/Ln_${13}vs${14}/dist_285.22_1.dat 
      tail -n +13 dist-energy_301.66.xvg >  ${15}/Ln_${13}vs${14}/dist_301.66_1.dat 
      tail -n +13 dist-energy_318.76.xvg >  ${15}/Ln_${13}vs${14}/dist_318.76_1.dat 
      tail -n +13 dist-energy_336.61.xvg >  ${15}/Ln_${13}vs${14}/dist_336.61_1.dat 
      tail -n +13 dist-energy_355.26.xvg >  ${15}/Ln_${13}vs${14}/dist_355.26_1.dat 
      tail -n +13 dist-energy_374.74.xvg >  ${15}/Ln_${13}vs${14}/dist_374.74_1.dat 
      tail -n +13 dist-energy_395.07.xvg >  ${15}/Ln_${13}vs${14}/dist_395.07_1.dat 
      tail -n +13 dist-energy_416.32.xvg >  ${15}/Ln_${13}vs${14}/dist_416.32_1.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ${15}/Ln_${13}vs${14}/dist_438.5_1.dat 
      tail -n +13 dist-energy_461.67.xvg >  ${15}/Ln_${13}vs${14}/dist_461.67_1.dat 
      tail -n +13 dist-energy_485.87.xvg >  ${15}/Ln_${13}vs${14}/dist_485.87_1.dat 
      tail -n +13 dist-energy_511.14.xvg >  ${15}/Ln_${13}vs${14}/dist_511.14_1.dat 
      tail -n +13 dist-energy_537.54.xvg >  ${15}/Ln_${13}vs${14}/dist_537.54_1.dat 


cd $8/MD/EnergyDistribution/
cp /home/lipinski/Dropbox/gtk_remd/src/energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/


      tail -n +13 dist-energy_269.5.xvg >  ${15}/Ln_${13}vs${14}/dist_269.5_2.dat 
      tail -n +13 dist-energy_285.22.xvg >  ${15}/Ln_${13}vs${14}/dist_285.22_2.dat 
      tail -n +13 dist-energy_301.66.xvg >  ${15}/Ln_${13}vs${14}/dist_301.66_2.dat 
      tail -n +13 dist-energy_318.76.xvg >  ${15}/Ln_${13}vs${14}/dist_318.76_2.dat 
      tail -n +13 dist-energy_336.61.xvg >  ${15}/Ln_${13}vs${14}/dist_336.61_2.dat 
      tail -n +13 dist-energy_355.26.xvg >  ${15}/Ln_${13}vs${14}/dist_355.26_2.dat 
      tail -n +13 dist-energy_374.74.xvg >  ${15}/Ln_${13}vs${14}/dist_374.74_2.dat 
      tail -n +13 dist-energy_395.07.xvg >  ${15}/Ln_${13}vs${14}/dist_395.07_2.dat 
      tail -n +13 dist-energy_416.32.xvg >  ${15}/Ln_${13}vs${14}/dist_416.32_2.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ${15}/Ln_${13}vs${14}/dist_438.5_2.dat 
      tail -n +13 dist-energy_461.67.xvg >  ${15}/Ln_${13}vs${14}/dist_461.67_2.dat 
      tail -n +13 dist-energy_485.87.xvg >  ${15}/Ln_${13}vs${14}/dist_485.87_2.dat 
      tail -n +13 dist-energy_511.14.xvg >  ${15}/Ln_${13}vs${14}/dist_511.14_2.dat 
      tail -n +13 dist-energy_537.54.xvg >  ${15}/Ln_${13}vs${14}/dist_537.54_2.dat 

cd $9/MD/EnergyDistribution/
cp /home/lipinski/Dropbox/gtk_remd/src/energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/

      tail -n +13 dist-energy_269.5.xvg >  ${15}/Ln_${13}vs${14}/dist_269.5_3.dat 
      tail -n +13 dist-energy_285.22.xvg >  ${15}/Ln_${13}vs${14}/dist_285.22_3.dat 
      tail -n +13 dist-energy_301.66.xvg >  ${15}/Ln_${13}vs${14}/dist_301.66_3.dat 
      tail -n +13 dist-energy_318.76.xvg >  ${15}/Ln_${13}vs${14}/dist_318.76_3.dat 
      tail -n +13 dist-energy_336.61.xvg >  ${15}/Ln_${13}vs${14}/dist_336.61_3.dat 
      tail -n +13 dist-energy_355.26.xvg >  ${15}/Ln_${13}vs${14}/dist_355.26_3.dat 
      tail -n +13 dist-energy_374.74.xvg >  ${15}/Ln_${13}vs${14}/dist_374.74_3.dat 
      tail -n +13 dist-energy_395.07.xvg >  ${15}/Ln_${13}vs${14}/dist_395.07_3.dat 
      tail -n +13 dist-energy_416.32.xvg >  ${15}/Ln_${13}vs${14}/dist_416.32_3.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ${15}/Ln_${13}vs${14}/dist_438.5_3.dat 
      tail -n +13 dist-energy_461.67.xvg >  ${15}/Ln_${13}vs${14}/dist_461.67_3.dat 
      tail -n +13 dist-energy_485.87.xvg >  ${15}/Ln_${13}vs${14}/dist_485.87_3.dat 
      tail -n +13 dist-energy_511.14.xvg >  ${15}/Ln_${13}vs${14}/dist_511.14_3.dat 
      tail -n +13 dist-energy_537.54.xvg >  ${15}/Ln_${13}vs${14}/dist_537.54_3.dat 

cd ${15}/Ln_${13}vs${14}/
cp /home/lipinski/programs/ctremd/verify_distribution.sh .
cp /home/lipinski/programs/ctremd/verify_errors.sh .
#só roda o de baixo, que executa pelos 2 - bash verify_distribution.sh $1 $2 $3 $4 $5 $6 



echo "finalizando para ct-remd ..."
pwd










cd ${10}/MD/EnergyDistribution/

echo "me movi para ca:"
pwd
cp /home/lipinski/Dropbox/gtk_remd/src/energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/

mkdir ${15}/Ln_${13}vs${14} #crio uma pasta antes da pasta da simulacao (onde as outras simulacoes tb estao)
cp /home/lipinski/programs/ctremd/group_energies.py/group_energies.py ${15}/Ln_${13}vs${14}/group_energies.py
#cp ../../../../verify_distribution.py ${15}/Ln_${13}vs${14}/verify_distribution.py
cp $7/MD/temperatures.dat ${15}/Ln_${13}vs${14}/temperatures.dat

      tail -n +13 dist-energy_269.5.xvg >  ${15}/Ln_${13}vs${14}/dist_269.5_1_remd.dat 
      tail -n +13 dist-energy_285.22.xvg >  ${15}/Ln_${13}vs${14}/dist_285.22_1_remd.dat 
      tail -n +13 dist-energy_301.66.xvg >  ${15}/Ln_${13}vs${14}/dist_301.66_1_remd.dat 
      tail -n +13 dist-energy_318.76.xvg >  ${15}/Ln_${13}vs${14}/dist_318.76_1_remd.dat 
      tail -n +13 dist-energy_336.61.xvg >  ${15}/Ln_${13}vs${14}/dist_336.61_1_remd.dat 
      tail -n +13 dist-energy_355.26.xvg >  ${15}/Ln_${13}vs${14}/dist_355.26_1_remd.dat 
      tail -n +13 dist-energy_374.74.xvg >  ${15}/Ln_${13}vs${14}/dist_374.74_1_remd.dat 
      tail -n +13 dist-energy_395.07.xvg >  ${15}/Ln_${13}vs${14}/dist_395.07_1_remd.dat 
      tail -n +13 dist-energy_416.32.xvg >  ${15}/Ln_${13}vs${14}/dist_416.32_1_remd.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ${15}/Ln_${13}vs${14}/dist_438.5_1_remd.dat 
      tail -n +13 dist-energy_461.67.xvg >  ${15}/Ln_${13}vs${14}/dist_461.67_1_remd.dat 
      tail -n +13 dist-energy_485.87.xvg >  ${15}/Ln_${13}vs${14}/dist_485.87_1_remd.dat 
      tail -n +13 dist-energy_511.14.xvg >  ${15}/Ln_${13}vs${14}/dist_511.14_1_remd.dat 
      tail -n +13 dist-energy_537.54.xvg >  ${15}/Ln_${13}vs${14}/dist_537.54_1_remd.dat 


cd ${11}/MD/EnergyDistribution/
cp /home/lipinski/Dropbox/gtk_remd/src/energydistribution.config.bkps .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/


      tail -n +13 dist-energy_269.5.xvg >  ${15}/Ln_${13}vs${14}/dist_269.5_2_remd.dat 
      tail -n +13 dist-energy_285.22.xvg >  ${15}/Ln_${13}vs${14}/dist_285.22_2_remd.dat 
      tail -n +13 dist-energy_301.66.xvg >  ${15}/Ln_${13}vs${14}/dist_301.66_2_remd.dat 
      tail -n +13 dist-energy_318.76.xvg >  ${15}/Ln_${13}vs${14}/dist_318.76_2_remd.dat 
      tail -n +13 dist-energy_336.61.xvg >  ${15}/Ln_${13}vs${14}/dist_336.61_2_remd.dat 
      tail -n +13 dist-energy_355.26.xvg >  ${15}/Ln_${13}vs${14}/dist_355.26_2_remd.dat 
      tail -n +13 dist-energy_374.74.xvg >  ${15}/Ln_${13}vs${14}/dist_374.74_2_remd.dat 
      tail -n +13 dist-energy_395.07.xvg >  ${15}/Ln_${13}vs${14}/dist_395.07_2_remd.dat 
      tail -n +13 dist-energy_416.32.xvg >  ${15}/Ln_${13}vs${14}/dist_416.32_2_remd.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ${15}/Ln_${13}vs${14}/dist_438.5_2_remd.dat 
      tail -n +13 dist-energy_461.67.xvg >  ${15}/Ln_${13}vs${14}/dist_461.67_2_remd.dat 
      tail -n +13 dist-energy_485.87.xvg >  ${15}/Ln_${13}vs${14}/dist_485.87_2_remd.dat 
      tail -n +13 dist-energy_511.14.xvg >  ${15}/Ln_${13}vs${14}/dist_511.14_2_remd.dat 
      tail -n +13 dist-energy_537.54.xvg >  ${15}/Ln_${13}vs${14}/dist_537.54_2_remd.dat 

cd ${12}/MD/EnergyDistribution/
cp /home/lipinski/Dropbox/gtk_remd/src/energydistribution.config.bkp .	
rm energydistribution.config
cd data/
rm energy*
cd ..
cp energydistribution.config.bkp energydistribution.config
sed -i s/"ALVO"/"$1"/ energydistribution.config
python energydistribution.py 0
cd output/

      tail -n +13 dist-energy_269.5.xvg >  ${15}/Ln_${13}vs${14}/dist_269.5_3_remd.dat 
      tail -n +13 dist-energy_285.22.xvg >  ${15}/Ln_${13}vs${14}/dist_285.22_3_remd.dat 
      tail -n +13 dist-energy_301.66.xvg >  ${15}/Ln_${13}vs${14}/dist_301.66_3_remd.dat 
      tail -n +13 dist-energy_318.76.xvg >  ${15}/Ln_${13}vs${14}/dist_318.76_3_remd.dat 
      tail -n +13 dist-energy_336.61.xvg >  ${15}/Ln_${13}vs${14}/dist_336.61_3_remd.dat 
      tail -n +13 dist-energy_355.26.xvg >  ${15}/Ln_${13}vs${14}/dist_355.26_3_remd.dat 
      tail -n +13 dist-energy_374.74.xvg >  ${15}/Ln_${13}vs${14}/dist_374.74_3_remd.dat 
      tail -n +13 dist-energy_395.07.xvg >  ${15}/Ln_${13}vs${14}/dist_395.07_3_remd.dat 
      tail -n +13 dist-energy_416.32.xvg >  ${15}/Ln_${13}vs${14}/dist_416.32_3_remd.dat 
      tail -n +13 dist-energy_438.5.xvg  >  ${15}/Ln_${13}vs${14}/dist_438.5_3_remd.dat 
      tail -n +13 dist-energy_461.67.xvg >  ${15}/Ln_${13}vs${14}/dist_461.67_3_remd.dat 
      tail -n +13 dist-energy_485.87.xvg >  ${15}/Ln_${13}vs${14}/dist_485.87_3_remd.dat 
      tail -n +13 dist-energy_511.14.xvg >  ${15}/Ln_${13}vs${14}/dist_511.14_3_remd.dat 
      tail -n +13 dist-energy_537.54.xvg >  ${15}/Ln_${13}vs${14}/dist_537.54_3_remd.dat 
pwd
cd ${15}/Ln_${13}vs${14}/
cp /home/lipinski/programs/ctremd/verify_distribution.sh .
cp /home/lipinski/programs/ctremd/verify_errors.sh .
bash verify_distribution.sh $1 $2 $3 $4 $5 $6 ${13} ${14}
bash verify_errors.sh $1 $2 ${13} ${14}

echo "finalizando para remd ..."
pwd

