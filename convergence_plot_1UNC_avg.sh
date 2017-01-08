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

TEMPLIST=`cat ../templist.dat`


for ext in $TEMPLIST ; do
	compute_convergence_1.py avg_$ext.dat 0.01
done

cat avg_*_first.dat > avg_alltemps_first.dat



num_lines=`wc -l  avg_269.50.dat | awk '{print $1}'`

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
set output "./convergence_plot_$1_avg.${output_extension}"


#set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)

#set xrange [ -1 : 29 ] noreverse nowriteback
set yrange [ 0 : 0.6 ] noreverse nowriteback
set xtics font ", 6"
#set mytics 0.05
set ytics font ", 8"

set border 2 front linewidth 1.000
set xtics  norangelimit nomirror


set ytics border in scale 1,0.5 nomirror norotate  autojustify

set style fill solid 0.45 border
#set boxwidth 0.2 absolute


# Put X and Y labels
set xlabel "Time (ps)"
set ylabel "Jensen-Shannon divergence  "

#legenda

#set key horizontal bottom outside box maxrows 2 font ", 8"
#set key maxrows 1
#set key horizontal center bottom outside


#set key box 
set key horizontal reverse samplen 2 width -3 maxrows 2 maxcols 12  font ", 8"
#set key at screen 0.5,screen 0.15 center top
set key horizontal center bottom outside

# Give the plot a title
set title "Average Convergence Ratio for $1 simulation"

set style line 1 lt 1 lw  2.5 ps 0.225 linecolor rgb "red"
set style line 2 lt 1 lw  2.5 ps 0.225 linecolor rgb "orange"
set style line 3 lt 1 lw  2.5 ps 0.225 linecolor rgb "yellow"
set style line 4 lt 1 lw  2.5 ps 0.225 linecolor rgb "green"
set style line 5 lt 1 lw  2.5 ps 0.225 linecolor rgb "seagreen"
set style line 6 lt 1 lw  2.5 ps 0.225 linecolor rgb "cyan"
set style line 7 lt 1 lw  2.5 ps 0.225 linecolor rgb "blue"
set style line 8 lt 1 lw  2.5 ps 0.225 linecolor rgb "violet"
set style line 9 lt 1 lw  2.5 ps 0.225 linecolor rgb "magenta"
set style line 10 lt 1 lw 2.5  ps 0.225 linecolor rgb "gold"
set style line 11 lt 1 lw 2.5  ps 0.225 linecolor rgb "orchid"
set style line 12 lt 1 lw 2.5  ps 0.225 linecolor rgb "black"
set style line 13 lt 1 lw 2.5  ps 0.225 linecolor rgb "#FF69B4"
set style line 14 lt 1 lw 2.5  ps 0.225 linecolor rgb "#990033"


#set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)

plot 'avg_alltemps_first.dat' u 1:2
print GPVAL_DATA_Y_MAX
teste = GPVAL_DATA_Y_MAX
teste = teste * (50000/$num_lines)

set label 1 gprintf("Conv = %g", teste) at 2, 2

f(x) = 0*x + teste


set tics font ", 10"



set title gprintf("Average Convergence Ratio for $1 simulation - All temperaturres converged at %g ps", teste) font ", 8"
#unset xtics
#set multiplot
plot  'avg_269.50.dat' using (\$1*(50000/$num_lines)):2 with lines ls 1  title "269.5K" smooth bezier ,\
	  'avg_285.22.dat' using (\$1*(50000/$num_lines)):2 with lines ls 2  title "285.22K" smooth bezier ,\
	  'avg_301.66.dat' using (\$1*(50000/$num_lines)):2 with lines ls 3  title "301.66K" smooth bezier ,\
	  'avg_318.76.dat' using (\$1*(50000/$num_lines)):2 with lines ls 4  title "318.76K" smooth bezier ,\
	  'avg_336.61.dat' using (\$1*(50000/$num_lines)):2 with lines ls 5  title "336.61K" smooth bezier ,\
	  'avg_355.26.dat' using (\$1*(50000/$num_lines)):2 with lines ls 6  title "355.26K" smooth bezier ,\
	  'avg_374.74.dat' using (\$1*(50000/$num_lines)):2 with lines ls 7  title "374.74K" smooth bezier ,\
	  'avg_395.07.dat' using (\$1*(50000/$num_lines)):2 with lines ls 8  title "395.07K" smooth bezier ,\
	  'avg_416.32.dat' using (\$1*(50000/$num_lines)):2 with lines ls 9  title "416.32K" smooth bezier ,\
	  'avg_438.50.dat' using (\$1*(50000/$num_lines)):2 with lines ls 10 title "438.5K" smooth bezier ,\
	  'avg_461.67.dat' using (\$1*(50000/$num_lines)):2 with lines ls 11 title "461.67K" smooth bezier ,\
	  'avg_485.87.dat' using (\$1*(50000/$num_lines)):2 with lines ls 12 title "485.87K" smooth bezier ,\
      'avg_511.14.dat' using (\$1*(50000/$num_lines)):2 with lines ls 13 title "511.14K" smooth bezier ,\
	  'avg_537.54.dat' using (\$1*(50000/$num_lines)):2 with lines ls 14 title "537.54K" smooth bezier   
      
     

EOF
