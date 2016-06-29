cluster:
  domain-name-servers: 172.16.1.11
  next-server: 172.16.1.11
  internal: 172.16
  ipmi: 192.16

  zones:
    internal:
      eth.cluster:
        file: internal.cluster.zone
      16.172.in-addr:
        file: 16.172.in-addr.arpa
      netmask: 255.255.0.0
      network: 172.16.0.0
      domain-name: internal.cluster

    ipmi:
      ipmi.cluster:
        file: ipmi.cluster.zone
      16.172.in-addr:
        file: 16.192.in-addr.arpa
      netmask: 255.255.0.0
      network: 192.16.0.0
      domain-name: ipmi.cluster
