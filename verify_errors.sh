#!/bin/bash


# bash verify_distribution.sh remd_002 1 -500 0 -4 4 
# 
# ANTES DE RODAR ESSE SCRIPT, PRECISO RODAR O "PRECISO_DISTR_1NS" OU "PRECISO_DISTR_1NS_456" - POIS ESTES GERAM AS DISTRIBUICOES
# QUANDO A RODAR verify_distribution.sh, tenho algumas entradas:
# $1 -> remd_002 é utilizado para diferenciar resultados de diferentes cut-offs
# $2 -> janela de kcal.
#  X0 do gráfico
#  X1 do gráfico
#  Y0 do grafico
#  Y1 do gráfico


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


sleep 5

grep " REMD" erros_against_idealslope_ln_$1_win$2.dat | awk '{print $15 "	"  $17}' > output_erros_1_remdln_$1_win$2.dat
grep "CT-REMD" erros_against_idealslope_ln_$1_win$2.dat| awk '{print $15 "	" $17}' > output_erros_1_ctln_$1_win$2.dat
grep " REMD" erros_against_idealslope2_ln_$1_win$2.dat | awk '{print $15 "	"  $17}' > output_erros_2_remdln_$1_win$2.dat
grep "CT-REMD" erros_against_idealslope2_ln_$1_win$2.dat | awk '{print $15 "	" $17}' > output_erros_2_ctln_$1_win$2.dat
grep " REMD" erros_against_idealslope3_ln_$1_win$2.dat | awk '{print $15 "	" $17}' > output_erros_3_remdln_$1_win$2.dat
grep "CT-REMD" erros_against_idealslope3_ln_$1_win$2.dat | awk '{print $15 "	" $17}' > output_erros_3_ctln_$1_win$2.dat


sort -n output_erros_1_ctln_$1_win$2.dat > output_erros_1_ctln_$1_win$2.datOK
sort -n output_erros_2_ctln_$1_win$2.dat > output_erros_2_ctln_$1_win$2.datOK
sort -n output_erros_3_ctln_$1_win$2.dat > output_erros_3_ctln_$1_win$2.datOK

sort -n output_erros_1_remdln_$1_win$2.dat > output_erros_1_remdln_$1_win$2.datOK
sort -n output_erros_2_remdln_$1_win$2.dat > output_erros_2_remdln_$1_win$2.datOK
sort -n output_erros_3_remdln_$1_win$2.dat > output_erros_3_remdln_$1_win$2.datOK

paste output_erros_1_ctln_$1_win$2.datOK output_erros_1_remdln_$1_win$2.datOK > output_erro_r1ln_$1_win$2.dat
paste output_erros_2_ctln_$1_win$2.datOK output_erros_2_remdln_$1_win$2.datOK > output_erro_r2ln_$1_win$2.dat
paste output_erros_3_ctln_$1_win$2.datOK output_erros_3_remdln_$1_win$2.datOK > output_erro_r3ln_$1_win$2.dat


paste output_erro_r1ln_$1_win$2.dat output_erro_r2ln_$1_win$2.dat output_erro_r3ln_$1_win$2.dat > output_erro_r123ln_$1_win$2.dat
 
      awk '{s=$2+$6+$10}{print $1 "        " s/3}' output_erro_r123ln_$1_win$2.dat > ct_ln_$1_win$2_avg.dat 
      awk '{s=$4+$8+$12}{print $1 "        " s/3}' output_erro_r123ln_$1_win$2.dat > remd_ln_$1_win$2_avg.dat 
 

awk '{s=$2+$6+$10}{media=s/3}{s1=$2-media}{s2=$6-media}{s3=$10-media}{square1=s1*s1}{square2=s2*s2}{square3=s3*s3}{meansquaresum=square1+square2+square3}{avgsquaresum=meansquaresum/3}{result=sqrt(avgsquaresum)}{print $1 "	" result}' output_erro_r123ln_$1_win$2.dat >  output_erros_stdev_123_ct_ln_$1_win$2.dat
awk '{s=$4+$8+$12}{media=s/3}{s1=$4-media}{s2=$8-media}{s3=$12-media}{square1=s1*s1}{square2=s2*s2}{square3=s3*s3}{meansquaresum=square1+square2+square3}{avgsquaresum=meansquaresum/3}{result=sqrt(avgsquaresum)}{print $1 "	" result}' output_erro_r123ln_$1_win$2.dat >  output_erros_stdev_123_remd_ln_$1_win$2.dat
 
 


echo | $gnuplot <<EOF
 
   
set term ${term}


#SOBRE O GRID
# Line style for axes
set style line 90 lt 1 lc 3
set style line 90 lt rgb "#808080"
# Line style for grid
#set style line 81 lt 0  # dashed
set style line 81 lt rgb "#808080"  # grey

#set grid back linestyle 81

set border 3 linestyle 90 
	     # Remove border on top and right.  These
             # borders are useless and make it harder
             # to see plotted lines near the border.
 	     # Also, put it in grey; no need for so much emphasis on a border.
 	     
 	     
 	     

set output "./errors_ln_$3_vs_$4_$1_win$2.${output_extension}"


set xtics font ", 6"
set ytics font ", 8"

set border 2 front linewidth 1.000
set xtics  norangelimit nomirror


set ytics border in scale 1,0.5 nomirror norotate  autojustify

set style fill solid 0.45 border




#legenda
#set key horizontal center bottom outside maxrows 1
#set key samplen 2 spacing .5 font ",8"
unset key

# Give the plot a title


#set style line 1 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "red"
#set style line 2 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "orange"
#set style line 3 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "yellow"
#set style line 4 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "green"
#set style line 5 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "seagreen"
#set style line 6 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "cyan"
#set style line 7 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "blue"
#set style line 8 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "violet"
#set style line 9 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "magenta"
#set style line 10 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "gold"
#set style line 11 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "orchid"
#set style line 12 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "black"
#set style line 13 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "orchid"
#															"#FF69B4"

set style line 14 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb 	"red"
set style line 15 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb  "orange"
set style line 16 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb  "yellow"
set style line 17 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb  "green"
set style line 18 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb  "seagreen"
set style line 19 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb  "cyan"
set style line 20 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb  "blue"
set style line 21 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb  "violet"
set style line 22 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb    "magenta"
set style line 23 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb    "gold"
set style line 24 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb    "orchid"
set style line 25 lt 2 lw 1 pt 2 ps 0.25 linecolor rgb   "black"
set style line 26 lt 2 lw 1 pt 1 ps 0.25 linecolor rgb  "#FF69B4"


set style line 34 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "red"
set style line 35 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "orange"
set style line 36 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "yellow"
set style line 37 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "green"
set style line 38 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "seagreen"
set style line 39 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "cyan"
set style line 40 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "blue"
set style line 41 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "violet"
set style line 42 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "magenta"
set style line 43 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "gold"
set style line 44 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "orchid"
set style line 45 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "black"
set style line 46 lt 71 lw 1 pt 9 ps 0.25 linecolor rgb  "#FF69B4"




	#set tmargin at screen 0.90
	#set bmargin at screen 0.15
	#set rmargin at screen 0.95
	#set lmargin at screen 0.15

		
set xlabel "Adjacent Temperatures" offset 0,3
set ylabel "{/Symbol D} = |slope - ideal slope| ({/Symbol \260})"



#set xrange [ 0 : 14 ]
set xtics ""
set ytics 0.5
set yrange [ 0 : 5 ] #noreverse nowriteback
set xtics font ", 6"
set ytics font ", 8"

#set style data histogram

set boxwidth 0.4


set xtics ("269.50 - 285.22" 4, "285.22 - 301.66" 8, "301.66 - 318.76" 12, "318.76 - 336.61" 16, "336.61 - 355.26" 20, "355.26 - 374.74" 24, "374.74 - 395.07" 28, "395.07 - 416.32" 32, "416.32 - 438.50" 36, "438.50 - 461.67" 40, "461.67 - 485.87" 44, "485.87 - 511.14" 48, "511.14 - 537.54" 52)

set style line 1 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "blue"
set style line 2 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "red"
set style line 3 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "#FF69B4"
set style line 4 lt 1 lw 3 pt 3  ps 0.225 linecolor rgb "#00FF00"

set xtics rotate by 45 right

set key horizontal center bottom outside maxrows 1


	set title "Error against ideal slope, Run 1"
plot 'output_erro_r1ln_$1_win$2.dat'  using (\$1*4 + 0.26):(\$2) with boxes ls 1  title "$3"  ,\
	 'output_erro_r1ln_$1_win$2.dat' using  (\$1*4 - 0.26):(\$4) with boxes ls 2 title "$4"


	set title "Error against ideal slope, Run 2"
plot 'output_erro_r2ln_$1_win$2.dat'  using (\$1*4 + 0.26):(\$2) with boxes ls 1  title "$3"   ,\
	 'output_erro_r2ln_$1_win$2.dat' using  (\$1*4 - 0.26):(\$4) with boxes ls 2 title "$4"
	 
	set title "Error against ideal slope, Run 3"
plot 'output_erro_r3ln_$1_win$2.dat'  using (\$1*4 + 0.26):(\$2) with boxes ls 1  title "$3"   ,\
	 'output_erro_r3ln_$1_win$2.dat' using  (\$1*4 - 0.26):(\$4) with boxes ls 2 title "$4"


	set title "Average Error against ideal slope, 3 Runs"
plot 'ct_ln_$1_win$2_avg.dat' using (\$1*4 + 0.26):(\$2) with boxes ls 1  title  "$3" ,\
	 'remd_ln_$1_win$2_avg.dat' using  (\$1*4 - 0.26):(\$2) with boxes ls 2 title "$4"
     
     
	set title "STDEV of the Error against ideal slope, 3 Runs"
plot 'output_erros_stdev_123_ct_ln_$1_win$2.dat' using (\$1*4 + 0.26):(\$2) with yerrorb ls 1 notitle ,\
     'output_erros_stdev_123_remd_ln_$1_win$2.dat' using (\$1*4 - 0.26):(\$2) with yerrorb ls 2 notitle
EOF

#CUIDADO LINHA 269 /home/lipinski/Dropbox/Resultados-1UNC/LN?/ln_A_vs_E/remd_ln_remd_001_win1_avg2.dat


# plot "../1UNC_1ns_1_RUN1/MD/gdt-total_Ttraj.269.50.dat" using (1-0.45):2 ls 1 with col title "CTREMD" ,\
#   "269.50" 1 ,     v2 
#   "285.22" 3 ,     v3 
#   "301.66" 5 ,     v4 
#   "318.76" 7 ,     v5 
#   "336.61" 9 ,     v6 
#   "355.26" 11 ,    v7 
#   "374.74" 13 ,    v8 
#   "395.07" 15 ,    v9 
#   "416.32" 17 ,    v10
#   "438.50" 19 ,    v11
#   "461.67" 21 ,    v12
#   "485.87" 23 ,    v13
#   "511.14" 25 ,    v
#   "537.54" 27 )    v

