#!/bin/bash

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
#gnuplot=/usr/local/Cellar/gnuplot/5.0.1/bin/gnuplot

# Check for gnuplot, and warn if not available.
if [ ! -e $gnuplot ]; then
  echo "Can't find gnuplot at $gnuplot."
  echo "Gnuplot version 4.6.3 or later required."
  exit 3
fi

symbol='$'

 cd $1
 
paste  plots_1/rmsd.dat plots_2/rmsd.dat plots_3/rmsd.dat   > rmsd_1_123.dat #
 awk '{s=$2+$5+$8}{print $1 s/3}' rmsd_1_123.dat > rmsd_1_avg.dat 

paste  plots_1/rmsd2.dat plots_2/rmsd2.dat plots_3/rmsd2.dat  > rmsd_2_123.dat #
 awk '{s=$2+$5+$8}{print $1 s/3}' rmsd_2_123.dat > rmsd_2_avg.dat 


paste  plots_1/rmsd3.dat plots_2/rmsd3.dat plots_3/rmsd3.dat  > rmsd_3_123.dat
 awk '{s=$2+$5+$8}{print $1 s/3}' rmsd_3_123.dat > rmsd_3_avg.dat 
 
 
paste  plots_1/rmsd4.dat plots_2/rmsd4.dat plots_3/rmsd4.dat  > rmsd_4_123.dat #
 awk '{s=$2+$5+$8}{print $1 s/3}' rmsd_4_123.dat > rmsd_4_avg.dat 

#     create_plot2.x 1 1 2 3 4
#     create_plot2.x 2 1 2 3 4
#     create_plot2.x 3 1 2 3 4
####NAO PRECISO DISSO AGORA####create_plot2.x 4 1 2 3 4

     # cd plots
      paste  plots_1/rmsd.dat plots_2/rmsd.dat plots_3/rmsd.dat  > rmsd_1_123.dat #   plots_4/rmsd.dat  > rmsd_1_123.dat #
      paste  plots_1/rmsd2.dat plots_2/rmsd2.dat plots_3/rmsd2.dat > rmsd_2_123.dat #  plots_4/rmsd2.dat  > rmsd_2_123.dat #
      paste  plots_1/rmsd3.dat plots_2/rmsd3.dat plots_3/rmsd3.dat > rmsd_3_123.dat #   plots_4/rmsd3.dat > rmsd_3_123.dat #
      paste  plots_1/rmsd4.dat plots_2/rmsd4.dat plots_3/rmsd4.dat > rmsd_4_123.dat #   plots_4/rmsd4.dat > rmsd_4_123.dat #
      #NAO TENHO PLOTS_4, pois soh estou comparando 3runs
      awk '{s=$2+$5+$8}{print $1 "        " s/3}' rmsd_1_123.dat > rmsd_1_avg.dat 
      awk '{s=$2+$5+$8}{print $1 "        " s/3}' rmsd_2_123.dat > rmsd_2_avg.dat 
      awk '{s=$2+$5+$8}{print $1 "        " s/3}' rmsd_3_123.dat > rmsd_3_avg.dat 
      awk '{s=$2+$5+$8}{print $1 "        " s/3}' rmsd_4_123.dat > rmsd_4_avg.dat 


 sort -k1 rmsd_1_avg.dat  > _rmsd_1_avg.dat 
 mv _rmsd_1_avg.dat  rmsd_1_avg.dat 

 sort -k1 rmsd_2_avg.dat  > _rmsd_2_avg.dat 
 mv _rmsd_2_avg.dat  rmsd_2_avg.dat 


 sort -k1 rmsd_3_avg.dat  > _rmsd_3_avg.dat 
      mv _rmsd_3_avg.dat     rmsd_3_avg.dat 


 sort -k1 rmsd_4_avg.dat  > _rmsd_4_avg.dat 
     mv _rmsd_4_avg.dat     rmsd_4_avg.dat 



echo | $gnuplot <<EOF


 
   
set term ${term}


#SOBRE O GRID
# Line style for axes
set style line 90 lt 1 lc 3
set style line 90 lt rgb "#808080"
# Line style for grid
set style line 81 lt 0  # dashed
set style line 81 lt rgb "#808080"  # grey

set grid back linestyle 81

set border 3 linestyle 90 
	     # Remove border on top and right.  These
             # borders are useless and make it harder
             # to see plotted lines near the border.
 	     # Also, put it in grey; no need for so much emphasis on a border.
 	     
 	     
 	     

# set terminal png transparent nocrop enhanced size 450,320 font "arial,8" 
set output "./rmsd_AVG_min.${1}.${output_extension}"


set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)

set xrange [ -1 : 29 ] noreverse nowriteback
set yrange [ 0 :] noreverse nowriteback
set xtics font ", 6"
set ytics font ", 8"

set border 2 front linewidth 1.000
set xtics  norangelimit nomirror


set ytics border in scale 1,0.5 nomirror norotate  autojustify

set style fill solid 0.45 border
#set boxwidth 0.2 absolute


# Put X and Y labels
set xlabel "Temperature (K)"
set ylabel "RMSD (A) "

#legenda
set key horizontal center bottom inside maxrows 1

# Give the plot a title
set title "RMSD v.s Temperature "

set style line 1 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "blue"
set style line 2 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "red"
set style line 3 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "#FF69B4"
set style line 4 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "#00FF00"


plot 'rmsd_1_avg.dat'  using (\$1):2 with linespoints ls 1  title "$2"  ,\
	 'rmsd_2_avg.dat' using (\$1):2 with linespoints ls 2 title "$3",\
	 'rmsd_3_avg.dat' using (\$1):2 with linespoints ls 3 title "$4",\
	 'rmsd_4_avg.dat' using (\$1):2 with linespoints ls 4  title "$5"
 


EOF

# plot "../1UNC_1ns_1_RUN1/MD/gdt-total_Ttraj.269.50.dat" using (1-0.45):2 ls 1 with boxplot title "CTREMD" ,\
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

