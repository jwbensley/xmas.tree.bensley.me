#!/bin/bash

sudo ip -6 r del 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::1
sudo ip link del veth255000

sudo ip netns exec 255000 ip link del veth2
sudo ip netns del 255000

sudo ip netns exec 255002 ip link del veth4
sudo ip netns del 255002

sudo ip netns exec 255004 ip link del veth6
sudo ip netns del 255004

sudo ip netns exec 255006 ip link del veth8
sudo ip netns del 255006

sudo ip netns exec 255008 ip link del veth10
sudo ip netns del 255008

sudo ip netns exec 255010 ip link del veth12
sudo ip netns del 255010

sudo ip netns exec 255012 ip link del veth14
sudo ip netns del 255012

sudo ip netns exec 255014 ip link del veth16
sudo ip netns del 255014

sudo ip netns exec 255016 ip link del veth18
sudo ip netns del 255016

sudo ip netns exec 255018 ip link del veth20
sudo ip netns del 255018

sudo ip netns exec 255020 ip link del veth22
sudo ip netns del 255020

sudo ip netns exec 255022 ip link del veth24
sudo ip netns del 255022

sudo ip netns exec 255024 ip link del veth26
sudo ip netns del 255024

sudo ip netns exec 255026 ip link del veth28
sudo ip netns del 255026

sudo ip netns exec 255028 ip link del veth30
sudo ip netns del 255028

sudo ip netns exec 255030 ip link del veth32
sudo ip netns del 255030

sudo ip netns exec 255032 ip link del veth34
sudo ip netns del 255032

sudo ip netns exec 255034 ip link del veth36
sudo ip netns del 255034

sudo ip netns exec 255036 ip link del veth38
sudo ip netns del 255036

sudo ip netns exec 255038 ip link del veth40
sudo ip netns del 255038

sudo ip netns exec 255040 ip link del veth42
sudo ip netns del 255040

sudo ip netns exec 255042 ip link del veth44
sudo ip netns del 255042

sudo ip netns exec 255044 ip link del veth46
sudo ip netns del 255044

sudo ip netns exec 255046 ip link del veth48
sudo ip netns del 255046

