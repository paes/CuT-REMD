cpptraj.OMP job_id.prmtop << EOF
trajin remd_00[123456].Ttraj.[23][6801]*
cluster hieragglo epsilon 2 mask :3-8,14-19,22-31@CA out CLU_out singlerepout cluster singlerepfmt pdb info infofile summaryhalf halfile splitframe 1000,2000,3000,4000,5000,10000,20000,30000,40000 cpopvtime clus_vs_time normframe sieve 10
EOF

