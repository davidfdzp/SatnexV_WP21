# SatnexV_WP21

git clone https://github.com/davidfdzp/SatnexV_WP21.git
cd SatnexV_WP21

install pandas scikit-learn:

pip3 install panda
pip3 install sklearn

sudo apt install libpcap-dev make gcc gnuplot wget

gcc -g udprate.c -o udprate -lpcap

mkdir repo

cd repo

wget https://allen.netstat.org.uk/pub/QUIC-google-meet.pcapng

wget https://allen.netstat.org.uk/pub/youtube+web.pcpng.pcapng

SatnexV_WP21$ ./udprate 
usage: ./udprate <file> <interv_ms> <num_intv> <start_time> <end_time> <label> 

For example:
./udprate repo/youtube+web.pcpng.pcapng 100 10 551 630 1

examines the trace between 551sec and 630sec and creates a CSV file with 11 columns (10 bins plus the label at the end) where each column is a normalized bandwidth measurement over 100ms (so each row contains the traffic profile throughput over 1 second, in this case). The label is the last argument, "1" in this case. This format is ready to be read by sklearn.

You can redirect or append the output to a file to be used as training set, for example:

./udprate repo/youtube+web.pcpng.pcapng 100 10 551 630 1 >> GT.csv

so that when we have enough samples with different labels the algorithm would be able to build a good model.
  
The script run_ML_test.sh automates this. This script takes the binsize and the number of bins as arguments:

./run_ML_test.sh 100 10

The script reads all the entries in "filenames", processes them with udprate and creates a single CSV file called GT.csv with samples from all the traffic traces.
Each entry in "filenames" consists of the file name, a start and end time and a label. Comments and blanks are ignored and the same file name can be entered multiple times for different time periods.

Finally, the file ml_engine.py, processes the file GT.csv with different ML algorithms.
