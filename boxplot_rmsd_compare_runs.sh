#!/bin/bash

#### USAGE: boxplot_gdt (ns) (TYPE) (NOMEPASTA) (RUN_NUMBER) (RUN_NUMBER) (RUN_NUMBER) (IDENTIFICADOR_NOME)
#output="ps"
#output="png"
output="pdf"

if [ "$output" == "ps" ]
then
	term="postscript enhanced color dashed font \"Times-Roman, 13\""	
	#term="postscript enhanced color dashed font \"Times-Roman, 14\""	
	#term="postscript enhanced color dashed "
	#term="postscript enhanced color dashed font \"Times-Roman, 24\""
	output_extension="ps"
elif [ "$output" == "pdf" ]
then
	term="pdf enhanced color dashed font \"Times-Roman, 13\""	
	output_extension="pdf"
else
	term="pngcairo color dashed font \"Times-Roman,13\""
	#term="pngcairo color dashed font \"Times-Roman,14\""
	#term="pngcairo color dashed font \"FreeSans,9\""
	output_extension="png"
fi

gnuplot=/usr/bin/gnuplot

# Check for gnuplot, and warn if not available.
if [ ! -e $gnuplot ]; then
  echo "Can't find gnuplot at $gnuplot."
  echo "Gnuplot version 4.6.3 or later required."
  exit 3
fi

symbol='$'

mkdir plots_compare_runs_$1ns
cd plots_compare_runs_$1ns

echo | $gnuplot <<EOF

set term ${term}

#set size 2,2

# Line style for grid
# Define a new linestyle (81)
# linetype = 0 (dashed line)
# linecolor = gray
# lw = lineweight, make it half as wide as the axes lines
set style line 81 lt 0 lc rgb "#808080" lw 0.5



#mytics
set mytics 2.5

# Draw the grid lines for both the major and minor tics
set grid xtics
set grid ytics
set grid mxtics
set grid mytics 
# Put the grid behind anything drawn and use the linestyle 81
set grid back ls 81


set output "./quartile_rmsd.$7.RUN$4$5$6.${output_extension}"
set boxwidth 1.0 #absolute



set encoding iso_8859_1
# Put X and Y labels
#set xlabel "Temperature (K)"
set ylabel "RMSD ({\305})" 


set xrange [ -2.5 : 36 ] noreverse nowriteback
set yrange [ -0 : 25.0] noreverse nowriteback
set xtics font ", 6"
set ytics font ", 6"
set border 2 front linewidth 1.000 # 2 soh a esq;

set boxwidth 0.3 absolute  # TAMANHO DA CAIXA []
set xtics  norangelimit nomirror rotate by -45  autojustify 

#set xtics border in scale 1,0.5 nomirror norotate  autojustify

set xtics 1
set ytics border in scale 1,0.5 nomirror norotate  autojustify

set style fill solid 0.45 border
set bars 0.5 # largura da linha horizontal no Interquartile Range. 


#legenda
#set key horizontal center bottom inside maxrows 1

set key autotitle column nobox samplen 1 noenhanced
set key samplen 2 spacing .5 font ",8"

# Give the plot a title
set title "Quartile RMSD v.s Temperature for $7"



set style line 1 lt 1 ps 0.015 lc rgb "blue"
set style line 2 lt 1 ps 0.015 lc rgb "red" 
set style line 3 lt 1 ps 0.015 lc rgb "#FF69B4"
set style line 4 lt 1 ps 0.015 lc rgb "#00FF00"


set style data boxplot
#set multiplot layout 2,1 rowsfirst title "Quartile RMSD v.s Temperature"

set ylabel font ",8"
set xlabel font ",8"

set format y '%0.1f'
set mytics 2.5

#unset xlabel
set xtics ('' 1, '' 3.5, '' 6, '' 8.5, '' 11, '' 13.5, '' 16, '' 18.5, '' 21, '' 23.5, '' 26, '' 28.5, '' 31, '' 33.5) 
set ytics (0,2.5,5,7.5,10,12.5,15,17.5,20,22.5,25)



set xtics ('269.50' 1, '285.22' 3.5, '301.66' 6, '318.76' 8.5, '336.61' 11, '355.26' 13.5, '374.74' 16, '395.07' 18.5, '416.32' 21, '438.50' 23.5, '461.67' 26, '485.87' 28.5, '511.14' 31, '537.54' 33.5)
set xlabel "Temperature (K)"
set ylabel "RMSD (A)" 
 #01-CT-REMD

set xtics scale 0

plot "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.269.50.dat" using (-0.45 + 1):2    ls 1 ps 0.015 with boxplot title "RUN $4" ,\
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.285.22.dat" using (-0.45 + 3.5):2  ls 1 ps 0.015 with boxplot notitle, \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.301.66.dat" using (-0.45 + 6):2    ls 1 ps 0.015 with boxplot notitle, \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.318.76.dat" using (-0.45 + 8.5):2  ls 1 ps 0.015 with boxplot notitle , \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.336.61.dat" using (-0.45 + 11):2   ls 1 ps 0.015 with boxplot notitle, \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.355.26.dat" using (-0.45 + 13.5):2 ls 1 ps 0.015 with boxplot notitle, \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.374.74.dat" using (-0.45 + 16):2   ls 1 ps 0.015 with boxplot notitle , \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.395.07.dat" using (-0.45 + 18.5):2 ls 1 ps 0.015 with boxplot notitle, \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.416.32.dat" using (-0.45 + 21):2   ls 1 ps 0.015 with boxplot notitle, \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.438.50.dat" using (-0.45 + 23.5):2 ls 1 ps 0.015 with boxplot notitle , \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.461.67.dat" using (-0.45 + 26):2   ls 1 ps 0.015 with boxplot notitle, \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.485.87.dat" using (-0.45 + 28.5):2 ls 1 ps 0.015 with boxplot notitle, \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.511.14.dat" using (-0.45 + 31):2   ls 1 ps 0.015 with boxplot notitle , \
	 "../$3/1UNC_$1ns_$2_RUN$4/MD/rmsd-total_Ttraj_3-33_CA.537.54.dat" using (-0.45 + 33.5):2 ls 1 ps 0.015 with boxplot notitle , \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.269.50.dat" using (1):2    ls 2 ps 0.015 with boxplot title "RUN $5" ,\
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.285.22.dat" using (3.5):2  ls 2 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.301.66.dat" using (6):2    ls 2 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.318.76.dat" using (8.5):2  ls 2 ps 0.015 with boxplot notitle , \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.336.61.dat" using (11):2   ls 2 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.355.26.dat" using (13.5):2 ls 2 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.374.74.dat" using (16):2   ls 2 ps 0.015 with boxplot notitle , \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.395.07.dat" using (18.5):2 ls 2 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.416.32.dat" using (21):2   ls 2 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.438.50.dat" using (23.5):2 ls 2 ps 0.015 with boxplot notitle , \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.461.67.dat" using (26):2   ls 2 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.485.87.dat" using (28.5):2 ls 2 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.511.14.dat" using (31):2   ls 2 ps 0.015 with boxplot notitle , \
     "../$3/1UNC_$1ns_$2_RUN$5/MD/rmsd-total_Ttraj_3-33_CA.537.54.dat" using (33.5):2 ls 2 ps 0.015 with boxplot notitle , \
	 "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.269.50.dat" using (0.45 + 1):2    ls 3 ps 0.015 with boxplot title "RUN $6" ,\
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.285.22.dat" using (0.45 + 3.5):2  ls 3 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.301.66.dat" using (0.45 + 6):2    ls 3 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.318.76.dat" using (0.45 + 8.5):2  ls 3 ps 0.015 with boxplot notitle , \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.336.61.dat" using (0.45 + 11):2   ls 3 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.355.26.dat" using (0.45 + 13.5):2 ls 3 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.374.74.dat" using (0.45 + 16):2   ls 3 ps 0.015 with boxplot notitle , \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.395.07.dat" using (0.45 + 18.5):2 ls 3 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.416.32.dat" using (0.45 + 21):2   ls 3 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.438.50.dat" using (0.45 + 23.5):2 ls 3 ps 0.015 with boxplot notitle , \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.461.67.dat" using (0.45 + 26):2   ls 3 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.485.87.dat" using (0.45 + 28.5):2 ls 3 ps 0.015 with boxplot notitle, \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.511.14.dat" using (0.45 + 31):2   ls 3 ps 0.015 with boxplot notitle , \
     "../$3/1UNC_$1ns_$2_RUN$6/MD/rmsd-total_Ttraj_3-33_CA.537.54.dat" using (0.45 + 33.5):2 ls 3 ps 0.015 with boxplot notitle

EOF

mkdir plots_$7
mv quartile_rmsd.$7.RUN$4$5$6.pdf plots_$7/ 





cd '..'
#   "269.50" 1 , 
#   "285.22" 3 , 
#   "301.66" 5 , 
#   "318.76" 7 , 
#   "336.61" 9 , 
#   "355.26" 11 , 
#   "374.74" 13 , 
#   "395.07" 15 , 
#   "416.32" 17 , 
#   "438.50" 19 , 
#   "461.67" 21 , 
#   "485.87" 23 , 
#   "511.14" 25 , 
#   "537.54" 27 )

