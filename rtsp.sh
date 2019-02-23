LOGFILE=tcp10.log
echo '' > $LOGFILE
STARTTIME=date
echo "Started at `$STARTTIME`" >> $LOGFILE
ffplay -rtsp_flags listen rtsp://localhost:7001 &
while :
do
        echo `ffmpeg -hide_banner -rtsp_flags listen -i rtsp://172.16.0.169:7000 -vf showinfo /home/sana/Desktop/RECEIVER/video/rtsp10.mp4 -f rtsp rtsp://localhost:7001 2>> /home/sana/Desktop/RECEIVER/logs/rtsp10.txt -y` &
        wireshark -i eno1 -k -a duration:50 -w /home/sana/Desktop/RECEIVER/pcap/rtsp10.pcap
        echo "done" >> $LOGFILE
done

