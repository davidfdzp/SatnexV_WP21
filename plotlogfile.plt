# Usage: gnuplot -e "filename='out.log'" -e "start=0" -e "end=1000" plotlogfile.plt
if (!exists("filename")) filename='out.log'
if (!exists("start")) start=0
if (!exists("end")) end=0
set xlabel "Time (ms)"
set ylabel "Normalized bandwidth"
titlename=filename[1:strlen(filename)-4]
plot filename u 0:1 w l title titlename
set arrow from start,0 to start,GPVAL_Y_MAX nohead linecolor "green"
set arrow from end,0 to end,GPVAL_Y_MAX nohead linecolor "red"
pause -1