compute_nodes:  
  compute1:
    interfaces: 
      internal:
        dhcp_group: uefi
        mac: 08:00:27:cb:ed:16
      ipmi:
        mac: 08:00:27:cb:ed:17
      ipoib:
        dhcp_group: uefi
        mac: 08:00:27:cb:ed:19
    hostid: 1.101

  compute2:
    interfaces:
      internal:
        dhcp_group: legacy
        mac: 08:00:27:cb:ed:12
      ipmi:
        dhcp_group: uefi
        mac: 08:00:27:cb:ed:13
      ipoib:
        dhcp_group: uefi
        mac: 08:00:27:cb:ed:14
    hostid: 2.102
    
  compute3:
    interfaces:
      internal:
        mac: 08:00:27:cb:ed:09
      ipmi:
        mac: 08:00:27:cb:ed:10
      ipoib:
        mac: 08:00:27:cb:ed:11
    hostid: 3.102
    
