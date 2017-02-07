#!/bin/bash

#.RUN.x Job_ID Trajectory.pdb 

# Get Variables
cd ..
TEMPLIST=`cat temperatures.dat`
NOME=`ls *_P.pdb`
MODELS_COUNT=50000

# Generate REMD's
chmod 777 analyze_all_temps.x
./analyze_all_temps.x job_id $NOME

chmod 777 generate_pdb_total.x
./generate_pdb_total.x job_id $NOME


# RMSD
if [ -f rmsd-from-Ttraj.x ];
then
	chmod 777 rmsd-from-Ttraj.x
	./rmsd-from-Ttraj.x job_id $NOME 1 28 &
else
	echo "RMSD Script File not found! Skipping..."
fi


# GDT
if [ -f rmsd-from-Ttraj.x ];
then
	chmod 777 gdt-from-Ttraj.x
	./gdt-from-Ttraj.x &
else
	echo "GDT Script File not found! Skipping..."
fi


# Quality
cd Quality
for temp in $TEMPLIST ; 
do

	echo '#!/bin/bash																    '   > run_$temp.sh
	echo '                                                                              '   >> run_$temp.sh
    echo 'MODELS_COUNT='$MODELS_COUNT'                                                  '   >> run_$temp.sh
    echo 'TEMPLIST=`cat ../temperatures.dat`											'   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '# Extract All Models (Slow Part)                                              '   >> run_$temp.sh
	echo 'model=1                                                                       '   >> run_$temp.sh
	echo 'while [  $model -le $MODELS_COUNT ];                                          '   >> run_$temp.sh
	echo 'do                                                                            '   >> run_$temp.sh
	echo '	# Get Models                                                                '   >> run_$temp.sh
	echo '	python get_from_tra.py ../remd_total_Ttraj.'$temp'.pdb $model               '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '	# Increase Counter                                                          '   >> run_$temp.sh
	echo '	let model=model+1                                                           '   >> run_$temp.sh
	echo 'done                                                                          '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '# --- Start Analysis ---                                                      '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '# GOAP & OPUS (Full Trajectory Analysis)                                      '   >> run_$temp.sh
	echo 'cd GOAP_OPUS_PSP                                                              '   >> run_$temp.sh
	echo 'python GOAP-OPUS_PSP_calc.py ../../remd_total_Ttraj.$temp.pdb $MODELS_COUNT & '   >> run_$temp.sh
	echo 'cd ..                                                                         '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '# Single Model Analysis                                                       '   >> run_$temp.sh
	echo 'let model=1                                                                   '   >> run_$temp.sh
	echo 'while [  $model -le $MODELS_COUNT ];                                          '   >> run_$temp.sh
	echo 'do                                                                            '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '	# RW_PLUS                                                                   '   >> run_$temp.sh
	echo '	cd RW_Plus                                                                  '   >> run_$temp.sh
	echo '	python rwplus.py ../../remd_total_Ttraj.$temp.pdb $model &                  '   >> run_$temp.sh
	echo '	cd ..                                                                       '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '	# DFIRE & dDFIRE                                                            '   >> run_$temp.sh
	echo '	cd dDFIRE                                                                   '   >> run_$temp.sh
	echo '	python dDFIRE.py ../../remd_total_Ttraj.$temp.pdb $model &                  '   >> run_$temp.sh
	echo '	cd ..                                                                       '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '	# DOPE                                                                      '   >> run_$temp.sh
	echo '	cd DOPE                                                                     '   >> run_$temp.sh
	echo '	python dopecalc.py ../../remd_total_Ttraj.$temp.pdb $model &                '   >> run_$temp.sh
	echo '	cd ..                                                                       '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '	# GFactor                                                                   '   >> run_$temp.sh
	echo '	cd GFactor                                                                  '   >> run_$temp.sh
	echo '	python Gfactors.py ../../remd_total_Ttraj.$temp.pdb $model &                '   >> run_$temp.sh
	echo '	cd ..                                                                       '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '	# Probscore                                                                 '   >> run_$temp.sh
	echo '	cd Probscore                                                                '   >> run_$temp.sh
	echo '	python molprob.py ../../remd_total_Ttraj.$temp.pdb $model                   '   >> run_$temp.sh
	echo '	cd ..                                                                       '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '	#Remove Model                                                               '   >> run_$temp.sh
	echo '	rm remd_total_Ttraj.$temp"_M"$model.dat                                     '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '	# Increase Counter                                                          '   >> run_$temp.sh
	echo '	let model=model+1                                                           '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo 'done                                                                          '   >> run_$temp.sh
    echo '                                                                              '   >> run_$temp.sh
	echo '#Remove Index                                                                 '   >> run_$temp.sh
	echo 'rm remd_total_Ttraj.$temp.index                                               '   >> run_$temp.sh
                                                                                       
done                                                                                    
       
count=1
nrep=`wc ../temperatures.dat | awk '{print $2}'`
for temp in $TEMPLIST ; 
do
	chmod 777 run_$temp.sh
	
	if [count -eq nrep]
	then
		./run_$temp.sh
	else
		./run_$temp.sh	&
	fi
	
    let count=count+1                                                                                
done 
                                                                                      
#Finaly...                                                                              
echo "Done!"                                                                            
                                                                                        
                                                                                        
                                                                                        
                                                                                        
