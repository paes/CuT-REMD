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
set output "./dssp.${output_extension}"


set xtics ("A" 1, "B" 3, "C" 5, "D" 7, "E" 9, "F" 11, "G" 13, "H" 15, "I" 17)

set xrange [ -1 : 19 ] noreverse nowriteback
set yrange [ 0 :] noreverse nowriteback
set xtics font ", 6"
set ytics font ", 8"

set border 2 front linewidth 1.000
set xtics  norangelimit nomirror


set ytics border in scale 1,0.5 nomirror norotate  autojustify

set style fill solid 0.45 border
#set boxwidth 0.2 absolute


# Put X and Y labels
set xlabel "Method ID"
set ylabel "Secondary Structure Assignement"


#legenda
#set key horizontal center bottom  maxrows 1
#set key maxrows 2
unset key

# Give the plot a title
set title "Secondary Structure Assignement against regular MD"

set style line 1 lt 1 lw 3 pt 3  ps 1.225 linecolor rgb "blue"
set style line 2 lt 1 lw 3 pt 3  ps 1.225 linecolor rgb "red"
set style line 3 lt 1 lw 3 pt 3  ps 1.225 linecolor rgb "#FF69B4"
set style line 4 lt 1 lw 3 pt 3  ps 1.225 linecolor rgb "#00FF00"

set boxwidth 0.2
plot 'dssp_dataA.dat'  using (1):2 with boxes ls 1 ,\
 'dssp_dataB.dat'  using (3):2 with boxes ls 	 1 ,\
 'dssp_dataC.dat'  using (5):2 with boxes ls 	 1 ,\
 'dssp_dataD.dat'  using (7):2 with boxes ls 	 1 , \
 'dssp_dataE.dat'  using (9):2 with boxes ls 	 2 , \
 'dssp_dataF.dat'  using (11):2 with boxes ls 	 2 , \
 'dssp_dataG.dat'  using (13):2 with boxes ls 	 1 , \
 'dssp_dataH.dat'  using (15):2 with boxes ls 	 1 , \
 'dssp_dataI.dat'  using (17):2 with boxes ls 	 2 
 
 
 



 


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

