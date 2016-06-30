compute_nodes:  
  compute1:
    interfaces: 
      internal:
        dhcp_group: uefi
        mac: 08:00:27:cb:ed:16
      ipmi:
        mac: 08:00:27:cb:ed:17
      ipoib:
        mac: 08:00:27:cb:ed:19
    hostid: 2.101

  compute2:
    interfaces:
      internal:
        dhcp_group: legacy
        mac: 08:00:27:cb:ed:12
      ipmi:
        mac: 08:00:27:cb:ed:13
      ipoib:
        mac: 08:00:27:cb:ed:14
    hostid: 2.102
  
  compute3:
    interfaces: 
      internal:
        mac: 08:00:27:cb:ed:16
      ipmi:
        mac: 08:00:27:cb:ed:17
      ipoib:
        mac: 08:00:27:cb:ed:19
    hostid: 2.103

  compute4:
    interfaces:
      internal:
        mac: 08:00:27:cb:ed:12
      ipmi:
        mac: 08:00:27:cb:ed:13
      ipoib:
        mac: 08:00:27:cb:ed:14
    hostid: 2.104
