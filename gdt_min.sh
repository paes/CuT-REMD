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

#paste ../1UNC_1ns_1_RUN1/MD/gdt-total_Ttraj_3-33_CA.269.50.dat ../1UNC_1ns_1_RUN1/MD/gdt-total_Ttraj_3-33_CA.285.22.dat ../1UNC_1ns_1_RUN1/MD/gdt-total_Ttraj_3-33_CA.301.66.dat > pasted.dat

 sort -k1 gdt.dat > _gdt.dat
 mv _gdt.dat gdt.dat
 sort -k1 gdt2.dat > _gdt2.dat
 mv _gdt2.dat gdt2.dat
 sort -k1 gdt3.dat > _gdt3.dat
  mv _gdt3.dat gdt3.dat
 sort -k1 gdt4.dat > _gdt4.dat
  mv _gdt4.dat gdt4.dat

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
set output "./gdt_min.${output_extension}"


set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)

set xrange [ -1 : 29 ] noreverse nowriteback
set yrange [ 0 : 1 ] noreverse nowriteback
set xtics font ", 6"
set ytics font ", 8"

set border 2 front linewidth 1.000
set xtics  norangelimit nomirror


set ytics border in scale 1,0.5 nomirror norotate  autojustify

set style fill solid 0.45 border
#set boxwidth 0.2 absolute


# Put X and Y labels
set xlabel "Temperature (K)"
set ylabel "GDT/TS "

#legenda
set key horizontal center bottom inside maxrows 1

# Give the plot a title
set title "GDT/TS v.s Temperature "

set style line 1 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "blue"
set style line 2 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "red"
set style line 3 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "#FF69B4"
set style line 4 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "#00FF00"


plot 'gdt.dat'  using (\$1):3 with linespoints ls 1  title "CTREMD" ,\
	 'gdt2.dat' using (\$1):3 with linespoints ls 2 title "REMD",\
	 'gdt3.dat' using (\$1):3 with linespoints ls 3 title "CMD",\
	 'gdt4.dat' using (\$1):3 with linespoints ls 4  title "MD"

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

