tftpd:  
  pkg:
    - installed
    - pkgs:
      - tftp
      - tftp-server
      - xinetd
    - service.running:
    - enable: True

/etc/xinetd.d/tftp:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://tftpd/files/etc/xinetd.d/tftp

