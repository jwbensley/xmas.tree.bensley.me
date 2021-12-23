#!/bin/bash

sudo ip -6 r del 2003:A:E44:CCFE::/64 via 2003:A:E44:CCFE::1
sudo ip link del veth254000

sudo ip netns exec 254000 ip link del veth2
sudo ip netns del 254000

sudo ip netns exec 254002 ip link del veth4
sudo ip netns del 254002

sudo ip netns exec 254004 ip link del veth6
sudo ip netns del 254004

sudo ip netns exec 254006 ip link del veth8
sudo ip netns del 254006

sudo ip netns exec 254008 ip link del veth10
sudo ip netns del 254008

sudo ip netns exec 254010 ip link del veth12
sudo ip netns del 254010

sudo ip netns exec 254012 ip link del veth14
sudo ip netns del 254012

sudo ip netns exec 254014 ip link del veth16
sudo ip netns del 254014

sudo ip netns exec 254016 ip link del veth18
sudo ip netns del 254016

sudo ip netns exec 254018 ip link del veth20
sudo ip netns del 254018

