#!/bin/bash

sudo ip link add veth255000 type veth peer name veth1
sudo ip -6 addr add 2003:A:E44:CCFF::0/127 dev veth255000
sudo ip link set up dev veth255000

sudo ip -6 r add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::1

sudo ip netns add 255000
sudo ip link set veth1 netns 255000
sudo ip -n 255000 -6 addr add 2003:A:E44:CCFF::1/127 dev veth1
sudo ip -n 255000 link set up dev veth1
sudo ip -n 255000 -6 route add default via 2003:A:E44:CCFF::0

sudo ip link add veth2 type veth peer name veth3
sudo ip link set veth2 netns 255000
sudo ip -n 255000 -6 addr add 2003:A:E44:CCFF::2/127 dev veth2
sudo ip -n 255000 link set up dev veth2
sudo ip -n 255000 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::3

sudo ip netns exec 255000 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255002
sudo ip link set veth3 netns 255002
sudo ip -n 255002 -6 addr add 2003:A:E44:CCFF::3/127 dev veth3
sudo ip -n 255002 link set up dev veth3
sudo ip -n 255002 -6 route add default via 2003:A:E44:CCFF::2

sudo ip link add veth4 type veth peer name veth5
sudo ip link set veth4 netns 255002
sudo ip -n 255002 -6 addr add 2003:A:E44:CCFF::4/127 dev veth4
sudo ip -n 255002 link set up dev veth4
sudo ip -n 255002 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::5

sudo ip netns exec 255002 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255004
sudo ip link set veth5 netns 255004
sudo ip -n 255004 -6 addr add 2003:A:E44:CCFF::5/127 dev veth5
sudo ip -n 255004 link set up dev veth5
sudo ip -n 255004 -6 route add default via 2003:A:E44:CCFF::4

sudo ip link add veth6 type veth peer name veth7
sudo ip link set veth6 netns 255004
sudo ip -n 255004 -6 addr add 2003:A:E44:CCFF::6/127 dev veth6
sudo ip -n 255004 link set up dev veth6
sudo ip -n 255004 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::7

sudo ip netns exec 255004 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255006
sudo ip link set veth7 netns 255006
sudo ip -n 255006 -6 addr add 2003:A:E44:CCFF::7/127 dev veth7
sudo ip -n 255006 link set up dev veth7
sudo ip -n 255006 -6 route add default via 2003:A:E44:CCFF::6

sudo ip link add veth8 type veth peer name veth9
sudo ip link set veth8 netns 255006
sudo ip -n 255006 -6 addr add 2003:A:E44:CCFF::8/127 dev veth8
sudo ip -n 255006 link set up dev veth8
sudo ip -n 255006 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::9

sudo ip netns exec 255006 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255008
sudo ip link set veth9 netns 255008
sudo ip -n 255008 -6 addr add 2003:A:E44:CCFF::9/127 dev veth9
sudo ip -n 255008 link set up dev veth9
sudo ip -n 255008 -6 route add default via 2003:A:E44:CCFF::8

sudo ip link add veth10 type veth peer name veth11
sudo ip link set veth10 netns 255008
sudo ip -n 255008 -6 addr add 2003:A:E44:CCFF::a/127 dev veth10
sudo ip -n 255008 link set up dev veth10
sudo ip -n 255008 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::b

sudo ip netns exec 255008 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255010
sudo ip link set veth11 netns 255010
sudo ip -n 255010 -6 addr add 2003:A:E44:CCFF::b/127 dev veth11
sudo ip -n 255010 link set up dev veth11
sudo ip -n 255010 -6 route add default via 2003:A:E44:CCFF::a

sudo ip link add veth12 type veth peer name veth13
sudo ip link set veth12 netns 255010
sudo ip -n 255010 -6 addr add 2003:A:E44:CCFF::c/127 dev veth12
sudo ip -n 255010 link set up dev veth12
sudo ip -n 255010 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::d

sudo ip netns exec 255010 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255012
sudo ip link set veth13 netns 255012
sudo ip -n 255012 -6 addr add 2003:A:E44:CCFF::d/127 dev veth13
sudo ip -n 255012 link set up dev veth13
sudo ip -n 255012 -6 route add default via 2003:A:E44:CCFF::c

sudo ip link add veth14 type veth peer name veth15
sudo ip link set veth14 netns 255012
sudo ip -n 255012 -6 addr add 2003:A:E44:CCFF::e/127 dev veth14
sudo ip -n 255012 link set up dev veth14
sudo ip -n 255012 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::f

sudo ip netns exec 255012 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255014
sudo ip link set veth15 netns 255014
sudo ip -n 255014 -6 addr add 2003:A:E44:CCFF::f/127 dev veth15
sudo ip -n 255014 link set up dev veth15
sudo ip -n 255014 -6 route add default via 2003:A:E44:CCFF::e

sudo ip link add veth16 type veth peer name veth17
sudo ip link set veth16 netns 255014
sudo ip -n 255014 -6 addr add 2003:A:E44:CCFF::10/127 dev veth16
sudo ip -n 255014 link set up dev veth16
sudo ip -n 255014 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::11

sudo ip netns exec 255014 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255016
sudo ip link set veth17 netns 255016
sudo ip -n 255016 -6 addr add 2003:A:E44:CCFF::11/127 dev veth17
sudo ip -n 255016 link set up dev veth17
sudo ip -n 255016 -6 route add default via 2003:A:E44:CCFF::10

sudo ip link add veth18 type veth peer name veth19
sudo ip link set veth18 netns 255016
sudo ip -n 255016 -6 addr add 2003:A:E44:CCFF::12/127 dev veth18
sudo ip -n 255016 link set up dev veth18
sudo ip -n 255016 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::13

sudo ip netns exec 255016 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255018
sudo ip link set veth19 netns 255018
sudo ip -n 255018 -6 addr add 2003:A:E44:CCFF::13/127 dev veth19
sudo ip -n 255018 link set up dev veth19
sudo ip -n 255018 -6 route add default via 2003:A:E44:CCFF::12

sudo ip link add veth20 type veth peer name veth21
sudo ip link set veth20 netns 255018
sudo ip -n 255018 -6 addr add 2003:A:E44:CCFF::14/127 dev veth20
sudo ip -n 255018 link set up dev veth20
sudo ip -n 255018 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::15

sudo ip netns exec 255018 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255020
sudo ip link set veth21 netns 255020
sudo ip -n 255020 -6 addr add 2003:A:E44:CCFF::15/127 dev veth21
sudo ip -n 255020 link set up dev veth21
sudo ip -n 255020 -6 route add default via 2003:A:E44:CCFF::14

sudo ip link add veth22 type veth peer name veth23
sudo ip link set veth22 netns 255020
sudo ip -n 255020 -6 addr add 2003:A:E44:CCFF::16/127 dev veth22
sudo ip -n 255020 link set up dev veth22
sudo ip -n 255020 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::17

sudo ip netns exec 255020 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255022
sudo ip link set veth23 netns 255022
sudo ip -n 255022 -6 addr add 2003:A:E44:CCFF::17/127 dev veth23
sudo ip -n 255022 link set up dev veth23
sudo ip -n 255022 -6 route add default via 2003:A:E44:CCFF::16

sudo ip link add veth24 type veth peer name veth25
sudo ip link set veth24 netns 255022
sudo ip -n 255022 -6 addr add 2003:A:E44:CCFF::18/127 dev veth24
sudo ip -n 255022 link set up dev veth24
sudo ip -n 255022 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::19

sudo ip netns exec 255022 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255024
sudo ip link set veth25 netns 255024
sudo ip -n 255024 -6 addr add 2003:A:E44:CCFF::19/127 dev veth25
sudo ip -n 255024 link set up dev veth25
sudo ip -n 255024 -6 route add default via 2003:A:E44:CCFF::18

sudo ip link add veth26 type veth peer name veth27
sudo ip link set veth26 netns 255024
sudo ip -n 255024 -6 addr add 2003:A:E44:CCFF::1a/127 dev veth26
sudo ip -n 255024 link set up dev veth26
sudo ip -n 255024 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::1b

sudo ip netns exec 255024 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255026
sudo ip link set veth27 netns 255026
sudo ip -n 255026 -6 addr add 2003:A:E44:CCFF::1b/127 dev veth27
sudo ip -n 255026 link set up dev veth27
sudo ip -n 255026 -6 route add default via 2003:A:E44:CCFF::1a

sudo ip link add veth28 type veth peer name veth29
sudo ip link set veth28 netns 255026
sudo ip -n 255026 -6 addr add 2003:A:E44:CCFF::1c/127 dev veth28
sudo ip -n 255026 link set up dev veth28
sudo ip -n 255026 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::1d

sudo ip netns exec 255026 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255028
sudo ip link set veth29 netns 255028
sudo ip -n 255028 -6 addr add 2003:A:E44:CCFF::1d/127 dev veth29
sudo ip -n 255028 link set up dev veth29
sudo ip -n 255028 -6 route add default via 2003:A:E44:CCFF::1c

sudo ip link add veth30 type veth peer name veth31
sudo ip link set veth30 netns 255028
sudo ip -n 255028 -6 addr add 2003:A:E44:CCFF::1e/127 dev veth30
sudo ip -n 255028 link set up dev veth30
sudo ip -n 255028 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::1f

sudo ip netns exec 255028 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255030
sudo ip link set veth31 netns 255030
sudo ip -n 255030 -6 addr add 2003:A:E44:CCFF::1f/127 dev veth31
sudo ip -n 255030 link set up dev veth31
sudo ip -n 255030 -6 route add default via 2003:A:E44:CCFF::1e

sudo ip link add veth32 type veth peer name veth33
sudo ip link set veth32 netns 255030
sudo ip -n 255030 -6 addr add 2003:A:E44:CCFF::20/127 dev veth32
sudo ip -n 255030 link set up dev veth32
sudo ip -n 255030 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::21

sudo ip netns exec 255030 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255032
sudo ip link set veth33 netns 255032
sudo ip -n 255032 -6 addr add 2003:A:E44:CCFF::21/127 dev veth33
sudo ip -n 255032 link set up dev veth33
sudo ip -n 255032 -6 route add default via 2003:A:E44:CCFF::20

sudo ip link add veth34 type veth peer name veth35
sudo ip link set veth34 netns 255032
sudo ip -n 255032 -6 addr add 2003:A:E44:CCFF::22/127 dev veth34
sudo ip -n 255032 link set up dev veth34
sudo ip -n 255032 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::23

sudo ip netns exec 255032 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255034
sudo ip link set veth35 netns 255034
sudo ip -n 255034 -6 addr add 2003:A:E44:CCFF::23/127 dev veth35
sudo ip -n 255034 link set up dev veth35
sudo ip -n 255034 -6 route add default via 2003:A:E44:CCFF::22

sudo ip link add veth36 type veth peer name veth37
sudo ip link set veth36 netns 255034
sudo ip -n 255034 -6 addr add 2003:A:E44:CCFF::24/127 dev veth36
sudo ip -n 255034 link set up dev veth36
sudo ip -n 255034 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::25

sudo ip netns exec 255034 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255036
sudo ip link set veth37 netns 255036
sudo ip -n 255036 -6 addr add 2003:A:E44:CCFF::25/127 dev veth37
sudo ip -n 255036 link set up dev veth37
sudo ip -n 255036 -6 route add default via 2003:A:E44:CCFF::24

sudo ip link add veth38 type veth peer name veth39
sudo ip link set veth38 netns 255036
sudo ip -n 255036 -6 addr add 2003:A:E44:CCFF::26/127 dev veth38
sudo ip -n 255036 link set up dev veth38
sudo ip -n 255036 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::27

sudo ip netns exec 255036 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255038
sudo ip link set veth39 netns 255038
sudo ip -n 255038 -6 addr add 2003:A:E44:CCFF::27/127 dev veth39
sudo ip -n 255038 link set up dev veth39
sudo ip -n 255038 -6 route add default via 2003:A:E44:CCFF::26

sudo ip link add veth40 type veth peer name veth41
sudo ip link set veth40 netns 255038
sudo ip -n 255038 -6 addr add 2003:A:E44:CCFF::28/127 dev veth40
sudo ip -n 255038 link set up dev veth40
sudo ip -n 255038 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::29

sudo ip netns exec 255038 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255040
sudo ip link set veth41 netns 255040
sudo ip -n 255040 -6 addr add 2003:A:E44:CCFF::29/127 dev veth41
sudo ip -n 255040 link set up dev veth41
sudo ip -n 255040 -6 route add default via 2003:A:E44:CCFF::28

sudo ip link add veth42 type veth peer name veth43
sudo ip link set veth42 netns 255040
sudo ip -n 255040 -6 addr add 2003:A:E44:CCFF::2a/127 dev veth42
sudo ip -n 255040 link set up dev veth42
sudo ip -n 255040 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::2b

sudo ip netns exec 255040 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255042
sudo ip link set veth43 netns 255042
sudo ip -n 255042 -6 addr add 2003:A:E44:CCFF::2b/127 dev veth43
sudo ip -n 255042 link set up dev veth43
sudo ip -n 255042 -6 route add default via 2003:A:E44:CCFF::2a

sudo ip link add veth44 type veth peer name veth45
sudo ip link set veth44 netns 255042
sudo ip -n 255042 -6 addr add 2003:A:E44:CCFF::2c/127 dev veth44
sudo ip -n 255042 link set up dev veth44
sudo ip -n 255042 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::2d

sudo ip netns exec 255042 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255044
sudo ip link set veth45 netns 255044
sudo ip -n 255044 -6 addr add 2003:A:E44:CCFF::2d/127 dev veth45
sudo ip -n 255044 link set up dev veth45
sudo ip -n 255044 -6 route add default via 2003:A:E44:CCFF::2c

sudo ip link add veth46 type veth peer name veth47
sudo ip link set veth46 netns 255044
sudo ip -n 255044 -6 addr add 2003:A:E44:CCFF::2e/127 dev veth46
sudo ip -n 255044 link set up dev veth46
sudo ip -n 255044 -6 route add 2003:A:E44:CCFF::/64 via 2003:A:E44:CCFF::2f

sudo ip netns exec 255044 bash -c "echo 1 > /proc/sys/net/ipv6/conf/all/forwarding"

sudo ip netns add 255046
sudo ip link set veth47 netns 255046
sudo ip -n 255046 -6 addr add 2003:A:E44:CCFF::2f/127 dev veth47
sudo ip -n 255046 link set up dev veth47
sudo ip -n 255046 -6 route add default via 2003:A:E44:CCFF::2e

sudo modprobe dummy
sudo ip -n 255046 link add name lo65535 type dummy
sudo ip -n 255046 -6 addr add 2003:A:E44:CCFF::FFFF/128 dev lo65535
sudo ip -n 255046 link set up dev lo65535

