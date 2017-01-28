{% from "ntpd/map.jinja" import map with context %}

base pkgs:  
  pkg:
    - installed
    - pkgs:
      - nfpd


{% for service in map.services %}
enable required services {{ service }} :
  service.running:
    - name: {{ service }}
    - enable: True
    - reload: True
{% endfor %}

copy ntpd config file:
  file.managed:
    - name: /etc/ntp.conf
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://ntpd/files/etc/ntp.conf
