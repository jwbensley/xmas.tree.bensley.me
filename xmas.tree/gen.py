#!/usr/bin/env python3

data = {
    "ipv6_prefix": "2003:A:E44:CCFF::",
    "veth_idx": 0,
    "netns_idx": 255000,
}
loop_count = 23 # Needs to be one longer than required
provision_file = "add_nns.sh"
removal_file = "del_nns.sh"


with open(provision_file, "w") as f:
    f.write(
        "#!/bin/bash\n\n"
        f"sudo ip link add veth{data['netns_idx']} type veth peer name veth{data['veth_idx'] + 1}\n"
        f"sudo ip -6 addr add {data['ipv6_prefix']}{data['veth_idx']:x}/127 dev veth{data['netns_idx']}\n"
        f"sudo ip link set up dev veth{data['netns_idx']}\n"
        "\n"
        f"sudo ip -6 r add {data['ipv6_prefix']}/64 via {data['ipv6_prefix']}1\n"
        "\n"
    )
    data['veth_idx'] += 1

    for i in range(0, loop_count):
        f.write(
            f"sudo ip netns add {data['netns_idx']}\n"
            f"sudo ip link set veth{data['veth_idx']} netns {data['netns_idx']}\n"
            f"sudo ip -n {data['netns_idx']} -6 addr add {data['ipv6_prefix']}{data['veth_idx']:x}/127 dev veth{data['veth_idx']}\n"
            f"sudo ip -n {data['netns_idx']} link set up dev veth{data['veth_idx']}\n"
            f"sudo ip -n {data['netns_idx']} -6 route add default via {data['ipv6_prefix']}{data['veth_idx'] -1:x}\n"
            "\n"
            f"sudo ip link add veth{data['veth_idx'] + 1} type veth peer name veth{data['veth_idx'] + 2}\n"
            f"sudo ip link set veth{data['veth_idx'] + 1} netns {data['netns_idx']}\n"
            f"sudo ip -n {data['netns_idx']} -6 addr add {data['ipv6_prefix']}{data['veth_idx'] + 1:x}/127 dev veth{data['veth_idx'] + 1}\n"
            f"sudo ip -n {data['netns_idx']} link set up dev veth{data['veth_idx'] + 1}\n"
            f"sudo ip -n {data['netns_idx']} -6 route add {data['ipv6_prefix']}/64 via {data['ipv6_prefix']}{data['veth_idx'] + 2:x}\n"
            "\n"
            f"sudo ip netns exec {data['netns_idx']} bash -c \"echo 1 > /proc/sys/net/ipv6/conf/all/forwarding\"\n"
            "\n"
        )
        data['veth_idx'] += 2
        data['netns_idx'] += 2

    f.write(
        f"sudo ip netns add {data['netns_idx']}\n"
        f"sudo ip link set veth{data['veth_idx']} netns {data['netns_idx']}\n"
        f"sudo ip -n {data['netns_idx']} -6 addr add {data['ipv6_prefix']}{data['veth_idx']:x}/127 dev veth{data['veth_idx']}\n"
        f"sudo ip -n {data['netns_idx']} link set up dev veth{data['veth_idx']}\n"
        f"sudo ip -n {data['netns_idx']} -6 route add default via {data['ipv6_prefix']}{data['veth_idx'] - 1:x}\n"
        "\n"
        f"sudo modprobe dummy\n"
        f"sudo ip -n {data['netns_idx']} link add name lo65535 type dummy\n"
        f"sudo ip -n {data['netns_idx']} -6 addr add {data['ipv6_prefix']}FFFF/128 dev lo65535\n"
        f"sudo ip -n {data['netns_idx']} link set up dev lo65535\n"
        "\n"
    )

print(f"Provisioning commands written to {provision_file}")


# Reset values
data['veth_idx'] = 0
data['netns_idx'] = 255000

with open(removal_file, "w") as f:

    f.write(
        "#!/bin/bash\n\n"
        f"sudo ip -6 r del {data['ipv6_prefix']}/64 via {data['ipv6_prefix']}1\n"
        f"sudo ip link del veth{data['netns_idx']}\n"
        "\n"
    )
    data['veth_idx'] += 2

    for i in range(0, loop_count + 1):
        f.write(
            f"sudo ip netns exec {data['netns_idx']} ip link del veth{data['veth_idx']}\n"
            f"sudo ip netns del {data['netns_idx']}\n"
            "\n"
        )
        data['veth_idx'] += 2
        data['netns_idx'] += 2

print(f"Removal command written to {removal_file}")
