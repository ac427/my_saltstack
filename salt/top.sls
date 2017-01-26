base:
  '*':
    - vim
    - epel
    - openldap_client
  'compute*':
    - compute_pkgs
    - vim
    - epel
    - openldap_client
  'admin':
    - squid
    - dhcpd
    - tftpd
    - named
