

reset
fontsize = 12
set term postscript enhanced eps fontsize
set output "histoerrorbartest.eps"
set boxwidth 0.9
#set style fill solid 1.00 border 0
set style fill solid 1.00 noborder
#set style histogram errorbars gap 2 lw 1
#set style data histograms
set xtics rotate by -45
set bars 0.5
set yrange [ 0.00000 : 35]
set datafile separator ","
#plot 'data.dat' using 2:3:4:xtic(1) ti "CT-REMD" linecolor rgb "blue" with yerrorbars, \
#        '' using 6:7:8 ti "REMD" lt 1 lc rgb "green" with yerrorbars, \
#        '' using 10:11:12 ti "C-MD" lt 1 lc rgb "gray" with yerrorbars, \
#        '' using 14:15:16 ti "MD" lt 1 lc rgb "red" with yerrorbars
 
plot 'data.dat' using 2:3:4:xtic(1) ti "CT-REMD" linecolor rgb "blue" with yerrorbars, \
        '' using 6:7:8 ti "REMD" lt 1 lc rgb "green" with yerrorbars, \
        '' using 10:11:12  ti "C-MD" lt 1 lc rgb "gray" with yerrorbars, \
        '' using 14:15:16 ti "MD" lt 1 lc rgb "red" with yerrorbars


#/* this is the datafile. save it as histoerrorbartest.dat in the same folder as the histoerrorbartest.gpl */

# This command works for a linux computer. In linux, you need to specify the exact location of
# the font you want to use
 set terminal png notransparent rounded
#font "/usr/share/fonts/msttcore/arial.ttf" 24 \
  size 1200,960 

# nomirror means do not put tics on the opposite side of the plot
set xtics nomirror
set ytics nomirror

# On the Y axis put a major tick every 5
set ytics 0.5

# On both the x and y axes split each space in half and put a minor tic there
set mxtics 1
set mytics 0.25


# Line style for axes
# Define a line style (we're calling it 80) and set 
# lt = linetype to 0 (dashed line)
# lc = linecolor to a gray defined by that number
set style line 80 lt 0 lc rgb "#808080"

# Set the border using the linestyle 80 that we defined
# 3 = 1 + 2 (1 = plot the bottom line and 2 = plot the left line)
# back means the border should be behind anything else drawn
set border 4 back ls 80 

# Line style for grid
# Define a new linestyle (81)
# linetype = 0 (dashed line)
# linecolor = gray
# lw = lineweight, make it half as wide as the axes lines
set style line 81 lt 0 lc rgb "#808080" lw 0.5

# Draw the grid lines for both the major and minor tics
set grid xtics
set grid ytics
#set grid mxtics
set grid mytics

# Put the grid behind anything drawn and use the linestyle 81
set grid back ls 81

# Add line at -3db
# Draw a line from the right end of the graph to the left end of the graph at
# the y value of -3
# The line should not have an arrowhead
# Linewidth = 2
# Linecolor = black
# It should be in front of anything else drawn
#set arrow from graph 0,first -3 to graph 1, first -3 nohead lw 2 lc rgb "#000000" front

# Put a label -3db at 80% the width of the graph and y = -2 (it will be just above the line drawn)
#set label "-3dB" at graph 0.8, first 37

# Create some linestyles for our data
# pt = point type (triangles, circles, squares, etc.)
# ps = point size
#set style line 1 lt 1 lc rgb "#A00000" lw 2 pt 7 ps 1.5

# Name our output file
#set term png
set output "rmsd.png"
# Put X and Y labels
set xlabel "Temperature, (K)"
set ylabel "RMSD, (Å)"

# Set the range of our x and y axes
set xrange [175:525]
##set yrange [-30:5]


# Give the plot a title
set title "Simulation results - Average, Minimum and Maximum RMSD per Temperature"

# Put the legend at the bottom left of the plot
set key left bottom
# Plot the actual data
# u 1:2 = using column 1 for X axis and column 2 for Y axis
# w lp = with linepoints, meaning put a point symbol and draw a line
# ls 1 = use our defined linestyle 1
# t "Test 1" = title "Test 1" will go in the legend
# The rest of the lines plot columns 3, 5 and 7


set style line 1 lt 1 lc rgb "blue" lw 2 pt 7 ps 1.5
set style line 2 lt 1 lc rgb "red" lw 2 pt 7 ps 1.5
set style line 3 lt 1 lc rgb "green" lw 2 pt 7 ps 1.5
set style line 4 lt 1 lc rgb "gray" lw 2 pt 7 ps 1.5

#set style data histograms

#plot "dados.dat" t "CT-REMD" ls 1 with yerrorbars , \
#"dados2.dat" t "REMD" ls 2 with yerrorbars , \
#"dados3.dat" t "C-MD" ls 3 with yerrorbars , \
# "dados4.dat" t "MD" ls 4 with yerrorbars ;



# This is important because it closes our output file.
set output
