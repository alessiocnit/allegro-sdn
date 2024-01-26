#! /bin/bash

echo "Posting openroadm ROADMs..."
onos-netcfg localhost ./allegro_roadm_devices.json
sleep 2

echo "Posting openconfig transponders..."
#onos-netcfg localhost ./allegro_transponder_devices.json
#sleep 2

echo "Posting fiber links..." 
onos-netcfg localhost ./allegro_links.json
