echo "----------------------------------------------------"
echo "           Applying network settings"
echo "----------------------------------------------------"

ifconfig enp0s8 down
ip link set enp0s8 name ethernet1
ifconfig ethernet1 up

ifconfig enp0s9 down
ip link set enp0s9 name ethernet2
ifconfig ethernet2 up


ip add add 10.30.0.1/27 dev ethernet1                       #add IP to ethernet1
ip add add 10.200.0.2/24 dev ethernet2                      #add IP to ethernet2

ip route add 10.10.0.0/23 via 10.200.0.1 dev ethernet2      #add generic route to reach host-a network via router-1
ip route add 10.20.0.0/25 via 10.200.0.1 dev ethernet2      #add generic route to reach host-b network via router-1

sysctl -w net.ipv4.ip_forward=1 > /dev/null

echo "Set ethernet1 of router2 on 10.30.0.1"
echo "Set ethernet2 of router2 on 10.200.0.2"


echo "----------------------------------------------------"
echo "                      Done!"
echo "----------------------------------------------------"
