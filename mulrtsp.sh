#!/bin/bash
ffplay udp://localhost:4000 &
ffplay udp://localhost:4001 &
ffplay udp://localhost:4002 &

while :
do
        ffmpeg -hide_banner -rtsp_flags listen -i rtsp://172.16.0.169:7000 -y -vf showinfo -f mpegts udp://localhost:4000 2>> /home/sana/Desktop/RECEIVER/logs/rtsp10-00.txt &

        ffmpeg -hide_banner -rtsp_flags listen -i rtsp://172.16.0.169:7001 -y -vf showinfo -f mpegts udp://localhost:4001 2>> /home/sana/Desktop/RECEIVER/logs/rtsp10-01.txt &

        ffmpeg -hide_banner -rtsp_flags listen -i rtsp://172.16.0.169:7002 -y -vf showinfo -f mpegts udp://localhost:4002 2>> /home/sana/Desktop/RECEIVER/logs/rtsp10-02.txt &

        wireshark -i eno1 -k -a duration:40 -w /home/sana/Desktop/RECEIVER/pcap/rtsp10.pcap
        echo "done" >> $LOGFILE
done
          
