{% from "tftpd/map.jinja" import map with context %}

install packages and enable services:  
  pkg.installed:
    - pkgs: {{ map.pkgs|json }} 
 
{% for service in map.services %} 
enable required services {{ service }} :
  service.running:
    - name: {{ service }}
    - enable: True
    - reload: True
{% endfor %}
  
copy tftpd config file:
  file.managed:
    - name: {{ map.tftp_config }}
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://tftpd/files/etc/xinetd.d/tftp
