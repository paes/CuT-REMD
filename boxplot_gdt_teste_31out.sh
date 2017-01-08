#!/bin/bash

#### USAGE: boxplot_gdt (ns) (SEED)
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


echo | $gnuplot <<EOF

set term ${term}

#set size 2,2

# Line style for grid
# Define a new linestyle (81)
# linetype = 0 (dashed line)
# linecolor = gray
# lw = lineweight, make it half as wide as the axes lines
set style line 81 lt 0 lc rgb "#000000" lw 0.5

# Draw the grid lines for both the major and minor tics
set grid xtics
set grid ytics
set grid mxtics
set grid mytics
# Put the grid behind anything drawn and use the linestyle 81
set grid back ls 81




set output "./teste_${23}_plot.${output_extension}"


#set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)
#set xtics ('269.50' 1, '285.22' 3.5, '301.66' 6, '318.76' 8.5, '336.61' 11, '355.26' 13.5, '374.74' 16, '395.07' 18.5, '416.32' 21, '438.50' 23.5, '461.67' 26, '485.87' 28.5, '511.14' 31, '537.54' 33.5)


###### macros
#####
#####
###### Put X and Y labels
set xlabel "Protein"
set ylabel "GDT/100 
#####
#####
#####set xrange [ -2.5 : 36 ] noreverse nowriteback
set yrange [ 0.0 : 1.0] noreverse nowriteback
set xtics font ", 6"
set ytics font ", 6"
#####
#####set border 2 front linewidth 1.000
#####set boxwidth 0.5 absolute
set xtics  norangelimit nomirror rotate by -45  autojustify 
set ytics border in scale 1,0.5 nomirror norotate  autojustify
#####
set style fill solid 0.45 border
#####
#####

#####
set key autotitle column nobox samplen 1 noenhanced
set key samplen 2 spacing .5 font ",8"
#####
###### Give the plot a title
######set title "Quartile GDT v.s Temperature "
#####
#####
#####
#####set style line 1 lt 1 ps 0.015 lc rgb "blue"
#####set style line 2 lt 1 ps 0.015 lc rgb "red" 
#####set style line 3 lt 1 ps 0.015 lc rgb "#FF69B4"
#####set style line 4 lt 1 ps 0.015 lc rgb "#00FF00"
#####
#####
#####
#####set xtics ('269.50' 1, '285.22' 3.5, '301.66' 6, '318.76' 8.5, '336.61' 11, '355.26' 13.5, '374.74' 16, '395.07' 18.5, '416.32' 21, '438.50' 23.5, '461.67' 26, '485.87' 28.5, '511.14' 31, '537.54' 33.5)
#####
set ylabel 'GDT/100' 
set ylabel font ",8"
set xlabel font ",8"
#####
set format y '%0.1f'
set ytics (0, 0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0)
#####unset xlabel
#####set xtics ('' 1, '' 3.5, '' 6, '' 8.5, '' 11, '' 13.5, '' 16, '' 18.5, '' 21, '' 23.5, '' 26, '' 28.5, '' 31, '' 33.5) 








set bar 1.00000 front
set boxwidth 0.9 absolute
set style fill   solid 1.00 #border lt 1
set style circle radius graph 0.02, first 0.00000, 0.00000 
#set style ellipse size graph 0.05, 0.03, first 0.00000 angle 0 units xy
set key inside right top vertical Right noreverse noenhanced autotitle nobox
set style histogram clustered gap 4 title #textcolor 1
#set style textbox transparent margins  1.0,  1.0 border
unset logscale
set datafile missing '-'
set style data histograms
#set xtics border in scale 0,0 nomirror rotate by -45  autojustify
set xtics  norangelimit 
set xtics   ()
set title "${23}" 
#set yrange [ 0.00000 : 300000. ] noreverse nowriteback

#set colorbox vertical origin screen 0.9, 0.2, 0 size screen 0.05, 0.6, 0 front  noinvert bdefault
x = 0.0
i = 23



set style fill solid 1.00 noborder

######legenda
set key horizontal center bottom outside maxrows 1

## Last datafile plotted: "complete.dat"
plot 'complete.dat' using 3:xtic(1) ti col  fs solid lc rgb "blue" , '' u 5 ti col fs solid lc rgb "red",



















#plot "1UAO_F_1.Bests.dat" using (3.5):2 ls 1 ps 1 title "CT-REMD"
#     "1UAO_F_1.Bests.dat" using (3.5):2 ls 1 ps 1 #title "F-REMD" , \
#	 "1UAO_D_1.Bests.dat" using (3.5):2 ls 1 ps 1 #title "D-REMD"
#	 "$1_F_1.Bests.dat" using (3.5):2  ls 1 ps 0.015 otitle 


EOF

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

