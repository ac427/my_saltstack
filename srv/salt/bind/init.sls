{% from "bind/map.jinja" import map with context %}
{% set cluster = pillar.get('cluster', {}) -%}

make sure bind is installed:
  pkg.installed:
    - pkgs: {{ map.pkgs|json }}
  service.running:
    - name: {{ map.service }}
    - enable: True
    - reload: True

{% for subnet in cluster['subnets'] %}
copy zone file for {{ cluster['subnets'][subnet]['name'] }}:
  file.managed:
    - name: {{ map.named_working_directory }}/{{ cluster['subnets'][subnet]['file'] }}
    - user: named
    - group: named
    - mode: 444
    - template: jinja
    - source: salt://bind/files/var/named/{{cluster['subnets'][subnet]['file']}}.j2
{% endfor %} 

copy 0.0.127.in-addr.arpa.zone:
  file.managed:
    - name: {{ map.named_working_directory }}/0.0.127.in-addr.arpa.zone
    - user: named
    - group: named
    - mode: 444
    - template: jinja
    - source: salt://bind/files/var/named/0.0.127.in-addr.arpa.zone.j2

copy 16.172.in-addr.arpa.zone:
  file.managed:
    - name: {{ map.named_working_directory }}/16.172.in-addr.arpa.zone
    - user: named
    - group: named
    - mode: 444
    - template: jinja
    - source: salt://bind/files/var/named/16.172.in-addr.arpa.zone.j2

copy localhost.zone:
  file.managed:
    - name: {{ map.named_working_directory }}/localhost.zone
    - user: named
    - group: named
    - mode: 444
    - template: jinja
    - source: salt://bind/files/var/named/localhost.zone.j2


copy the named.conf file:
  file.managed:
    - name: {{ map.config }}
    - user: named
    - group: named
    - mode: 444
    - template: jinja
    - source: salt://bind/files/etc/named.conf.j2
    - check_cmd: named-checkconf 

