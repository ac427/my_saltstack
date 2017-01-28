{% from "base/map.jinja" import map with context %}

base pkgs:  
  pkg:
    - installed
    - pkgs:
      - nano
      - wget
      - munge
      - autofs
      - nfs-utils

copy munge key:
  file.managed:
    - name: /etc/munge/munge.key
    - source:
      - salt://base/files/etc/munge/munge.key
    - user: munge
    - group: munge
    - mode: 700

{% for service in map.services %}
enable required services {{ service }} :
  service.running:
    - name: {{ service }}
    - enable: True
    - reload: True
{% endfor %}

/etc/slurm/slurm.conf:
  file.symlink:
    - target: /net/admin/data/slurm.conf
