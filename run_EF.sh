cat remd_001*.log > rem_total.log
python EF.py > En_fun_001.txt

cat remd_001*.log remd_002.log  > rem_total.log
python EF.py > En_fun_002.txt

cat remd_001*.log remd_002.log remd_003.log  > rem_total.log
python EF.py > En_fun_003.txt

cat remd_001*.log remd_002.log remd_003.log remd_004.log  > rem_total.log
python EF.py > En_fun_004.txt

cat remd_001*.log remd_002.log remd_003.log remd_004.log remd_005.log  > rem_total.log
python EF.py > En_fun_005.txt

cat remd_001*.log remd_002.log remd_003.log remd_004.log remd_005.log remd_006.log > rem_total.log
python EF.py > En_fun_006.txt

cat En_fun_001.txt En_fun_002.txt En_fun_003.txt En_fun_004.txt En_fun_005.txt En_fun_006.txt > En_fun_total.txt

