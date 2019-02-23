LOGFILE=tcp10.log
echo '' > $LOGFILE
STARTTIME=date
echo "Started at `$STARTTIME`" >> $LOGFILE
ffplay tcp://localhost:60000?listen &
while :
do
	echo `ffmpeg -hide_banner -i tcp://172.16.0.169:50000?listen -vf showinfo /home/sana/Desktop/RECEIVER/video/tcp10.mp4 -f mpegts tcp://localhost:60000 2>> /home/sana/Desktop/RECEIVER/logs/tcp10.txt -y` &
	wireshark -i eno1 -k -a duration:50 -w /home/sana/Desktop/RECEIVER/pcap/tcp10.pcap 
	echo "done" >> $LOGFILE
done
