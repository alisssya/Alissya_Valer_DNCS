export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y tcpdump
apt-get install -y openvswitch-common openvswitch-switch apt-transport-https ca-certificates curl software-properties-common

ip link set enp0s8 up
ip link set enp0s9 up
ip link set enp0s10 up

ovs-vsctl add-br Switch
ovs-vsctl add-port Switch enp0s8
ovs-vsctl add-port Switch enp0s9 tag=1
ovs-vsctl add-port Switch enp0s10 tag=2

ip link set Switch up   


