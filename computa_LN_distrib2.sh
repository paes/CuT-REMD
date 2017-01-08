#!/bin/bash

#$1 sao os mdouts que servem de entrada
#e $2 o tamanho da janela $3 $4 $5 $6 x e y

# agora vou tornar isso aqui mais simples de ser rodado
# vou adicionar $7 $8 e $9 referentes as distribuicoes que gerei
# e $10 $11 $12 referentes as simulacoes com as quais vou comparar.
# $13 dirá qual tipo da simulacao1 (A B C D E F G H ou I)
# $14 dirá qual tipo da simulacao2 (A B C D E F G H ou I)
# $15 caminho completo para pasta destino - onde serao gerados os dados e os graficos (lá vou criar uma pasta baseada em 13 e 14)


#exemplo --> bash computa_LN_distrib.sh remd_001 1 -600 0 -4 4 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN3 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN3 A E /home/lipinski/Desktop/SIMULACOES/LN_RESULTS


cd ${15}/Ln_${13}vs${14}/
#cp /home/lipinski/programs/ctremd/verify_distribution.sh .
cp /home/lipinski/programs/ctremd/verify_errors2.sh .
#bash verify_distribution.sh $1 $2 $3 $4 $5 $6 ${13} ${14}
bash verify_errors2.sh $1 $2 ${13} ${14}

echo "finalizando para remd ..."
pwd

