echo "----------------------------------------------------"
echo "           Applying network settings"
echo "----------------------------------------------------"

ifconfig enp0s8 down
ip link set enp0s8 name ethernet1
ifconfig ethernet1 up

ifconfig enp0s9 down
ip link set enp0s9 name ethernet2
ifconfig ethernet2 up


ip link set ethernet1 up
ip link set ethernet2 up

ip link add link ethernet1 name ethernet1.1 type vlan id 1     #Splitting port ethernet1 in ethernet1.1 and ethernet1.2
ip link add link ethernet1 name ethernet1.2 type vlan id 2     #Splitting port ethernet1 in ethernet1.1 and ethernet1.2

ip link set dev ethernet1.1 up
ip link set dev ethernet1.2 up

ip add add 10.10.0.1/23 dev ethernet1.1                       #add IP to ethernet1.1
ip add add 10.20.0.1/25 dev ethernet1.2                       #add IP to ethernet1.2
ip add add 10.200.0.1/24 dev ethernet2                        #add IP to ethernet2

ip route add 10.10.0.0/23  dev ethernet1.1                    #add route to reach the subnet of host-a
ip route add 10.20.0.0/25  dev ethernet1.2                    #add route to reach the subnet of host-b
ip route add 10.30.0.0/27 via 10.200.0.2 dev ethernet2        #add generic route to reach host-c network via router-2

sysctl -w net.ipv4.ip_forward=1 > /dev/null

echo "Set ethernet1.1 of router1 on 10.10.0.1"
echo "Set ethernet1.2 of router1 on 10.20.0.1"
echo "Set ethernet2 of router1 on 10.200.0.1"

echo "----------------------------------------------------"
echo "                      Done!"
echo "----------------------------------------------------"
