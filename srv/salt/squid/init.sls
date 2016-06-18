include:
  - epel
squid:
  pkg.installed:
    - require:
      - pkg: epel-release

/etc/squid/squid.conf:
  file.managed:
    - source: salt://squid/files/etc/squid/squid.conf
    - mode: 644
    - user: root
    - group: root
