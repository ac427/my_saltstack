{% set services = ['xinetd','tftp'] %} 
install xinetd tftpd and enable services:  
  pkg:
    - installed
    - pkgs:
      - tftp
      - tftp-server
      - xinetd

/etc/xinetd.d/tftp:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://tftpd/files/etc/xinetd.d/tftp

{% for service in services %}
{{service}}:
  service.running:
    - enable: True
    - watch: 
      - file: /etc/xinetd.d/tftp
{% endfor %}
