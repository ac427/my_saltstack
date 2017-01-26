{% from "dhcpd/map.jinja" import dhcpd with context %}

make sure dhcpd is installed:
  pkg.installed:
    - name: {{ dhcpd.server }}
  service.running:
    - name: {{ dhcpd.service }}
    - enable: True
    - require:
      - pkg: {{ dhcpd.server }}
    - restart: True
    - watch:
      - file: /etc/dhcp/dhcpd.conf
  file.managed:
    - name: {{ dhcpd.config }}
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://dhcpd/files/etc/dhcp/dhcpd.conf.j2
    - check_cmd: dhcpd -t
