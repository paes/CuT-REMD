mkdir backup-no-clust
mv *.backup backup-no-clust/
cpptraj.OMP job_id.prmtop << EOF
#trajin remd_00[123456].Ttraj.[23][6801]*
trajin remd_00[123456].ncdf.00[1234]
cluster hieragglo epsilon 2 mask :3-8,14-19,22-31@CA out CLU_out singlerepout cluster singlerepfmt pdb info infofile summaryhalf sieve 10
EOF

