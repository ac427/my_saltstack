{% from "tftpd/map.jinja" import map with context %}
{% set compute_nodes = pillar.get('compute_nodes', {}) -%}
{% set tftphost =  pillar.get('reinstallnode') %}
{% set tftphost_mac = compute_nodes[tftphost]['interfaces']['internal']['mac'] %}

generate boot file for host {{ tftphost }}:
  file.managed:
    - name: {{ map.pxe_cfg }}/01-{{ tftphost_mac|replace(":","-") }}
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://tftpd/files/var/lib/tftpboot/pxelinux.cfg/install
