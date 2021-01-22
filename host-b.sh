echo "----------------------------------------------------"
echo "           Applying network settings"
echo "----------------------------------------------------"

ifconfig enp0s8 down
ip link set enp0s8 name ethernet1
ifconfig ethernet1 up

ip link set ethernet1 up

ip add add 10.20.0.2/25 dev ethernet1       #add IP to ethernet1

ip route add 10.10.0.0/23 via 10.20.0.1     #add generic route to reach host-a network via router-1 (VLAN2 port eth1.2)
ip route add 10.200.0.0/24 via 10.20.0.1    #add generic route to reach router-2 network via router-1 (VLAN2 port eth1.2)
ip route add 10.30.0.0/27 via 10.20.0.1     #add generic route to reach host-c network via router-1 (VLAN2 port eth1.2)

echo "Set ethernet1 of hostB on 10.20.0.2"

echo "----------------------------------------------------"
echo "                      Done!"
echo "----------------------------------------------------"
