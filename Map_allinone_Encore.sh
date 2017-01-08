#!/bin/bash

gnuplot=/usr/bin/gnuplot
#gnuplot=/usr/bin/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/X11/gnuplot

####				      $1		  $2	      $3       $4-$17
#### USAGE:  ./mapa_8x8.sh <Collor_Pattern_Folder> <Color_Pattern> <Title> <Temperatures>
# ./Map_allinone.sh /home/lipinski/programs/gnuplot-colorbrewer-master/sequential/ Reds "DRES Jensen-Shannon divergence" 269.50 285.22 301.66 318.76 336.61 355.26 374.74 395.07 416.32 438.50 461.67 485.87 511.14 537.54 
# ======= Set Up GnuPlot ========

### ultimo uso: ./Map_allinone.sh /home/lipinski/programs/gnuplot-colorbrewer-master/sequential/ Reds.plt "DRES Jensen-Shannon divergence" 269.50 285.22 301.66 318.76 336.61 355.26 374.74 395.07 416.32 438.50 461.67 485.87 511.14 537.54 A1 A2 A3 E1 E2 E3

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



#term="postscript eps size 3.5,2.62 enhanced color font 'Helvetica,20' linewidth 2"
#output_extension="eps"


#gnuplot=/usr/bin/gnuplot
gnuplot=/usr/local/bin/gnuplot

# Check for gnuplot, and warn if not available.
if [ ! -e $gnuplot ]; then
  echo "Can't find gnuplot at $gnuplot."
  echo "Gnuplot version 4.6.3 or later required."
  exit 3
fi



for ext in `cat ../temperatures.dat` ; do
	cd $ext
	cp ../mapa_6x6.sh .
	chmod 777 mapa_6x6.sh
	bash mapa_6x6.sh sequential Reds saida_dres_$ext.dat-dimred-2dimensions.dat A vs E ${18} ${19} ${20} ${21} ${22} ${23}
	cd ..
done


# ======= Run GnuPlot ========


echo "Criando mapa ..."
#cd ..

echo | $gnuplot <<EOF

#Load Color Pattern

load '$1/$2'
#load '/home/tars/Programs/gnuplot-colorpalettes/$2.pal'

# Set Output
set output "./DRES_Similarity_${18}23_vs_${21}23.$output_extension"

unset key

set view map scale 0.8
#set style data lines

#set label "DRES Jensen-Shannon divergence" at screen 0.01, 0.15 rotate left font "arial,12"

# Set Ticks
set ztics border in scale 0,0 nomirror norotate  autojustify
 
#set rtics axis in scale 0,0 nomirror norotate  autojustify
#set paxis 1 tics border in scale 0,0 nomirror norotate  autojustify
#set paxis 1 tics autofreq  rangelimit
#set paxis 2 tics border in scale 0,0 nomirror norotate  autojustify
#set paxis 2 tics autofreq  rangelimit
#set paxis 3 tics border in scale 0,0 nomirror norotate  autojustify
#set paxis 3 tics autofreq  rangelimit
#set paxis 4 tics border in scale 0,0 nomirror norotate  autojustify
#set paxis 4 tics autofreq  rangelimit
#set paxis 5 tics border in scale 0,0 nomirror norotate  autojustify
#set paxis 5 tics autofreq  rangelimit
#set paxis 6 tics border in scale 0,0 nomirror norotate  autojustify
#set paxis 6 tics autofreq  rangelimit
#set paxis 7 tics border in scale 0,0 nomirror norotate  autojustify
#set paxis 7 tics autofreq  rangelimit

# Set Axis Range
set xrange [ -0.500000 : 5.50000 ] noreverse nowriteback
set yrange [ -0.500000 : 5.50000 ] noreverse nowriteback
set cbrange [ 0.00000 : 0.40000 ] noreverse nowriteback

#set terminal svg standalone
set terminal pdfcairo enhanced color


# Set Multiplot
set multiplot layout 7,2 title "DRES Jensen-Shannon divergence" font ",12"

set palette negative


#set label "DRES Jensen-Shannon divergence" rotate right font "arial,10"
#at screen 0.01, 0.15 rotate left 

set cblabel "DRES Jensen-Shannon divergence" 

#unset ytics
#set ytics   () font "arial,5"
#set ytics center offset -0.75,0
unset xtics
unset ytics



set colorbox vertical user origin 0.92, 0.02 size 0.03, 0.87
set cbtics 0.1 in mirror norotate  autojustify font "arial,8" 

# ======= Plot 269.5 ========

# Set Title
set label "$4 K" at screen 0.12, 0.91 font "arial,9"

set label "${23}" at screen 0.03, 0.875 font "arial,6"
set label "${22}" at screen 0.03, 0.845 font "arial,6"
set label "${21}" at screen 0.03, 0.8150 font "arial,6"
set label "${20}" at screen 0.03, 0.7850 font "arial,6"
set label "${19}" at screen 0.03, 0.7550 font "arial,6"
set label "${18}" at screen 0.03, 0.7250 font "arial,6"

set tmargin at screen 0.89; set bmargin at screen 0.71;
set lmargin at screen 0.05; set rmargin at screen 0.24;

set datafile separator "\t"
plot './$4/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

unset ytics

# ======= Plot 284.53 ========

# Set Title
set label "$5 K" at screen 0.34, 0.91 font "arial,9"

set tmargin at screen 0.89; set bmargin at screen 0.71;
set lmargin at screen 0.27; set rmargin at screen 0.46;

set datafile separator "\t"
plot './$5/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

# ======= Plot 300.24 ========


# Set Title
set label "$6 K" at screen 0.56, 0.91 font "arial,9"

set tmargin at screen 0.89; set bmargin at screen 0.71;
set lmargin at screen 0.49; set rmargin at screen 0.68;

set datafile separator "\t"
plot './$6/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

# ======= Plot 316.62 ========

# Set Title
set label "$7 K" at screen 0.78, 0.91 font "arial,9"

set tmargin at screen 0.89; set bmargin at screen 0.71;
set lmargin at screen 0.71; set rmargin at screen 0.90;

set datafile separator "\t"
plot './$7/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

# ======= Plot 333.73 ========
set ytics   () font "arial,5"
set ytics center offset -0.75,0

unset ytics
# Set Title
set label "$8 K" at screen 0.12, 0.68 font "arial,9"

set label "${23}" at screen 0.03, 0.645 font "arial,6"
set label "${22}" at screen 0.03, 0.615 font "arial,6"
set label "${21}" at screen 0.03, 0.585 font "arial,6"
set label "${20}" at screen 0.03, 0.554 font "arial,6"
set label "${19}" at screen 0.03, 0.525 font "arial,6"
set label "${18}" at screen 0.03, 0.4950 font "arial,6"

set tmargin at screen 0.66; set bmargin at screen 0.48;
set lmargin at screen 0.05; set rmargin at screen 0.24;

set tmargin at screen 0.66; set bmargin at screen 0.48;
set lmargin at screen 0.05; set rmargin at screen 0.24;

set datafile separator "\t"
plot './$8/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

# ======= Plot 351.57 ========

unset ytics
# Set Title
set label "$9 K" at screen 0.34, 0.68 font "arial,9"

set tmargin at screen 0.66; set bmargin at screen 0.48;
set lmargin at screen 0.27; set rmargin at screen 0.46;

set datafile separator "\t"
plot './$9/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

# ======= Plot 370.19 ========
unset ytics   
# Set Title
set label "${10} K" at screen 0.56, 0.68 font "arial,9"

set tmargin at screen 0.66; set bmargin at screen 0.48;
set lmargin at screen 0.49; set rmargin at screen 0.68;

set datafile separator "\t"
plot './${10}/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

# ======= Plot 389.61 ========

# Set Title
set label "${11} K" at screen 0.78, 0.68 font "arial,9"

set tmargin at screen 0.66; set bmargin at screen 0.48;
set lmargin at screen 0.71; set rmargin at screen 0.90;

set datafile separator "\t"
plot './${11}/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

# ======= Plot 409.86 ========

# Set Title
set label "${12} K" at screen 0.12, 0.45 font "arial,9"

set label "${23}" at screen 0.03, 0.415 font "arial,6"
set label "${22}" at screen 0.03, 0.385 font "arial,6"
set label "${21}" at screen 0.03, 0.355 font "arial,6"
set label "${20}" at screen 0.03, 0.325 font "arial,6"
set label "${19}" at screen 0.03, 0.295 font "arial,6"
set label "${18}" at screen 0.03, 0.265 font "arial,6"


set label "${23}" at screen 0.065, 0.24 font "arial,6"
set label "${22}" at screen 0.095, 0.24 font "arial,6"
set label "${21}" at screen 0.125, 0.24 font "arial,6"
set label "${20}" at screen 0.1575, 0.24 font "arial,6"
set label "${19}" at screen 0.19, 0.24 font "arial,6"
set label "${18}" at screen 0.22, 0.24 font "arial,6"



set tmargin at screen 0.43; set bmargin at screen 0.25;
set lmargin at screen 0.05; set rmargin at screen 0.24;

set datafile separator "\t"
plot './${12}/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

# ======= Plot 431.01 ========

unset xtics
unset ytics
# Set Title
set label "${13} K" at screen 0.34, 0.45 font "arial,9"

set tmargin at screen 0.43; set bmargin at screen 0.25;
set lmargin at screen 0.27; set rmargin at screen 0.46;

set datafile separator "\t"
plot './${13}/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

# ======= Plot 453.11 ========

# Set Title
set label "${14} K" at screen 0.56, 0.45 font "arial,9"

set tmargin at screen 0.43; set bmargin at screen 0.25;
set lmargin at screen 0.49; set rmargin at screen 0.68;

set datafile separator "\t"
plot './${14}/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator


# ======= Plot 476.12 ========

# Set Title
set label "${15} K" at screen 0.78, 0.45 font "arial,9"

set tmargin at screen 0.43; set bmargin at screen 0.25;
set lmargin at screen 0.71; set rmargin at screen 0.90;

set label "${23}" at screen 0.065  + 0.655, 0.24 font "arial,6"
set label "${22}" at screen 0.095  + 0.655, 0.24 font "arial,6"
set label "${21}" at screen 0.125  + 0.655, 0.24 font "arial,6"
set label "${20}" at screen 0.1575 + 0.655, 0.24 font "arial,6"
set label "${19}" at screen 0.19   + 0.655, 0.24 font "arial,6"
set label "${18}" at screen 0.22   + 0.655, 0.24 font "arial,6"



set datafile separator "\t"
plot './${15}/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

# ======= Plot 500.14 ========

# Set Title
set label "${16} K" at screen 0.34, 0.22 font "arial,9"

set label "${23}" at screen 0.25, (0.415 - 0.23) font "arial,6"
set label "${22}" at screen 0.25, (0.385 - 0.23) font "arial,6"
set label "${21}" at screen 0.25, (0.355 - 0.23) font "arial,6"
set label "${20}" at screen 0.25, (0.325 - 0.23) font "arial,6"
set label "${19}" at screen 0.25, (0.295 - 0.23) font "arial,6"
set label "${18}" at screen 0.25, (0.265 - 0.23) font "arial,6"


set label "${23}" at screen 0.065  + 0.215, 0.010 font "arial,6"
set label "${22}" at screen 0.095  + 0.215, 0.010 font "arial,6"
set label "${21}" at screen 0.125  + 0.215, 0.010 font "arial,6"
set label "${20}" at screen 0.1575 + 0.215, 0.010 font "arial,6"
set label "${19}" at screen 0.19   + 0.215, 0.010 font "arial,6"
set label "${18}" at screen 0.22   + 0.215, 0.010 font "arial,6"



set tmargin at screen 0.20; set bmargin at screen 0.02;
set lmargin at screen 0.27; set rmargin at screen 0.46;

set datafile separator "\t"
plot './${16}/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator


# ======= Plot 525.21 ========

# Set Title
set label "${17} K" at screen 0.56, 0.22 font "arial,9"

set label "${23}" at screen 0.065  + 0.435, 0.010 font "arial,6"
set label "${22}" at screen 0.095  + 0.435, 0.010 font "arial,6"
set label "${21}" at screen 0.125  + 0.435, 0.010 font "arial,6"
set label "${20}" at screen 0.1575 + 0.435, 0.010 font "arial,6"
set label "${19}" at screen 0.19   + 0.435, 0.010 font "arial,6"
set label "${18}" at screen 0.22   + 0.435, 0.010 font "arial,6"

set tmargin at screen 0.20; set bmargin at screen 0.02;
set lmargin at screen 0.49; set rmargin at screen 0.68;


# ======= Legend ========

### set label "1 - T-REMD_R_1" at screen 0.768, 0.190 font "arial,6"
### set label "2 - T-REMD_R_q" at screen 0.768, 0.168 font "arial,6"
### set label "3 - T-REMD_R_w" at screen 0.768, 0.145 font "arial,6"
### set label "4 - CT-REMD_R_1_-_1_n_s" at screen 0.768, 0.123 font "arial,6"
### set label "5 - CT-REMD_R_2_-_1_n_s" at screen 0.768, 0.100 font "arial,6"
### set label "6 - CT-REMD_R_3_-_1_n_s" at screen 0.768, 0.078 font "arial,6"


set datafile separator "\t"
plot './${17}/temp.dat' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator

EOF
