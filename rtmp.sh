LOGFILE=rtmp10.log
echo '' > $LOGFILE
STARTTIME=date
echo "Started at `$STARTTIME`" >> $LOGFILE
ffplay -listen 1 rtmp://localhost:1235 &
while :
do
        echo `ffmpeg -hide_banner -re -listen 1 -i rtmp://172.16.0.169:1234 -vf showinfo /home/sana/Desktop/RECEIVER/video/rtmp10.mp4 -f flv rtmp://localhost:1235 2>> /home/sana/Desktop/RECEIVER/logs/rtmp10.txt -y` &
        wireshark -i eno1 -k -a duration:50 -w /home/sana/Desktop/RECEIVER/pcap/rtmp10.pcap
        echo "done" >> $LOGFILE
done

