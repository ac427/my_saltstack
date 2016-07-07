compute_nodes:  

  admin:
    interfaces: 
      internal:
        dhcp_group: uefi
        mac: 08:00:27:36:00:9b
      ipmi:
        mac: 08:00:27:cb:ad:27
      ipoib:
        dhcp_group: uefi
        mac: 08:00:27:cb:ed:39
 
  compute5:
    interfaces: 
      internal:
        dhcp_group: uefi
        mac: 07:00:27:36:00:9b
      ipmi:
        mac: 07:00:27:cb:ad:27
      ipoib:
        dhcp_group: uefi
        mac: 07:00:27:cb:ed:39
 
  compute1:
    interfaces: 
      internal:
        dhcp_group: uefi
        mac: 08:00:27:cb:ed:17
      ipmi:
        mac: 08:00:27:cb:ad:17
      ipoib:
        dhcp_group: uefi
        mac: 08:00:27:cb:ed:19

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
    
  compute3:
    interfaces:
      internal:
        mac: 08:00:27:cb:ed:09
      ipmi:
        mac: 08:00:27:cb:ed:10
      ipoib:
        mac: 08:00:27:cb:ed:11
