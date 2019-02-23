#!/bin/bash
ffplay udp://localhost:4000 &
ffplay udp://localhost:4001 &
ffplay udp://localhost:4002 &

while :
do
        ffmpeg -hide_banner -i tcp://172.16.0.169:50000?listen -y -vf showinfo -f mpegts udp://localhost:4000 2>> /home/sana/Desktop/RECEIVER/logs/tcp10-00.txt &
	
	ffmpeg -hide_banner -i tcp://172.16.0.169:50001?listen -y -vf showinfo -f mpegts udp://localhost:4001 2>> /home/sana/Desktop/RECEIVER/logs/tcp10-01.txt &
	
	ffmpeg -hide_banner -i tcp://172.16.0.169:50002?listen -y -vf showinfo -f mpegts udp://localhost:4002 2>> /home/sana/Desktop/RECEIVER/logs/tcp10-02.txt &	
        
	wireshark -i eno1 -k -a duration:40 -w /home/sana/Desktop/RECEIVER/pcap/tcp10.pcap
        echo "done" >> $LOGFILE
done

