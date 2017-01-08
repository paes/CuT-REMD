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

    
#exemplo python group_energies.py dist_269.5.dat dist_269.52.dat 1 plotteste
# O QUE IMPORTA EH A SAIDA QUE ESSE GROUP_ENERGIES GERA.
python group_energies.py dist_269.5_1.dat  dist_285.22_1.dat $2 dist_269.5_1_285.22_1.$1.window$2.dat 
python group_energies.py dist_285.22_1.dat dist_301.66_1.dat $2 dist_285.22_1_301.66_1.$1.window$2.dat 
python group_energies.py dist_301.66_1.dat dist_318.76_1.dat $2 dist_301.66_1_318.76_1.$1.window$2.dat 
python group_energies.py dist_318.76_1.dat dist_336.61_1.dat $2 dist_318.76_1_336.61_1.$1.window$2.dat 
python group_energies.py dist_336.61_1.dat dist_355.26_1.dat $2 dist_336.61_1_355.26_1.$1.window$2.dat 
python group_energies.py dist_355.26_1.dat dist_374.74_1.dat $2 dist_355.26_1_374.74_1.$1.window$2.dat 
python group_energies.py dist_374.74_1.dat dist_395.07_1.dat $2 dist_374.74_1_395.07_1.$1.window$2.dat 
python group_energies.py dist_395.07_1.dat dist_416.32_1.dat $2 dist_395.07_1_416.32_1.$1.window$2.dat 
python group_energies.py dist_416.32_1.dat dist_438.5_1.dat  $2 dist_416.32_1_438.5_1.$1.window$2.dat  
python group_energies.py dist_438.5_1.dat  dist_461.67_1.dat $2 dist_438.5_1_461.67_1.$1.window$2.dat  
python group_energies.py dist_461.67_1.dat dist_485.87_1.dat $2 dist_461.67_1_485.87_1.$1.window$2.dat 
python group_energies.py dist_485.87_1.dat dist_511.14_1.dat $2 dist_485.87_1_511.14_1.$1.window$2.dat 
python group_energies.py dist_511.14_1.dat dist_537.54_1.dat $2 dist_511.14_1_537.54_1.$1.window$2.dat 
                                                              
python group_energies.py dist_269.5_2.dat  dist_285.22_2.dat $2 dist_269.5_2_285.22_2.$1.window$2.dat 
python group_energies.py dist_285.22_2.dat dist_301.66_2.dat $2 dist_285.22_2_301.66_2.$1.window$2.dat 
python group_energies.py dist_301.66_2.dat dist_318.76_2.dat $2 dist_301.66_2_318.76_2.$1.window$2.dat 
python group_energies.py dist_318.76_2.dat dist_336.61_2.dat $2 dist_318.76_2_336.61_2.$1.window$2.dat 
python group_energies.py dist_336.61_2.dat dist_355.26_2.dat $2 dist_336.61_2_355.26_2.$1.window$2.dat 
python group_energies.py dist_355.26_2.dat dist_374.74_2.dat $2 dist_355.26_2_374.74_2.$1.window$2.dat 
python group_energies.py dist_374.74_2.dat dist_395.07_2.dat $2 dist_374.74_2_395.07_2.$1.window$2.dat 
python group_energies.py dist_395.07_2.dat dist_416.32_2.dat $2 dist_395.07_2_416.32_2.$1.window$2.dat 
python group_energies.py dist_416.32_2.dat dist_438.5_2.dat  $2 dist_416.32_2_438.5_2.$1.window$2.dat  
python group_energies.py dist_438.5_2.dat  dist_461.67_2.dat $2 dist_438.5_2_461.67_2.$1.window$2.dat  
python group_energies.py dist_461.67_2.dat dist_485.87_2.dat $2 dist_461.67_2_485.87_2.$1.window$2.dat 
python group_energies.py dist_485.87_2.dat dist_511.14_2.dat $2 dist_485.87_2_511.14_2.$1.window$2.dat 
python group_energies.py dist_511.14_2.dat dist_537.54_2.dat $2 dist_511.14_2_537.54_2.$1.window$2.dat 
                                                              
python group_energies.py dist_269.5_3.dat  dist_285.22_3.dat $2 dist_269.5_3_285.22_3.$1.window$2.dat 
python group_energies.py dist_285.22_3.dat dist_301.66_3.dat $2 dist_285.22_3_301.66_3.$1.window$2.dat 
python group_energies.py dist_301.66_3.dat dist_318.76_3.dat $2 dist_301.66_3_318.76_3.$1.window$2.dat 
python group_energies.py dist_318.76_3.dat dist_336.61_3.dat $2 dist_318.76_3_336.61_3.$1.window$2.dat 
python group_energies.py dist_336.61_3.dat dist_355.26_3.dat $2 dist_336.61_3_355.26_3.$1.window$2.dat 
python group_energies.py dist_355.26_3.dat dist_374.74_3.dat $2 dist_355.26_3_374.74_3.$1.window$2.dat 
python group_energies.py dist_374.74_3.dat dist_395.07_3.dat $2 dist_374.74_3_395.07_3.$1.window$2.dat 
python group_energies.py dist_395.07_3.dat dist_416.32_3.dat $2 dist_395.07_3_416.32_3.$1.window$2.dat 
python group_energies.py dist_416.32_3.dat dist_438.5_3.dat  $2 dist_416.32_3_438.5_3.$1.window$2.dat  
python group_energies.py dist_438.5_3.dat  dist_461.67_3.dat $2 dist_438.5_3_461.67_3.$1.window$2.dat  
python group_energies.py dist_461.67_3.dat dist_485.87_3.dat $2 dist_461.67_3_485.87_3.$1.window$2.dat 
python group_energies.py dist_485.87_3.dat dist_511.14_3.dat $2 dist_485.87_3_511.14_3.$1.window$2.dat 
python group_energies.py dist_511.14_3.dat dist_537.54_3.dat $2 dist_511.14_3_537.54_3.$1.window$2.dat 

sed -e "1d" temperatures.dat > temperatures2.dat
paste temperatures.dat temperatures2.dat > filelist.dat
sed -i '$ d' filelist.dat
sed -i s/"	     "/"_1_"/ filelist.dat
sed -i s/"     "/""/ filelist.dat
sed -i -e 's/^/dist_/' filelist.dat
sed -e 's/$/'_1.$1.window$2.dat'/' -i filelist.dat
cp filelist.dat filelist2.dat
cp filelist.dat filelist1.dat
cp filelist.dat filelist3.dat
sed -i s/"_1"/"_2"/ filelist2.dat
sed -i s/"_1"/"_2"/ filelist2.dat
sed -i s/"_1"/"_3"/ filelist3.dat
sed -i s/"_1"/"_3"/ filelist3.dat
cat filelist1.dat filelist2.dat filelist3.dat > filelist.dat
filelist1=`cat filelist1.dat`
filelist2=`cat filelist2.dat`
filelist3=`cat filelist3.dat`
rm temperatures2.dat
sed -i s/".10_"/".1_"/ filelist1.dat filelist2.dat filelist3.dat
sed -i s/".20_"/".2_"/ filelist1.dat filelist2.dat filelist3.dat
sed -i s/".30_"/".3_"/ filelist1.dat filelist2.dat filelist3.dat
sed -i s/".40_"/".4_"/ filelist1.dat filelist2.dat filelist3.dat
sed -i s/".50_"/".5_"/ filelist1.dat filelist2.dat filelist3.dat
sed -i s/".60_"/".6_"/ filelist1.dat filelist2.dat filelist3.dat
sed -i s/".70_"/".7_"/ filelist1.dat filelist2.dat filelist3.dat
sed -i s/".80_"/".8_"/ filelist1.dat filelist2.dat filelist3.dat
sed -i s/".90_"/".9_"/ filelist1.dat filelist2.dat filelist3.dat

nrep=`wc temperatures.dat | awk '{print $2}'`


############ parte do ct remd para cima, parte do remd para baixo


#exemplo python group_energies.py dist_269.5.dat dist_269.52.dat 1 plotteste
# O QUE IMPORTA EH A SAIDA QUE ESSE GROUP_ENERGIES GERA.
python group_energies.py dist_269.5_1_remd.dat  dist_285.22_1_remd.dat $2 dist_remd_269.5_1_285.22_1.$1.window$2.dat 
python group_energies.py dist_285.22_1_remd.dat dist_301.66_1_remd.dat $2 dist_remd_285.22_1_301.66_1.$1.window$2.dat 
python group_energies.py dist_301.66_1_remd.dat dist_318.76_1_remd.dat $2 dist_remd_301.66_1_318.76_1.$1.window$2.dat 
python group_energies.py dist_318.76_1_remd.dat dist_336.61_1_remd.dat $2 dist_remd_318.76_1_336.61_1.$1.window$2.dat 
python group_energies.py dist_336.61_1_remd.dat dist_355.26_1_remd.dat $2 dist_remd_336.61_1_355.26_1.$1.window$2.dat 
python group_energies.py dist_355.26_1_remd.dat dist_374.74_1_remd.dat $2 dist_remd_355.26_1_374.74_1.$1.window$2.dat 
python group_energies.py dist_374.74_1_remd.dat dist_395.07_1_remd.dat $2 dist_remd_374.74_1_395.07_1.$1.window$2.dat 
python group_energies.py dist_395.07_1_remd.dat dist_416.32_1_remd.dat $2 dist_remd_395.07_1_416.32_1.$1.window$2.dat 
python group_energies.py dist_416.32_1_remd.dat dist_438.5_1_remd.dat  $2 dist_remd_416.32_1_438.5_1.$1.window$2.dat  
python group_energies.py dist_438.5_1_remd.dat  dist_461.67_1_remd.dat $2 dist_remd_438.5_1_461.67_1.$1.window$2.dat  
python group_energies.py dist_461.67_1_remd.dat dist_485.87_1_remd.dat $2 dist_remd_461.67_1_485.87_1.$1.window$2.dat 
python group_energies.py dist_485.87_1_remd.dat dist_511.14_1_remd.dat $2 dist_remd_485.87_1_511.14_1.$1.window$2.dat 
python group_energies.py dist_511.14_1_remd.dat dist_537.54_1_remd.dat $2 dist_remd_511.14_1_537.54_1.$1.window$2.dat 
                                                                              
python group_energies.py dist_269.5_2_remd.dat  dist_285.22_2_remd.dat $2 dist_remd_269.5_2_285.22_2.$1.window$2.dat 
python group_energies.py dist_285.22_2_remd.dat dist_301.66_2_remd.dat $2 dist_remd_285.22_2_301.66_2.$1.window$2.dat 
python group_energies.py dist_301.66_2_remd.dat dist_318.76_2_remd.dat $2 dist_remd_301.66_2_318.76_2.$1.window$2.dat 
python group_energies.py dist_318.76_2_remd.dat dist_336.61_2_remd.dat $2 dist_remd_318.76_2_336.61_2.$1.window$2.dat 
python group_energies.py dist_336.61_2_remd.dat dist_355.26_2_remd.dat $2 dist_remd_336.61_2_355.26_2.$1.window$2.dat 
python group_energies.py dist_355.26_2_remd.dat dist_374.74_2_remd.dat $2 dist_remd_355.26_2_374.74_2.$1.window$2.dat 
python group_energies.py dist_374.74_2_remd.dat dist_395.07_2_remd.dat $2 dist_remd_374.74_2_395.07_2.$1.window$2.dat 
python group_energies.py dist_395.07_2_remd.dat dist_416.32_2_remd.dat $2 dist_remd_395.07_2_416.32_2.$1.window$2.dat 
python group_energies.py dist_416.32_2_remd.dat dist_438.5_2_remd.dat  $2 dist_remd_416.32_2_438.5_2.$1.window$2.dat  
python group_energies.py dist_438.5_2_remd.dat  dist_461.67_2_remd.dat $2 dist_remd_438.5_2_461.67_2.$1.window$2.dat  
python group_energies.py dist_461.67_2_remd.dat dist_485.87_2_remd.dat $2 dist_remd_461.67_2_485.87_2.$1.window$2.dat 
python group_energies.py dist_485.87_2_remd.dat dist_511.14_2_remd.dat $2 dist_remd_485.87_2_511.14_2.$1.window$2.dat 
python group_energies.py dist_511.14_2_remd.dat dist_537.54_2_remd.dat $2 dist_remd_511.14_2_537.54_2.$1.window$2.dat 
                                                              
python group_energies.py dist_269.5_3_remd.dat  dist_285.22_3_remd.dat $2 dist_remd_269.5_3_285.22_3.$1.window$2.dat 
python group_energies.py dist_285.22_3_remd.dat dist_301.66_3_remd.dat $2 dist_remd_285.22_3_301.66_3.$1.window$2.dat 
python group_energies.py dist_301.66_3_remd.dat dist_318.76_3_remd.dat $2 dist_remd_301.66_3_318.76_3.$1.window$2.dat 
python group_energies.py dist_318.76_3_remd.dat dist_336.61_3_remd.dat $2 dist_remd_318.76_3_336.61_3.$1.window$2.dat 
python group_energies.py dist_336.61_3_remd.dat dist_355.26_3_remd.dat $2 dist_remd_336.61_3_355.26_3.$1.window$2.dat 
python group_energies.py dist_355.26_3_remd.dat dist_374.74_3_remd.dat $2 dist_remd_355.26_3_374.74_3.$1.window$2.dat 
python group_energies.py dist_374.74_3_remd.dat dist_395.07_3_remd.dat $2 dist_remd_374.74_3_395.07_3.$1.window$2.dat 
python group_energies.py dist_395.07_3_remd.dat dist_416.32_3_remd.dat $2 dist_remd_395.07_3_416.32_3.$1.window$2.dat 
python group_energies.py dist_416.32_3_remd.dat dist_438.5_3_remd.dat  $2 dist_remd_416.32_3_438.5_3.$1.window$2.dat  
python group_energies.py dist_438.5_3_remd.dat  dist_461.67_3_remd.dat $2 dist_remd_438.5_3_461.67_3.$1.window$2.dat  
python group_energies.py dist_461.67_3_remd.dat dist_485.87_3_remd.dat $2 dist_remd_461.67_3_485.87_3.$1.window$2.dat 
python group_energies.py dist_485.87_3_remd.dat dist_511.14_3_remd.dat $2 dist_remd_485.87_3_511.14_3.$1.window$2.dat 
python group_energies.py dist_511.14_3_remd.dat dist_537.54_3_remd.dat $2 dist_remd_511.14_3_537.54_3.$1.window$2.dat 

sed -e "1d" temperatures.dat > temperatures2.dat
paste temperatures.dat temperatures2.dat > filelist_remd.dat
sed -i '$ d' filelist_remd.dat
sed -i s/"	     "/"_1_"/ filelist_remd.dat
sed -i s/"     "/""/ filelist_remd.dat
sed -i -e 's/^/dist_remd_/' filelist_remd.dat
sed -e 's/$/'_1.$1.window$2.dat'/' -i filelist_remd.dat
cp filelist_remd.dat filelist2_remd.dat
cp filelist_remd.dat filelist1_remd.dat
cp filelist_remd.dat filelist3_remd.dat
sed -i s/"_1"/"_2"/ filelist2_remd.dat
sed -i s/"_1"/"_2"/ filelist2_remd.dat
sed -i s/"_1"/"_3"/ filelist3_remd.dat
sed -i s/"_1"/"_3"/ filelist3_remd.dat
cat filelist1_remd.dat filelist2_remd.dat filelist3_remd.dat > filelist_remd.dat
filelist1=`cat filelist1_remd.dat`
filelist2=`cat filelist2_remd.dat`
filelist3=`cat filelist3_remd.dat`
rm temperatures2.dat
sed -i s/".10_"/".1_"/ filelist*_remd.dat
sed -i s/".20_"/".2_"/ filelist*_remd.dat
sed -i s/".30_"/".3_"/ filelist*_remd.dat
sed -i s/".40_"/".4_"/ filelist*_remd.dat
sed -i s/".50_"/".5_"/ filelist*_remd.dat
sed -i s/".60_"/".6_"/ filelist*_remd.dat
sed -i s/".70_"/".7_"/ filelist*_remd.dat
sed -i s/".80_"/".8_"/ filelist*_remd.dat
sed -i s/".90_"/".9_"/ filelist*_remd.dat





















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
 	     
 

set output "./ln_$7_vs_$8_$1_win$2.${output_extension}"


####set xtics ("269.50" 1, "285.22" 3, "301.66" 5, "318.76" 7, "336.61" 9, "355.26" 11, "374.74" 13, "395.07" 15, "416.32" 17, "438.50" 19, "461.67" 21, "485.87" 23, "511.14" 25, "537.54" 27)


set xrange [ $3 : $4 ]

set yrange [ $5 : $6 ] #noreverse nowriteback
set xtics font ", 6"
set ytics font ", 8"

set border 2 front linewidth 1.000
set xtics  norangelimit nomirror


set ytics border in scale 1,0.5 nomirror norotate  autojustify

set style fill solid 0.45 border
#set boxwidth 0.2 absolute




#legenda
#set key horizontal center bottom outside maxrows 1
#set key samplen 2 spacing .5 font ",8"
unset key

# Give the plot a title
#set title "ln [P(E,T2)/P(E,T1)] "

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







# 1 - cruz
# 7 - bola
# 122 - quadrado completo
# 2 - x
#146 - asterisco
# 37 - triangulo para baixo
#142 diamante vazado
#13 diamante 
# 4 quadrado vazado
#9 - triangulo para cima
#75 - vazado triangulo pra baixo
#71 - bola vazada
#73 - vazado triangulo pra cima



###color "black" 
###color "black" 
###color "black" 
###color "black" 
###color "black" 
###color "black"  #"black"  122
###color "black" #"black"   154
###color "black"  #"black"  143
###color "black"  #"black"  37 
###color "black"  #"black
###color "black" 
###color black" 
###color "black" 


## A relevant knowledge on the ANOVA. 
##	SST = SSR+SSE
##
## where, each term represents following items.
### Total sum of squares, SST: the total variation in the observed values of the reponse variable.
### Regression sum of squares, SSR: the variation in the observed values of the response variable explained by the regression
## Error sum of squares, SSE: the variation in the observed values of the response variable not explained by the regression.
## Also, the coefficient of determination, r^2 is 
##  R^2 = SSR/SST

##	The tricky part is to obtain SST using the fit command, which is a curve fitting, but produces some useful variables, FIT_WSSR and FIT_NDF. For details, refer to gnuplot tricks: Basic statistics.

### CREIO QUE POSSO COMENTAR ## set fit errorvariables
### CREIO QUE POSSO COMENTAR ## 	mean(x)= me
### CREIO QUE POSSO COMENTAR ## 	fit mean(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via me
### CREIO QUE POSSO COMENTAR ## 	SST = FIT_WSSR/(FIT_NDF+1)
### CREIO QUE POSSO COMENTAR ## 	f1(x) = m*x + y0
### CREIO QUE POSSO COMENTAR ## 	fit f1(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via m,y0
### CREIO QUE POSSO COMENTAR ## 	SSE=FIT_WSSR/(FIT_NDF)
### CREIO QUE POSSO COMENTAR ## 	SSR=SST-SSE
### CREIO QUE POSSO COMENTAR ## 	R2=SSR/SST
### CREIO QUE POSSO COMENTAR ## 	#print m_err
### CREIO QUE POSSO COMENTAR ## 	#print y0_err
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 	#set label sprintf("f1(x)=%fx+%f\nR^2=%f", m, y0, R2) # print r^2.
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 	kb = 0.0019872041
### CREIO QUE POSSO COMENTAR ## 	ideal_slope =  1/(kb *336.61) - 1/(kb *355.26)
### CREIO QUE POSSO COMENTAR ## 	
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## ####http://core.ecu.edu/psyc/wuenschk/docs30/CompareCorrCoeff.pdf
### CREIO QUE POSSO COMENTAR ## ###sb1b2 = sqrt( (m_err * m_err) + (0*0) )
### CREIO QUE POSSO COMENTAR ## ###erro_slope = (m - ideal_slope ) /  sb1b2 
### CREIO QUE POSSO COMENTAR ## ###print "Erro Slope : ", erro_slope
### CREIO QUE POSSO COMENTAR ## ###
### CREIO QUE POSSO COMENTAR ## ###erro_slope2 = (ideal_slope - m) /  sb1b2 
### CREIO QUE POSSO COMENTAR ## ###print "Erro Slope : ", erro_slope2
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## mean2(x)= me2
### CREIO QUE POSSO COMENTAR ## 	fit mean2(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via me2
### CREIO QUE POSSO COMENTAR ## 	SST_2 = FIT_WSSR/(FIT_NDF+1)
### CREIO QUE POSSO COMENTAR ## 	f3(x) = ideal_slope*x + y2
### CREIO QUE POSSO COMENTAR ## 	fit f3(x) 'dist_318.76_2_336.61_2.$1.window$2.dat' using (\$1):(log(\$3 / \$2)) via y2
### CREIO QUE POSSO COMENTAR ## 	SSE_2=FIT_WSSR/(FIT_NDF)
### CREIO QUE POSSO COMENTAR ## 	SSR_2=SST_2-SSE_2
### CREIO QUE POSSO COMENTAR ## 	R2_ideal=SSR_2/SST_2
### CREIO QUE POSSO COMENTAR ## 	#print m_err
### CREIO QUE POSSO COMENTAR ## 	#print y0_err
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 	
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## print "me do mean(x): ", me
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## print "R2 da distribuicao para com a reta mais proxima dela: ", R2 # r2 ou coeficiente de determinacao
### CREIO QUE POSSO COMENTAR ## print "m(coeficiente angular) dessa reta: ",m # coeficiente angular
### CREIO QUE POSSO COMENTAR ## print "m_err: ", m_err #standard error for slope
### CREIO QUE POSSO COMENTAR ## print "Ideal Slope: ",ideal_slope
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## # gerar agora o R2 da minha distribuicao em relacao ao slope correto.
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## print "me do mean2(x): ", me2
### CREIO QUE POSSO COMENTAR ## print "R2 da distribuicao para com a reta ideal: ", R2_ideal # r2 ou coeficiente de determinacao
### CREIO QUE POSSO COMENTAR ## print "m(coeficiente angular) dessa reta: ",me # coeficiente angular
### CREIO QUE POSSO COMENTAR ## print "m_err: ", me_err #standard error for slope
### CREIO QUE POSSO COMENTAR ## print "Ideal Slope: ",ideal_slope
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## 
### CREIO QUE POSSO COMENTAR ## print "Error against ideal slope: ", ( (R2 / R2_ideal) - 1 ) * 100,  "%"  
### CREIO QUE POSSO COMENTAR ## #ACIMA EU CONSIGO CALCULAR O ERRO DE QLQR DISTRIBUICAO CONTRA O IDEAL_SLOPE.
### CREIO QUE POSSO COMENTAR ## #PARA CALCULAR O ERRO ENTRE REMD e CT REMD, PRECISAREI SOMENTE DOS SLOPES (SLOPE CT, SLOPE REMD e SLOPE IDEAL) -> 

	
#set title "$7 vs $8 - R1"

list1 = system('cat filelist1.dat')
list2 = system('cat filelist2.dat')
list3 = system('cat filelist3.dat')

list4 = system('cat filelist1_remd.dat')
list5 = system('cat filelist2_remd.dat')
list6 = system('cat filelist3_remd.dat')

i = 14

item(n) = word(list1,n)
item2(n) = word(list4,n)


system('rm erros_against_idealslope_ln_$1_win$2.dat') 


do for [a=1:13] {

	set fit noerrorvariables
	set fit errorvariables
	mean(x)= me
	fit mean(x) item(a) using (\$1):(log(\$3 / \$2)) via me
	SST = FIT_WSSR/(FIT_NDF+1)
	f1(x) = m*x + y0
	fit f1(x) item(a) using (\$1):(log(\$3 / \$2)) via m,y0
	SSE=FIT_WSSR/(FIT_NDF)
	SSR=SST-SSE
	R2=SSR/SST
###	print "########"
###	print "m: " , m 
###	print "SST: ", SST
###	print "SSE: ", SSE
###	print "WSSR: ", FIT_WSSR
###	print "FIT_NDF: ", FIT_NDF
###	print "SSR: ", SSR
###	print "R2: ", R2
###	print "########"
	

	kb = 0.0019872041
	ideal_slope =  1/(kb *336.61) - 1/(kb *355.26)

	set fit errorvariables
	mean2(x)= me2
	fit mean2(x) item(a) using (\$1):(log(\$3 / \$2)) via me2
	SST_2 = FIT_WSSR/(FIT_NDF+1)
	f3(x) = ideal_slope*x + y2
	fit f3(x) item(a) using (\$1):(log(\$3 / \$2)) via y2
	SSE_2=FIT_WSSR/(FIT_NDF-1)
	SSR_2=SST_2-SSE_2
	R2_ideal=SSR_2/SST_2
#####	print "########"
#####	print "ideal slope: " , ideal_slope 
#####	print "SST_2: ", SST_2
#####	print "SSE_2: ", SSE_2
#####	print "WSSR: ", FIT_WSSR
#####	print "FIT_NDF: ", FIT_NDF
#####	print "SSR_2: ", SSR_2
#####	print "R2: ", R2_ideal
#####	print "########"
#####print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"





set angles degrees
m_angle = atan(m)
ideal_angle = atan(ideal_slope)
set angles radians

if (ideal_angle > m_angle) {
	error4 = ideal_angle - m_angle  
}
else{
	error4 = m_angle - ideal_angle  
}

print "Delta Slope angle from m against ideal slope for adjacent temperatures CT-REMD ", (a-1) , " and " , a  ," is: " , error4 ,  " degrees"	

set print "erros_against_idealslope_ln_$1_win$2.dat" append
#print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
}




do for [a=1:13] {

	set fit noerrorvariables
	set fit errorvariables
	mean(x)= me
	fit mean(x) item2(a) using (\$1):(log(\$3 / \$2)) via me
	SST = FIT_WSSR/(FIT_NDF+1)
	f1(x) = m*x + y0
	fit f1(x) item2(a) using (\$1):(log(\$3 / \$2)) via m,y0
	SSE=FIT_WSSR/(FIT_NDF)
	SSR=SST-SSE
	R2=SSR/SST
###	print "########"
###	print "m: " , m 
###	print "SST: ", SST
###	print "SSE: ", SSE
###	print "WSSR: ", FIT_WSSR
###	print "FIT_NDF: ", FIT_NDF
###	print "SSR: ", SSR
###	print "R2: ", R2
###	print "########"
	

	kb = 0.0019872041
	ideal_slope =  1/(kb *336.61) - 1/(kb *355.26)

	set fit errorvariables
	mean2(x)= me2
	fit mean2(x) item2(a) using (\$1):(log(\$3 / \$2)) via me2
	SST_2 = FIT_WSSR/(FIT_NDF+1)
	f3(x) = ideal_slope*x + y2
	fit f3(x) item2(a) using (\$1):(log(\$3 / \$2)) via y2
	SSE_2=FIT_WSSR/(FIT_NDF-1)
	SSR_2=SST_2-SSE_2
	R2_ideal=SSR_2/SST_2
#####	print "########"
#####	print "ideal slope: " , ideal_slope 
#####	print "SST_2: ", SST_2
#####	print "SSE_2: ", SSE_2
#####	print "WSSR: ", FIT_WSSR
#####	print "FIT_NDF: ", FIT_NDF
#####	print "SSR_2: ", SSR_2
#####	print "R2: ", R2_ideal
#####	print "########"
#####print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"





set angles degrees
m_angle = atan(m)
ideal_angle = atan(ideal_slope)
set angles radians

if (ideal_angle > m_angle) {
	error4 = ideal_angle - m_angle  
}
else{
	error4 = m_angle - ideal_angle  
}

print "Delta Slope angle from m against ideal slope for adjacent temperatures REMD ", (a-1) , " and " , a  ," is: " , error4 ,  " degrees"	

set print "erros_against_idealslope_ln_$1_win$2.dat" append
#print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
}

set multiplot layout 2, 1

		set border 2 front linewidth 1.000 ls 90
		set xtics  norangelimit nomirror
       

		set ytics border in scale 1,0.5 nomirror norotate  autojustify

		set style fill solid 0.45 border
		#set boxwidth 0.2 absolute


		# Put X and Y labels
		unset xlabel 
		set ylabel "ln [P(E,T2)/P(E,T1)] "

		#legenda
		#set key horizontal center bottom outside maxrows 1
		#set key samplen 2 spacing .5 font ",8"
		unset key
		unset xtics 
		ytics font ", 6"


	set title "$7 vs $8 - R1" offset 0,0,0
	# Put X and Y labels
	#set xlabel "Potential Energy (kcal/mol)"
	set ylabel "ln [P(E)_T__2/P(E)_T__1] " offset 0,-5,0

	set tmargin at screen 0.90
	set bmargin at screen 0.56
	set rmargin at screen 0.95
	set lmargin at screen 0.10
plot "<echo '-550 3'"   with points ls 25 ps 1, \
     "<echo '-550 2'"   with points ls 45 ps 1
     
set label 2 at  -540, 3 '$7' front font ", 6"
set label 3 at  -540, 2 '$8' front font ", 6"                       
     
plot for [a=1:13] item(a) using (\$1):(log(\$3 / \$2)) with points ls (a+13)  lw 2 title (item(a))

unset label 2
unset label 3

show margin
# smaller overlay plot

set bmargin at screen 0.1
	set xtics  norangelimit nomirror
	set xlabel "Potential Energy (kcal/mol)"
	set xtics font ", 6"
	unset title


	set xlabel "Potential Energy (kcal/mol)"
	unset ylabel 
	set border 3 front linewidth 1.000 ls 90
	set tmargin at screen 0.51
	set bmargin at screen 0.15
	set rmargin at screen 0.95
	set lmargin at screen 0.10
plot for [a=1:13] item2(a) using (\$1):(log(\$3 / \$2)) with points ls (a+33)  lw 2 title (item2(a))
show margin
#plot    f3(x) 

unset multiplot
















#fronteira plot 1- > plot2 (que eh dos R2)





item(n) = word(list2,n)
item2(n) = word(list5,n)

system('rm erros_against_idealslope2_ln_$1_win$2.dat') 


do for [a=1:13] {


	set fit noerrorvariables
	set fit errorvariables
	mean(x)= me
	fit mean(x) item(a) using (\$1):(log(\$3 / \$2)) via me
	SST = FIT_WSSR/(FIT_NDF+1)
	f1(x) = m*x + y0
	fit f1(x) item(a) using (\$1):(log(\$3 / \$2)) via m,y0
	SSE=FIT_WSSR/(FIT_NDF)
	SSR=SST-SSE
	R2=SSR/SST
###	print "########"
###	print "m: " , m 
###	print "SST: ", SST
###	print "SSE: ", SSE
###	print "WSSR: ", FIT_WSSR
###	print "FIT_NDF: ", FIT_NDF
###	print "SSR: ", SSR
###	print "R2: ", R2
###	print "########"
	

	kb = 0.0019872041
	ideal_slope =  1/(kb *336.61) - 1/(kb *355.26)

	set fit errorvariables
	mean2(x)= me2
	fit mean2(x) item(a) using (\$1):(log(\$3 / \$2)) via me2
	SST_2 = FIT_WSSR/(FIT_NDF+1)
	f3(x) = ideal_slope*x + y2
	fit f3(x) item(a) using (\$1):(log(\$3 / \$2)) via y2
	SSE_2=FIT_WSSR/(FIT_NDF-1)
	SSR_2=SST_2-SSE_2
	R2_ideal=SSR_2/SST_2
#####	print "########"
#####	print "ideal slope: " , ideal_slope 
#####	print "SST_2: ", SST_2
#####	print "SSE_2: ", SSE_2
#####	print "WSSR: ", FIT_WSSR
#####	print "FIT_NDF: ", FIT_NDF
#####	print "SSR_2: ", SSR_2
#####	print "R2: ", R2_ideal
#####	print "########"
#####print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"





set angles degrees
m_angle = atan(m)
ideal_angle = atan(ideal_slope)
set angles radians

if (ideal_angle > m_angle) {
	error4 = ideal_angle - m_angle  
}
else{
	error4 = m_angle - ideal_angle  
}

print "Delta Slope angle from m against ideal slope for adjacent temperatures CT-REMD ", (a-1) , " and " , a  ," is: " , error4 ,  " degrees"	

set print "erros_against_idealslope2_ln_$1_win$2.dat" append
#print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
}




do for [a=1:13] {

	set fit noerrorvariables
	set fit errorvariables
	mean(x)= me
	fit mean(x) item2(a) using (\$1):(log(\$3 / \$2)) via me
	SST = FIT_WSSR/(FIT_NDF+1)
	f1(x) = m*x + y0
	fit f1(x) item2(a) using (\$1):(log(\$3 / \$2)) via m,y0
	SSE=FIT_WSSR/(FIT_NDF)
	SSR=SST-SSE
	R2=SSR/SST
###	print "########"
###	print "m: " , m 
###	print "SST: ", SST
###	print "SSE: ", SSE
###	print "WSSR: ", FIT_WSSR
###	print "FIT_NDF: ", FIT_NDF
###	print "SSR: ", SSR
###	print "R2: ", R2
###	print "########"
	

	kb = 0.0019872041
	ideal_slope =  1/(kb *336.61) - 1/(kb *355.26)

	set fit errorvariables
	mean2(x)= me2
	fit mean2(x) item2(a) using (\$1):(log(\$3 / \$2)) via me2
	SST_2 = FIT_WSSR/(FIT_NDF+1)
	f3(x) = ideal_slope*x + y2
	fit f3(x) item2(a) using (\$1):(log(\$3 / \$2)) via y2
	SSE_2=FIT_WSSR/(FIT_NDF-1)
	SSR_2=SST_2-SSE_2
	R2_ideal=SSR_2/SST_2
#####	print "########"
#####	print "ideal slope: " , ideal_slope 
#####	print "SST_2: ", SST_2
#####	print "SSE_2: ", SSE_2
#####	print "WSSR: ", FIT_WSSR
#####	print "FIT_NDF: ", FIT_NDF
#####	print "SSR_2: ", SSR_2
#####	print "R2: ", R2_ideal
#####	print "########"
#####print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"





set angles degrees
m_angle = atan(m)
ideal_angle = atan(ideal_slope)
set angles radians

if (ideal_angle > m_angle) {
	error4 = ideal_angle - m_angle  
}
else{
	error4 = m_angle - ideal_angle  
}

print "Delta Slope angle from m against ideal slope for adjacent temperatures REMD ", (a-1) , " and " , a  ," is: " , error4 ,  " degrees"	

set print "erros_against_idealslope2_ln_$1_win$2.dat" append
#print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
}



set multiplot layout 2, 1

		set border 2 front linewidth 1.000 ls 90
		set xtics  norangelimit nomirror
       

		set ytics border in scale 1,0.5 nomirror norotate  autojustify

		set style fill solid 0.45 border
		#set boxwidth 0.2 absolute


		# Put X and Y labels
		unset xlabel 
		set ylabel "ln [P(E,T2)/P(E,T1)] "

		#legenda
		#set key horizontal center bottom outside maxrows 1
		#set key samplen 2 spacing .5 font ",8"
		unset key
		unset xtics
		set ytics font ", 6"


	set title "$7 vs $8 - R2" offset 0,0,0
	# Put X and Y labels
	#set xlabel "Potential Energy (kcal/mol)"
	set ylabel "ln [P(E)_T__2/P(E)_T__1] " offset 0,-5,0

	set tmargin at screen 0.90
	set bmargin at screen 0.56
	set rmargin at screen 0.95
	set lmargin at screen 0.10

plot "<echo '-550 3'"   with points ls 25 ps 1, \
     "<echo '-550 2'"   with points ls 45 ps 1

set label 2 at  -540, 3 '$7' front font ", 6"
set label 3 at  -540, 2 '$8' front font ", 6"                       
     
plot for [a=1:13] item(a) using (\$1):(log(\$3 / \$2)) with points ls (a+13)  lw 2 title (item(a))

unset label 2
unset label 3
show margin
# smaller overlay plot

set bmargin at screen 0.1
	set xtics  norangelimit nomirror
	set xlabel "Potential Energy (kcal/mol)"
	set xtics font ", 6"
	unset title


	set xlabel "Potential Energy (kcal/mol)"
	unset ylabel 
	set border 3 front linewidth 1.000 ls 90
	set tmargin at screen 0.51
	set bmargin at screen 0.15
	set rmargin at screen 0.95
	set lmargin at screen 0.10
plot for [a=1:13] item2(a) using (\$1):(log(\$3 / \$2)) with points ls (a+33)  lw 2 title (item2(a))
show margin
#plot    f3(x) 

unset multiplot






#dentro desse for preciso colocar os outros....



#terceiro plot aqui!

item(n) = word(list3,n)
item2(n) = word(list6,n)

system('rm erros_against_idealslope3_ln_$1_win$2.dat') 


do for [a=1:13] {


	set fit noerrorvariables
	set fit errorvariables
	mean(x)= me
	fit mean(x) item(a) using (\$1):(log(\$3 / \$2)) via me
	SST = FIT_WSSR/(FIT_NDF+1)
	f1(x) = m*x + y0
	fit f1(x) item(a) using (\$1):(log(\$3 / \$2)) via m,y0
	SSE=FIT_WSSR/(FIT_NDF)
	SSR=SST-SSE
	R2=SSR/SST
###	print "########"
###	print "m: " , m 
###	print "SST: ", SST
###	print "SSE: ", SSE
###	print "WSSR: ", FIT_WSSR
###	print "FIT_NDF: ", FIT_NDF
###	print "SSR: ", SSR
###	print "R2: ", R2
###	print "########"
	

	kb = 0.0019872041
	ideal_slope =  1/(kb *336.61) - 1/(kb *355.26)

	set fit errorvariables
	mean2(x)= me2
	fit mean2(x) item(a) using (\$1):(log(\$3 / \$2)) via me2
	SST_2 = FIT_WSSR/(FIT_NDF+1)
	f3(x) = ideal_slope*x + y2
	fit f3(x) item(a) using (\$1):(log(\$3 / \$2)) via y2
	SSE_2=FIT_WSSR/(FIT_NDF-1)
	SSR_2=SST_2-SSE_2
	R2_ideal=SSR_2/SST_2
#####	print "########"
#####	print "ideal slope: " , ideal_slope 
#####	print "SST_2: ", SST_2
#####	print "SSE_2: ", SSE_2
#####	print "WSSR: ", FIT_WSSR
#####	print "FIT_NDF: ", FIT_NDF
#####	print "SSR_2: ", SSR_2
#####	print "R2: ", R2_ideal
#####	print "########"
#####print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"





set angles degrees
m_angle = atan(m)
ideal_angle = atan(ideal_slope)
set angles radians

if (ideal_angle > m_angle) {
	error4 = ideal_angle - m_angle  
}
else{
	error4 = m_angle - ideal_angle  
}

print "Delta Slope angle from m against ideal slope for adjacent temperatures CT-REMD ", (a-1) , " and " , a  ," is: " , error4 ,  " degrees"	

set print "erros_against_idealslope3_ln_$1_win$2.dat" append
#print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
}




do for [a=1:13] {

	set fit noerrorvariables
	set fit errorvariables
	mean(x)= me
	fit mean(x) item2(a) using (\$1):(log(\$3 / \$2)) via me
	SST = FIT_WSSR/(FIT_NDF+1)
	f1(x) = m*x + y0
	fit f1(x) item2(a) using (\$1):(log(\$3 / \$2)) via m,y0
	SSE=FIT_WSSR/(FIT_NDF)
	SSR=SST-SSE
	R2=SSR/SST
###	print "########"
###	print "m: " , m 
###	print "SST: ", SST
###	print "SSE: ", SSE
###	print "WSSR: ", FIT_WSSR
###	print "FIT_NDF: ", FIT_NDF
###	print "SSR: ", SSR
###	print "R2: ", R2
###	print "########"
	

	kb = 0.0019872041
	ideal_slope =  1/(kb *336.61) - 1/(kb *355.26)

	set fit errorvariables
	mean2(x)= me2
	fit mean2(x) item2(a) using (\$1):(log(\$3 / \$2)) via me2
	SST_2 = FIT_WSSR/(FIT_NDF+1)
	f3(x) = ideal_slope*x + y2
	fit f3(x) item2(a) using (\$1):(log(\$3 / \$2)) via y2
	SSE_2=FIT_WSSR/(FIT_NDF-1)
	SSR_2=SST_2-SSE_2
	R2_ideal=SSR_2/SST_2
#####	print "########"
#####	print "ideal slope: " , ideal_slope 
#####	print "SST_2: ", SST_2
#####	print "SSE_2: ", SSE_2
#####	print "WSSR: ", FIT_WSSR
#####	print "FIT_NDF: ", FIT_NDF
#####	print "SSR_2: ", SSR_2
#####	print "R2: ", R2_ideal
#####	print "########"
#####print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"





set angles degrees
m_angle = atan(m)
ideal_angle = atan(ideal_slope)
set angles radians

if (ideal_angle > m_angle) {
	error4 = ideal_angle - m_angle  
}
else{
	error4 = m_angle - ideal_angle  
}

print "Delta Slope angle from m against ideal slope for adjacent temperatures REMD ", (a-1) , " and " , a  ," is: " , error4 ,  " degrees"	

set print "erros_against_idealslope3_ln_$1_win$2.dat" append
#print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
}




set multiplot layout 2, 1

		set border 2 front linewidth 1.000 ls 90
		set xtics  norangelimit nomirror
       

		set ytics border in scale 1,0.5 nomirror norotate  autojustify

		set style fill solid 0.45 border
		#set boxwidth 0.2 absolute


		# Put X and Y labels
		unset xlabel 
		set ylabel "ln [P(E,T2)/P(E,T1)] "

		#legenda
		#set key horizontal center bottom outside maxrows 1
		#set key samplen 2 spacing .5 font ",8"
		unset key
		unset xtics
		set ytics font ", 6"


	set title "$7 vs $8 - R3" offset 0,0,0
	# Put X and Y labels
	#set xlabel "Potential Energy (kcal/mol)"
	set ylabel "ln [P(E)_T__2/P(E)_T__1] " offset 0,-5,0

	set tmargin at screen 0.90
	set bmargin at screen 0.56
	set rmargin at screen 0.95
	set lmargin at screen 0.10
plot "<echo '-550 3'"   with points ls 25 ps 1, \
     "<echo '-550 2'"   with points ls 45 ps 1

set label 2 at  -540, 3 '$7' front font ", 6"
set label 3 at  -540, 2 '$8' front font ", 6"                       
     
plot for [a=1:13] item(a) using (\$1):(log(\$3 / \$2)) with points ls (a+13)  lw 2 title (item(a))

unset label 2
unset label 3

show margin
# smaller overlay plot

set bmargin at screen 0.1
	set xtics  norangelimit nomirror
	set xlabel "Potential Energy (kcal/mol)"
	set xtics font ", 6"
	unset title


	set xlabel "Potential Energy (kcal/mol)"
	unset ylabel 
	set border 3 front linewidth 1.000 ls 90
	set tmargin at screen 0.51
	set bmargin at screen 0.15
	set rmargin at screen 0.95
	set lmargin at screen 0.10
plot for [a=1:13] item2(a) using (\$1):(log(\$3 / \$2)) with points ls (a+33)  lw 2 title (item2(a))
show margin
#plot    f3(x) 


!sleep 5
unset multiplot
	
EOF

# plot "../1UNC_1ns_1_RUN1/MD/gdt-total_Ttraj.269.50.dat" using (1-0.45):2 ls 1 with boxplot title "CTREMD" ,\
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

