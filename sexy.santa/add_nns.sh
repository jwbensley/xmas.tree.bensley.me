#!/bin/bash

sudo ip link add veth254000 type veth peer name veth1
sudo ip -6 addr add 2003:A:E44:CCFE::0/127 dev veth254000
sudo ip link set up dev veth254000

sudo ip -6 r add 2003:A:E44:CCFE::/64 via 2003:A:E44:CCFE::1

sudo ip netns add 254000
sudo ip link set veth1 netns 254000
sudo ip -n 254000 -6 addr add 2003:A:E44:CCFE::1/127 dev veth1
sudo ip -n 254000 link set up dev veth1
sudo ip -n 254000 -6 route add default via 2003:A:E44:CCFE::0

sudo ip link add veth2 type veth peer name veth3
sudo ip link set veth2 netns 254000
sudo ip -n 254000 -6 addr add 2003:A:E44:CCFE::2/127 dev veth2
sudo ip -n 254000 link set up dev veth2
sudo ip -n 254000 -6 route add 2003:A:E44:CCFE::/64 via 2003:A:E44:CCFE::3

sudo ip netns exec 254000 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 254002
sudo ip link set veth3 netns 254002
sudo ip -n 254002 -6 addr add 2003:A:E44:CCFE::3/127 dev veth3
sudo ip -n 254002 link set up dev veth3
sudo ip -n 254002 -6 route add default via 2003:A:E44:CCFE::2

sudo ip link add veth4 type veth peer name veth5
sudo ip link set veth4 netns 254002
sudo ip -n 254002 -6 addr add 2003:A:E44:CCFE::4/127 dev veth4
sudo ip -n 254002 link set up dev veth4
sudo ip -n 254002 -6 route add 2003:A:E44:CCFE::/64 via 2003:A:E44:CCFE::5

sudo ip netns exec 254002 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 254004
sudo ip link set veth5 netns 254004
sudo ip -n 254004 -6 addr add 2003:A:E44:CCFE::5/127 dev veth5
sudo ip -n 254004 link set up dev veth5
sudo ip -n 254004 -6 route add default via 2003:A:E44:CCFE::4

sudo ip link add veth6 type veth peer name veth7
sudo ip link set veth6 netns 254004
sudo ip -n 254004 -6 addr add 2003:A:E44:CCFE::6/127 dev veth6
sudo ip -n 254004 link set up dev veth6
sudo ip -n 254004 -6 route add 2003:A:E44:CCFE::/64 via 2003:A:E44:CCFE::7

sudo ip netns exec 254004 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 254006
sudo ip link set veth7 netns 254006
sudo ip -n 254006 -6 addr add 2003:A:E44:CCFE::7/127 dev veth7
sudo ip -n 254006 link set up dev veth7
sudo ip -n 254006 -6 route add default via 2003:A:E44:CCFE::6

sudo ip link add veth8 type veth peer name veth9
sudo ip link set veth8 netns 254006
sudo ip -n 254006 -6 addr add 2003:A:E44:CCFE::8/127 dev veth8
sudo ip -n 254006 link set up dev veth8
sudo ip -n 254006 -6 route add 2003:A:E44:CCFE::/64 via 2003:A:E44:CCFE::9

sudo ip netns exec 254006 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 254008
sudo ip link set veth9 netns 254008
sudo ip -n 254008 -6 addr add 2003:A:E44:CCFE::9/127 dev veth9
sudo ip -n 254008 link set up dev veth9
sudo ip -n 254008 -6 route add default via 2003:A:E44:CCFE::8

sudo ip link add veth10 type veth peer name veth11
sudo ip link set veth10 netns 254008
sudo ip -n 254008 -6 addr add 2003:A:E44:CCFE::a/127 dev veth10
sudo ip -n 254008 link set up dev veth10
sudo ip -n 254008 -6 route add 2003:A:E44:CCFE::/64 via 2003:A:E44:CCFE::b

sudo ip netns exec 254008 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 254010
sudo ip link set veth11 netns 254010
sudo ip -n 254010 -6 addr add 2003:A:E44:CCFE::b/127 dev veth11
sudo ip -n 254010 link set up dev veth11
sudo ip -n 254010 -6 route add default via 2003:A:E44:CCFE::a

sudo ip link add veth12 type veth peer name veth13
sudo ip link set veth12 netns 254010
sudo ip -n 254010 -6 addr add 2003:A:E44:CCFE::c/127 dev veth12
sudo ip -n 254010 link set up dev veth12
sudo ip -n 254010 -6 route add 2003:A:E44:CCFE::/64 via 2003:A:E44:CCFE::d

sudo ip netns exec 254010 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 254012
sudo ip link set veth13 netns 254012
sudo ip -n 254012 -6 addr add 2003:A:E44:CCFE::d/127 dev veth13
sudo ip -n 254012 link set up dev veth13
sudo ip -n 254012 -6 route add default via 2003:A:E44:CCFE::c

sudo ip link add veth14 type veth peer name veth15
sudo ip link set veth14 netns 254012
sudo ip -n 254012 -6 addr add 2003:A:E44:CCFE::e/127 dev veth14
sudo ip -n 254012 link set up dev veth14
sudo ip -n 254012 -6 route add 2003:A:E44:CCFE::/64 via 2003:A:E44:CCFE::f

sudo ip netns exec 254012 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 254014
sudo ip link set veth15 netns 254014
sudo ip -n 254014 -6 addr add 2003:A:E44:CCFE::f/127 dev veth15
sudo ip -n 254014 link set up dev veth15
sudo ip -n 254014 -6 route add default via 2003:A:E44:CCFE::e

sudo ip link add veth16 type veth peer name veth17
sudo ip link set veth16 netns 254014
sudo ip -n 254014 -6 addr add 2003:A:E44:CCFE::10/127 dev veth16
sudo ip -n 254014 link set up dev veth16
sudo ip -n 254014 -6 route add 2003:A:E44:CCFE::/64 via 2003:A:E44:CCFE::11

sudo ip netns exec 254014 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 254016
sudo ip link set veth17 netns 254016
sudo ip -n 254016 -6 addr add 2003:A:E44:CCFE::11/127 dev veth17
sudo ip -n 254016 link set up dev veth17
sudo ip -n 254016 -6 route add default via 2003:A:E44:CCFE::10

sudo ip link add veth18 type veth peer name veth19
sudo ip link set veth18 netns 254016
sudo ip -n 254016 -6 addr add 2003:A:E44:CCFE::12/127 dev veth18
sudo ip -n 254016 link set up dev veth18
sudo ip -n 254016 -6 route add 2003:A:E44:CCFE::/64 via 2003:A:E44:CCFE::13

sudo ip netns exec 254016 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 254018
sudo ip link set veth19 netns 254018
sudo ip -n 254018 -6 addr add 2003:A:E44:CCFE::13/127 dev veth19
sudo ip -n 254018 link set up dev veth19
sudo ip -n 254018 -6 route add default via 2003:A:E44:CCFE::12

sudo modprobe dummy
sudo ip -n 254018 link add name lo65535 type dummy
sudo ip -n 254018 -6 addr add 2003:A:E44:CCFE::FFFF/128 dev lo65535
sudo ip -n 254018 link set up dev lo65535

