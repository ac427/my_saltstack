#/tmp/dhcpd.conf:
/etc/named.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://named/files/etc/named.conf.j2

named:
  service.running:
    - enable: True
    - restart: True
