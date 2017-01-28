compute_pkgs:  
  pkg:
    - installed
    - pkgs:
      - nano
      - wget
      - munge
      - munge-devel
      - autofs
      - nfs-utils

/etc/ntp.conf:
  file.managed:
    - source: salt://compute/files/etc/ntp.conf

