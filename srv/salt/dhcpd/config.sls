{% from "dhcpd/map.jinja" import dhcpd with context %}

#/tmp/dhcpd.conf:
/etc/dhcp/dhcpd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://dhcpd/files/etc/dhcp/dhcpd.conf.j2
    - check_cmd: dhcpd -t -cf 
    - context:
        included: False
{{ dhcpd.service }}:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/dhcp/dhcpd.conf

#    - watch:
#      - pkg: dhcp
#    - require:
#      - {{ dhcpd.server }}:
#        pkg:
#          -  installed
