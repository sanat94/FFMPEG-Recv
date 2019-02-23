#!/bin/bash
ffplay udp://localhost:4000 &
ffplay udp://localhost:4001 &
ffplay udp://localhost:4002 &

while :
do
        ffmpeg -hide_banner -i udp://172.16.0.169:5024 -y -vf showinfo -f mpegts udp://localhost:4000 2>> /home/sana/Desktop/RECEIVER/logs/udp10-00.txt &
        
	ffmpeg -hide_banner -i udp://172.16.0.169:5025 -y -vf showinfo -f mpegts udp://localhost:4001 2>> /home/sana/Desktop/RECEIVER/logs/udp10-01.txt &
        
	ffmpeg -hide_banner -i udp://172.16.0.169:5026 -y -vf showinfo -f mpegts udp://localhost:4002 2>> /home/sana/Desktop/RECEIVER/logs/udp10-02.txt &
        
	wireshark -i eno1 -k -a duration:40 -w /home/sana/Desktop/RECEIVER/pcap/udp10.pcap
        echo "done" >> $LOGFILE
done

