#!/bin/bash -f
### DEVE SER CHAMADO NO DIRETORIO ANTERIOR ao diretorio principal, onde principal = 1UNC_1ns_1_RUN1!
# create_plots_relative_metrics.x RUN_NUMBER(SEED-1,2,3etc) TYPE_OF_SIMULATION(CT-REMD,REMD.CMD,MD)
#ex: create_plots_relative_metrics.x 1 1 2 3 4  


#novo: create_plots_relative_metrics.x (RUN_NUMBER) PATH_to1 PATH_to2 PATH_to3 PATH_to4
# create_plots_relative_metrics.x 1 


#create_plots_relative_metrics.x 1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns//OK/02-REMD/1UNC_1ns_2_RUN /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN


mkdir plots
cd plots


#abaixo sao os gdts para REMDs (ou CT-REMD)

echo "$6"
if [ "$6" = "." ]
then
	echo "using rmsd_point.py"
compute_rmsd_point.py rmsd.dat $2/MD/rmsd-total_Ttraj_3-33$6CA.269.50.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.355.26.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.461.67.dat $2/MD/rmsd-total_Ttraj_3-33$6CA.285.22.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.374.74.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.485.87.dat $2/MD/rmsd-total_Ttraj_3-33$6CA.301.66.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.395.07.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.511.14.dat $2/MD/rmsd-total_Ttraj_3-33$6CA.318.76.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.416.32.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.537.54.dat $2/MD/rmsd-total_Ttraj_3-33$6CA.336.61.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.438.50.dat
else
	echo "using rmsd.py"
compute_rmsd.py rmsd.dat $2/MD/rmsd-total_Ttraj_3-33$6CA.269.50.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.355.26.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.461.67.dat $2/MD/rmsd-total_Ttraj_3-33$6CA.285.22.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.374.74.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.485.87.dat $2/MD/rmsd-total_Ttraj_3-33$6CA.301.66.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.395.07.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.511.14.dat $2/MD/rmsd-total_Ttraj_3-33$6CA.318.76.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.416.32.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.537.54.dat $2/MD/rmsd-total_Ttraj_3-33$6CA.336.61.dat  $2/MD/rmsd-total_Ttraj_3-33$6CA.438.50.dat
fi

echo "$7"
if [ "$7" = "." ]
then
	echo "using rmsd_point.py"
compute_rmsd_point.py rmsd2.dat $3/MD/rmsd-total_Ttraj_3-33$7CA.269.50.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.355.26.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.461.67.dat $3/MD/rmsd-total_Ttraj_3-33$7CA.285.22.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.374.74.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.485.87.dat $3/MD/rmsd-total_Ttraj_3-33$7CA.301.66.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.395.07.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.511.14.dat $3/MD/rmsd-total_Ttraj_3-33$7CA.318.76.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.416.32.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.537.54.dat $3/MD/rmsd-total_Ttraj_3-33$7CA.336.61.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.438.50.dat
else
	echo "using rmsd.py"
compute_rmsd.py rmsd2.dat $3/MD/rmsd-total_Ttraj_3-33$7CA.269.50.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.355.26.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.461.67.dat $3/MD/rmsd-total_Ttraj_3-33$7CA.285.22.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.374.74.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.485.87.dat $3/MD/rmsd-total_Ttraj_3-33$7CA.301.66.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.395.07.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.511.14.dat $3/MD/rmsd-total_Ttraj_3-33$7CA.318.76.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.416.32.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.537.54.dat $3/MD/rmsd-total_Ttraj_3-33$7CA.336.61.dat  $3/MD/rmsd-total_Ttraj_3-33$7CA.438.50.dat
fi

#abaixo sao os gdts para MD, not REMD

echo "$8"
if [ "$8" = "." ]
then
	#compute_rmsd_3.py
	echo "using rmsd3.py"
	compute_rmsd_3_teste.py rmsd3.dat $4/MD/rmsd-total_Ttraj_3-33$8CA.001.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.006.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.011.dat $4/MD/rmsd-total_Ttraj_3-33$8CA.002.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.007.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.012.dat $4/MD/rmsd-total_Ttraj_3-33$8CA.003.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.008.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.013.dat $4/MD/rmsd-total_Ttraj_3-33$8CA.004.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.009.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.014.dat $4/MD/rmsd-total_Ttraj_3-33$8CA.005.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.010.dat

else
	#compute_rmsd_2.py
	echo "using rmsd2.py"
	compute_rmsd_2.py rmsd3.dat $4/MD/rmsd-total_Ttraj_3-33$8CA.001.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.006.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.011.dat $4/MD/rmsd-total_Ttraj_3-33$8CA.002.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.007.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.012.dat $4/MD/rmsd-total_Ttraj_3-33$8CA.003.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.008.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.013.dat $4/MD/rmsd-total_Ttraj_3-33$8CA.004.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.009.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.014.dat $4/MD/rmsd-total_Ttraj_3-33$8CA.005.dat  $4/MD/rmsd-total_Ttraj_3-33$8CA.010.dat
fi


echo "$9"
if [ "$9" = "." ]
then
	#compute_rmsd_3.py
	echo "using rmsd3.py"
	compute_rmsd_3_teste.py rmsd4.dat $5/MD/rmsd-total_Ttraj_3-33$9CA.001.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.006.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.011.dat $5/MD/rmsd-total_Ttraj_3-33$9CA.002.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.007.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.012.dat $5/MD/rmsd-total_Ttraj_3-33$9CA.003.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.008.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.013.dat $5/MD/rmsd-total_Ttraj_3-33$9CA.004.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.009.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.014.dat $5/MD/rmsd-total_Ttraj_3-33$9CA.005.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.010.dat

else
	#compute_rmsd_2.py
	echo "using rmsd2.py"
	compute_rmsd_2.py rmsd4.dat $5/MD/rmsd-total_Ttraj_3-33$9CA.001.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.006.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.011.dat $5/MD/rmsd-total_Ttraj_3-33$9CA.002.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.007.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.012.dat $5/MD/rmsd-total_Ttraj_3-33$9CA.003.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.008.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.013.dat $5/MD/rmsd-total_Ttraj_3-33$9CA.004.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.009.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.014.dat $5/MD/rmsd-total_Ttraj_3-33$9CA.005.dat  $5/MD/rmsd-total_Ttraj_3-33$9CA.010.dat
fi



paste rmsd.dat rmsd2.dat rmsd3.dat rmsd4.dat > rmsd_data.dat
rmsd_min.sh


####abaixo sao os gdts para REMDs (ou CT-REMD)

compute_gdt.py gdt.dat $2/MD/gdt-total_Ttraj.269.50.dat  $2/MD/gdt-total_Ttraj.355.26.dat  $2/MD/gdt-total_Ttraj.461.67.dat $2/MD/gdt-total_Ttraj.285.22.dat  $2/MD/gdt-total_Ttraj.374.74.dat  $2/MD/gdt-total_Ttraj.485.87.dat $2/MD/gdt-total_Ttraj.301.66.dat  $2/MD/gdt-total_Ttraj.395.07.dat  $2/MD/gdt-total_Ttraj.511.14.dat $2/MD/gdt-total_Ttraj.318.76.dat  $2/MD/gdt-total_Ttraj.416.32.dat  $2/MD/gdt-total_Ttraj.537.54.dat $2/MD/gdt-total_Ttraj.336.61.dat  $2/MD/gdt-total_Ttraj.438.50.dat

compute_gdt.py gdt2.dat $3/MD/gdt-total_Ttraj.269.50.dat  $3/MD/gdt-total_Ttraj.355.26.dat  $3/MD/gdt-total_Ttraj.461.67.dat $3/MD/gdt-total_Ttraj.285.22.dat  $3/MD/gdt-total_Ttraj.374.74.dat  $3/MD/gdt-total_Ttraj.485.87.dat $3/MD/gdt-total_Ttraj.301.66.dat  $3/MD/gdt-total_Ttraj.395.07.dat  $3/MD/gdt-total_Ttraj.511.14.dat $3/MD/gdt-total_Ttraj.318.76.dat  $3/MD/gdt-total_Ttraj.416.32.dat  $3/MD/gdt-total_Ttraj.537.54.dat $3/MD/gdt-total_Ttraj.336.61.dat  $3/MD/gdt-total_Ttraj.438.50.dat
###

####abaixo sao os gdts para MD, not REMD
compute_gdt_2.py gdt3.dat $4/MD/gdt-total${10}.001.dat  $4/MD/gdt-total${10}.006.dat  $4/MD/gdt-total${10}.011.dat $4/MD/gdt-total${10}.002.dat  $4/MD/gdt-total${10}.007.dat  $4/MD/gdt-total${10}.012.dat $4/MD/gdt-total${10}.003.dat  $4/MD/gdt-total${10}.008.dat  $4/MD/gdt-total${10}.013.dat $4/MD/gdt-total${10}.004.dat  $4/MD/gdt-total${10}.009.dat  $4/MD/gdt-total${10}.014.dat $4/MD/gdt-total${10}.005.dat  $4/MD/gdt-total${10}.010.dat


#echo ${10}
compute_gdt_2.py gdt4.dat $5/MD/gdt-total${11}.001.dat $5/MD/gdt-total${11}.006.dat  $5/MD/gdt-total${11}.011.dat $5/MD/gdt-total${11}.002.dat  $5/MD/gdt-total${11}.007.dat  $5/MD/gdt-total${11}.012.dat $5/MD/gdt-total${11}.003.dat  $5/MD/gdt-total${11}.008.dat  $5/MD/gdt-total${11}.013.dat $5/MD/gdt-total${11}.004.dat  $5/MD/gdt-total${11}.009.dat  $5/MD/gdt-total${11}.014.dat $5/MD/gdt-total${11}.005.dat  $5/MD/gdt-total${11}.010.dat

paste gdt.dat gdt2.dat gdt3.dat gdt4.dat > gdt_data.dat
gdt_min.sh
###
###
mkdir plots_$1
mv gdt.dat gdt2.dat gdt3.dat gdt4.dat gdt_data.dat rmsd.dat rmsd2.dat rmsd3.dat rmsd4.dat rmsd_data.dat rmsd_min.pdf gdt_min.pdf gdt_max.pdf  plots_$1/ 
###
###
cd '..'
###
#boxplot_rmsd.sh 1 $1 $2 $3 $4 $5 $6 $7 $8 $9
#boxplot_gdt.sh 1 $1 $2 $3 $4 $5 ${10}. ${11}

#PLOTS 1 (olhar no doutorado.ods) para saber quais sao as simulacoes avaliadas!

# um para cada RUN 1 2 3
#create_plots_relative_metrics.x 1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns//OK/02-REMD/1UNC_1ns_2_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN1 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN1 _ _ _ . _Ttraj _Ttraj

#create_plots_relative_metrics.x 2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns//OK/02-REMD/1UNC_1ns_2_RUN2 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN2 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN2 _ _ . . "" _Ttraj

#antigos#create_plots_relative_metrics.x 2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns//OK/02-REMD/antigos/1UNC_1ns_2_RUN2 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN2 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN2 _ _ . . "" _Ttraj

#por enquanto nao tenho os dados para computar CMD e MD
#create_plots_relative_metrics.x 3 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN3 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN3 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN3 /media/lipinski/EXT4/SIMULACOES/2016/1UNC/1ns/1UNC_1ns_4_RUN3_new_D _ _ . . "" ""

#antigos#create_plots_relative_metrics.x 3 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN3 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns//OK/02-REMD/antigos/1UNC_1ns_2_RUN3 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN3 /media/lipinski/EXT4/SIMULACOES/2016/1UNC/1ns/1UNC_1ns_4_RUN3_new_D1UNC_1ns_4_RUN3_new_D _ _ . . "" ""


# a principio PLOTS 1 está OK, falta AVG

### PLOTS 2  
#create_plots_relative_metrics.x 1 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns//OK/02-REMD/1UNC_1ns_2_RUN1 /media/lipinski/LABIO-01/THIAGO/1UNC/2ns/1UNC_2ns_3_RUN1 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN1  _ _ . . "" _Ttraj

#create_plots_relative_metrics.x 2 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN2 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns//OK/02-REMD/antigos/1UNC_1ns_2_RUN2 /media/lipinski/LABIO-01/THIAGO/1UNC/2ns/1UNC_2ns_3_RUN2 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN2  _ _ . . "" _Ttraj

#create_plots_relative_metrics.x 3 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN3 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN3 /media/lipinski/LABIO-01/THIAGO/1UNC/2ns/1UNC_2ns_3_RUN3 /media/lipinski/EXT4/SIMULACOES/2016/1UNC/1ns/1UNC_1ns_4_RUN3_new_D . _ . . "" ""

#esse aqui tive errori, entao o novo comando, arrumando pastas é:
#create_plots_relative_metrics.x 3  /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN3 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/antigos/1UNC_1ns_2_RUN3 LAD/2nsRUN3  /media/lipinski/EXT4/SIMULACOES/2016/1UNC/1ns/1UNC_1ns_4_RUN3_new_D  . _ . . "" ""

#por enquanto temos o 1_4_3 que nao tenho as analises ainda!


#NEWPLOTS 3
#new
#okB /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN4/MD
#okB /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN5/MD
#okB /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CTREMD/1UNC_1ns_1_RUN6/MD
#
#okF /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN4/MD
#OKF /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN5/MD
#okF /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN6/MD
#
#okG /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN1/MD
#okG /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN2/MD
#okG /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN3/MD
#
#okI /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN1/MD
#okI /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN2/MD
#okI /media/lipinski/EXT4/SIMULACOES/2016/1UNC/1ns/1UNC_1ns_4_RUN3_new_D/MD

#create_plots_relative_metrics.x 1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN4 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN4  /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN1 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN1  _ . _ . _Ttraj _Ttraj

#create_plots_relative_metrics.x 2  /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN5/ /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN5 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN2 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN2  _ . . . "" _Ttraj

#create_plots_relative_metrics.x 3 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CTREMD/1UNC_1ns_1_RUN6 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN6 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN3 /media/lipinski/EXT4/SIMULACOES/2016/1UNC/1ns/1UNC_1ns_4_RUN3_new_D _ . . . "" ""



### PLOTS 3  OLD
#create_plots_relative_metrics.x 1 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN4 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN4 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN1 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN1  _ . _ . _Ttraj _Ttraj

#create_plots_relative_metrics.x 2  /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CT-REMD/1UNC_1ns_1_RUN5 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN5/ /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN2 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN2  _ . . . "" _Ttraj

#create_plots_relative_metrics.x 3 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/01-CTREMD/1UNC_1ns_1_RUN6 /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN6_ERRORI/ /media/lipinski/FAAAT/PLANNED_SIMULATIONS/1UNC/1ns/OK/03-CMD/1UNC_1ns_3_RUN3 /media/lipinski/EXT4/SIMULACOES/2016/1UNC/1ns/1UNC_1ns_4_RUN3_new_D _ . . . "" ""


#### PLOTS 4 new
#Dok /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN4/MD
#Dok /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN5/MD
#Dok /media/lipinski/EXT4/SIMULACOES/2016/1UNC/2ns/1UNC_2ns_1_R6_new/MD
#
#Fok /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN4/MD
#Fok /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN5/MD
#Fok /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN6/MD
#
#H/media/lipinski/LABIO-01/THIAGO/1UNC/2ns/1UNC_2ns_3_RUN1/
#H/media/lipinski/LABIO-01/THIAGO/1UNC/2ns/1UNC_2ns_3_RUN2/
#H/media/lipinski/LABIO-01/THIAGO/1UNC/2ns/1UNC_2ns_3_RUN3/

#
#Iok /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN1/MD
#Iok /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN2/MD
#Iok /media/lipinski/EXT4/SIMULACOES/2016/1UNC/1ns/1UNC_1ns_4_RUN3_new_D/MD

#PLOTS4 new
#create_plots_relative_metrics.x 1 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN4 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN4 /media/lipinski/LABIO-01/THIAGO/1UNC/2ns/1UNC_2ns_3_RUN1 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN1 _ . . . "" _Ttraj

#create_plots_relative_metrics.x 2 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN5 /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN5 /media/lipinski/LABIO-01/THIAGO/1UNC/2ns/1UNC_2ns_3_RUN2/ /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/04-MD/1UNC_1ns_4_RUN2 _ . . . "" _Ttraj

# create_plots_relative_metrics.x 3 /media/lipinski/EXT4/SIMULACOES/2016/1UNC/2ns/1UNC_2ns_1_R6_new /media/lipinski/bbd7c4d4-68cf-4c17-a487-ee8d7c3a4657/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/1ns/OK/02-REMD/1UNC_1ns_2_RUN6 /media/lipinski/LABIO-01/THIAGO/1UNC/2ns/1UNC_2ns_3_RUN3/ /media/lipinski/EXT4/SIMULACOES/2016/1UNC/1ns/1UNC_1ns_4_RUN3_new_D . . _ . "" ""


#H2/home/tpaes/PLANNED/PLANNED_SIMULATIONS/1UNC/2ns/01-CTREMD/1UNC_2ns_1_RUN6/MD o velho,  
#o novo → /media/lipinski/EXT4/SIMULACOES/2016/1UNC/2ns/1UNC_2ns_1_R6_new




