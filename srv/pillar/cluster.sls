cluster:
  domain-name-servers: 172.16.1.11
  next-server: 172.16.1.11

  subnets:
    internal:
      netid: 172.16
      name: eth.cluster
      eth.cluster:
        file: internal.cluster.zone
      zone: 
        name: 16.172.in-addr
        file: 16.172.in-addr.arpa
      network: 172.16.0.0
      netmask: 255.255.0.0
      dhcp_groups:
        - uefi
        - legacy

    ipmi:
      netid: 192.168
      name: ipmi.cluster
      ipmi.cluster:
        file: ipmi.cluster.zone
      zone: 
        name: 16.192.in-addr
        file: 16.192.in-addr.arpa
      network: 192.16.0.0
      netmask: 255.255.0.0
      dhcp_groups:
        - uefi
        - legacy

    ipoib:
      netid: 172.17
      name: ipmi.cluster
      ipmi.cluster:
        file: ipmi.cluster.zone
      zone:
        name: 17.172.in-addr
        file: 17.172.in-addr.arpa
      network: 172.17.0.0
      netmask: 255.255.0.0
      dhcp_groups:
        - uefi
        - legacy
