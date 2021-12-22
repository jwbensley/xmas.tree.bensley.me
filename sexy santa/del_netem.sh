#!/bin/bash

sudo tc qdisc del dev veth254000 root
sudo ip netns exec 254000 tc qdisc del dev veth2 root
sudo ip netns exec 254002 tc qdisc del dev veth4 root
sudo ip netns exec 254004 tc qdisc del dev veth6 root
sudo ip netns exec 254006 tc qdisc del dev veth8 root
sudo ip netns exec 254008 tc qdisc del dev veth10 root
sudo ip netns exec 254010 tc qdisc del dev veth12 root
sudo ip netns exec 254012 tc qdisc del dev veth14 root
sudo ip netns exec 254014 tc qdisc del dev veth16 root
