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

examines the trace between 551sec and 630sec and creates a CSV file with 11 columns (10 bins plus the label at the end) where each column is 100ms. The label is the last argument, "1" in this case. This format is ready to be read by sklearn.
