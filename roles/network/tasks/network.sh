#! /usr/bin/env bash

BRIDGE_CHECK_FILE="/opt/lentos/bridgeconfig"
BRIDGE_IN_PLACE=`cat "$BRIDGE_CHECK_FILE"`

if [ ${BRIDGE_IN_PLACE} == "bridgeinplace" ]; then 
    echo "Networking has already been configured"
else 	

# Finds the name of the ethernet device that is getting an IP from DHCP 
    DEVICE=$(route | grep "default" | tr -s " " | cut -d " " -f8) 

    FILE=ifcfg-${DEVICE}

    grep -i "BRIDGE" /etc/sysconfig/network-scripts/${FILE} 
    if [ $? -eq 0 ]; then
        echo "BRIDGE within /etc/sysconfig/network-scripts/${FILE} is in place"
    else
        echo 'BRIDGE="virbr0"' >> /etc/sysconfig/network-scripts/${FILE}
    fi
    
    grep -i "net.ipv4.ip_forward = 1" /etc/sysctl.d/99-ipforward.conf
    if [ $? -eq 0 ]; then
        echo "inet4 ip forward is in place"
    else
        echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.d/99-ipforward.conf
    fi
    
    mkdir -p /opt/lentos
    touch /opt/lentos/bridgeconfig
    echo "bridgeinplace" > /opt/lentos/bridgeconfig

fi

