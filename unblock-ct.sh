#!/bin/bash
#Author: Arturo N. Díaz Crespo
#Email:  arturo.havana993@gmail.com
clear
echo "-"
echo "-"
echo "PROXMOX UTILITY for NOT-RESPONDING CONTAINERS"
echo "-"
echo "-"

read -p "Insert the Container ID??: " CID

echo "KILLING LXC MONITOR PROCESS..."

PID=$(ps aux | grep $CID | grep "lxc monitor" | awk '{print $2}')

kill -9 $PID

sleep 5;

echo "STARTING LXC CT VIA LXC-START..."
echo "SOME ERRORS IN THIS STEP IS TOTALLY NORMAL"

sleep 5;

/usr/bin/lxc-start -n $CID

sleep 5;

pct start $CID

echo "STARTING CONTAINER VIA PROXMOX COMMANDS..."

sleep 8;

echo "ALL DONE!!"

echo "NOW, TRY TO USE CONTAINER SERVICES"
