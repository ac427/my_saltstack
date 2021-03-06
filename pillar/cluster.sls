cluster:
  domain-name-servers: 172.16.0.1
  next-server: 172.16.0.1
  name-server: admin.internal.cluster

  subnets:
    internal:
      name: internal.cluster
      file: internal.cluster.zone
      network: 172.16.0.0
      range_start: 0
      netmask: 255.255.192.0
      broadcast: 172.16.63.255
      total_ipv4: 16384
      dhcp_groups:
        - uefi
        - legacy

    ipmi:
      name: ipmi.cluster
      file: ipmi.cluster.zone
      network: 172.16.64.0
      range_start: 64
      netmask: 255.255.192.0
      broadcast: 172.16.127.255
      total_ipv4: 16384
      dhcp_groups:
        - uefi
        - legacy

    ipoib:
      name: ipoib.cluster
      file: ipoib.cluster.zone
      network: 172.16.128.0
      range_start: 128
      netmask: 255.255.192.0
      broadcast: 172.16.0.1.255
      total_ipv4: 16384
      dhcp_groups:
        - uefi
        - legacy
