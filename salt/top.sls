base:
  '*':
    - vim
    - epel
    - openldap_client
    - base
  'compute*':
    - compute
    - vim
    - epel
    - openldap_client
  'admin':
    - squid
    - dhcpd
    - tftpd
    - named
  'service001':
    - slurm
