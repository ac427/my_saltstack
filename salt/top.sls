base:
  '*':
    - vim
    - epel
  'compute*':
    - compute_pkgs
    - vim
    - epel
  'admin':
    - squid
    - dhcpd
    - tftpd
    - named