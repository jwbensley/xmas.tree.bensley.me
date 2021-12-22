#!/bin/bash

sudo tc qdisc add dev veth254000 root handle 1: prio
sudo tc qdisc add dev veth254000 parent 1:3 handle 30: netem delay 800ms
sudo tc filter add dev veth254000 protocol ipv6 parent 1:0 prio 1 u32 match u32 0x00000001 0x000000ff at 4 flowid 1:3

sudo ip netns exec 254000 tc qdisc add dev veth2 root handle 1: prio
sudo ip netns exec 254000 tc qdisc add dev veth2 parent 1:3 handle 30: netem delay 800ms
sudo ip netns exec 254000 tc filter add dev veth2 protocol ipv6 parent 1:0 prio 1 u32 match u32 0x00000001 0x000000ff at 4 flowid 1:3

sudo ip netns exec 254002 tc qdisc add dev veth4 root handle 1: prio
sudo ip netns exec 254002 tc qdisc add dev veth4 parent 1:3 handle 30: netem delay 800ms
sudo ip netns exec 254002 tc filter add dev veth4 protocol ipv6 parent 1:0 prio 1 u32 match u32 0x00000001 0x000000ff at 4 flowid 1:3

sudo ip netns exec 254004 tc qdisc add dev veth6 root handle 1: prio
sudo ip netns exec 254004 tc qdisc add dev veth6 parent 1:3 handle 30: netem delay 250ms
sudo ip netns exec 254004 tc filter add dev veth6 protocol ipv6 parent 1:0 prio 1 u32 match u32 0x00000001 0x000000ff at 4 flowid 1:3

sudo ip netns exec 254006 tc qdisc add dev veth8 root handle 1: prio
sudo ip netns exec 254006 tc qdisc add dev veth8 parent 1:3 handle 30: netem delay 250ms
sudo ip netns exec 254006 tc filter add dev veth8 protocol ipv6 parent 1:0 prio 1 u32 match u32 0x00000001 0x000000ff at 4 flowid 1:3

sudo ip netns exec 254008 tc qdisc add dev veth10 root handle 1: prio
sudo ip netns exec 254008 tc qdisc add dev veth10 parent 1:3 handle 30: netem delay 800ms
sudo ip netns exec 254008 tc filter add dev veth10 protocol ipv6 parent 1:0 prio 1 u32 match u32 0x00000001 0x000000ff at 4 flowid 1:3

sudo ip netns exec 254010 tc qdisc add dev veth12 root handle 1: prio
sudo ip netns exec 254010 tc qdisc add dev veth12 parent 1:3 handle 30: netem delay 800ms
sudo ip netns exec 254010 tc filter add dev veth12 protocol ipv6 parent 1:0 prio 1 u32 match u32 0x00000001 0x000000ff at 4 flowid 1:3

sudo ip netns exec 254012 tc qdisc add dev veth14 root handle 1: prio
sudo ip netns exec 254012 tc qdisc add dev veth14 parent 1:3 handle 30: netem delay 800ms
sudo ip netns exec 254012 tc filter add dev veth14 protocol ipv6 parent 1:0 prio 1 u32 match u32 0x00000001 0x000000ff at 4 flowid 1:3

sudo ip netns exec 254014 tc qdisc add dev veth16 root handle 1: prio
sudo ip netns exec 254014 tc qdisc add dev veth16 parent 1:3 handle 30: netem delay 250ms
sudo ip netns exec 254014 tc filter add dev veth16 protocol ipv6 parent 1:0 prio 1 u32 match u32 0x00000001 0x000000ff at 4 flowid 1:3
