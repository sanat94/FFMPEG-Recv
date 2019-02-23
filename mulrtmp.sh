#!/bin/bash
ffplay udp://localhost:4000 &
ffplay udp://localhost:4001 &
ffplay udp://localhost:4002 &

while :
do
        ffmpeg -hide_banner -listen 1 -i rtmp://172.16.0.169:1234 -y -vf showinfo -f mpegts udp://localhost:4000 2>> /home/sana/Desktop/RECEIVER/logs/rtmp10-00.txt &
        
	ffmpeg -hide_banner -listen 1 -i rtmp://172.16.0.169:1235 -y -vf showinfo -f mpegts udp://localhost:4001 2>> /home/sana/Desktop/RECEIVER/logs/rtmp10-01.txt &
        
	ffmpeg -hide_banner -listen 1 -i rtmp://172.16.0.169:1236 -y -vf showinfo -f mpegts udp://localhost:4002 2>> /home/sana/Desktop/RECEIVER/logs/rtmp10-02.txt &
        
	wireshark -i eno1 -k -a duration:40 -w /home/sana/Desktop/RECEIVER/pcap/rtmp10.pcap
        echo "done" >> $LOGFILE
done

