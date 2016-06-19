nodes:  
  compute1:
    ip: 172.16.2.101
    netmask: 255.255.0.0
    interface: eth0
    mac: 08:00:27:cb:ed:17
    netid: 2.101

  compute2:
    ip: 172.16.2.102
    netmask: 255.255.0.0
    interface: eth0
    mac: 08:00:27:6a:e1:e7
    netid: 2.102
  
  admin:
    ip: 172.16.1.11
    netmask: 255.255.0.0
    interface: eth0
    mac: 08:00:27:36:00:9b
    CNAME: 
      - master
      -  salt
