#!/bin/bash

#Remove previous topology
echo "Cleaning docker environment..."
./removeTopo.sh

echo "Creating transponders..."
echo "--- OCTP-1 screen t1 IP 10.100.101.21"
#screen -dmS t1 -T xterm sh -c 'docker run --net=netbr0 --ip=10.100.101.21 --name octp1 -it octmm.img:latest bash'
#sleep 2

#echo "--- OCTP-2 screen t2 IP 10.100.101.22"
#screen -dmS t2 -T xterm sh -c 'docker run --net=netbr0 --ip=10.100.101.22 --name octp2 -it octmm.img:latest bash'
#sleep 2

#echo "--- OCTP-3 screen t3 IP 10.100.101.23"
#screen -dmS t3 -T xterm sh -c 'docker run --net=netbr0 --ip=10.100.101.23 --name octp3 -it octmm.img:latest bash'
#sleep 2

#echo "--- OCTP-4 screen t4 IP 10.100.101.24"
#screen -dmS t4 -T xterm sh -c 'docker run --net=netbr0 --ip=10.100.101.24 --name octp4 -it octmm.img:latest bash'
#sleep 2

echo "Creating ROADMs..."
echo "--- ROADM-1 screen r1 IP 10.100.101.11"
screen -dmS r1 -T xterm sh -c 'docker run --mount type=bind,src=/home/alessio/allegro-sdn/emulator-openroadm/datastore,dst=/usr/local/etc/org-openroadm/datastore --net=netbr0 --ip=10.100.101.11 -p 127.0.0.1:3011:830 --name roadm1 -it tim.it/roadm-9deg:3.0'
sleep 2

echo "--- ROADM-2 screen r2 IP 10.100.101.12"
screen -dmS r2 -T xterm sh -c 'docker run --mount type=bind,src=/home/alessio/allegro-sdn/emulator-openroadm/datastore,dst=/usr/local/etc/org-openroadm/datastore --net=netbr0 --ip=10.100.101.12 -p 127.0.0.1:3012:830 --name roadm2 -it tim.it/roadm-9deg:3.0'
sleep 2

echo "--- ROADM-3 screen r3 IP 10.100.101.13"
screen -dmS r3 -T xterm sh -c 'docker run --mount type=bind,src=/home/alessio/allegro-sdn/emulator-openroadm/datastore,dst=/usr/local/etc/org-openroadm/datastore --net=netbr0 --ip=10.100.101.13 -p 127.0.0.1:3013:830 --name roadm3 -it tim.it/roadm-9deg:3.0'
sleep 2

echo "--- ROADM-4 screen r4 IP 10.100.101.14"
screen -dmS r4 -T xterm sh -c 'docker run --mount type=bind,src=/home/alessio/allegro-sdn/emulator-openroadm/datastore,dst=/usr/local/etc/org-openroadm/datastore --net=netbr0 --ip=10.100.101.14 -p 127.0.0.1:3014:830 --name roadm4 -it tim.it/roadm-9deg:3.0'
sleep 2

echo "Uploading OpenConfig xml schema"
#sudo docker cp ./configTerminalDeviceCNIT40.xml octp1:/confd/examples.confd/OpenConfigTelemetry2.0/
#sudo docker cp ./configTerminalDeviceCNIT40.xml octp2:/confd/examples.confd/OpenConfigTelemetry2.0/
#sudo docker cp ./configTerminalDeviceCNIT40.xml octp3:/confd/examples.confd/OpenConfigTelemetry2.0/
#sudo docker cp ./configTerminalDeviceCNIT40.xml octp4:/confd/examples.confd/OpenConfigTelemetry2.0/
#sleep 2

echo "Uploading Makefile"
#sudo docker cp ./Makefile-TerminalDeviceCNIT40 octp1:/confd/examples.confd/OpenConfigTelemetry2.0/Makefile
#sudo docker cp ./Makefile-TerminalDeviceCNIT40 octp2:/confd/examples.confd/OpenConfigTelemetry2.0/Makefile
#sudo docker cp ./Makefile-TerminalDeviceCNIT40 octp3:/confd/examples.confd/OpenConfigTelemetry2.0/Makefile
#sudo docker cp ./Makefile-TerminalDeviceCNIT40 octp4:/confd/examples.confd/OpenConfigTelemetry2.0/Makefile
#sleep 2

echo "OpenCONFIG netconf agents started"
#sudo screen -S t1 -X stuff './startNetconfAgent.sh\n'
#sudo screen -S t2 -X stuff './startNetconfAgent.sh\n'
#sudo screen -S t3 -X stuff './startNetconfAgent.sh\n'
#sudo screen -S t4 -X stuff './startNetconfAgent.sh\n'
#sleep 2

echo "OpenROADM netconf agents started"
#nothing required here because started at boot
sleep 2

