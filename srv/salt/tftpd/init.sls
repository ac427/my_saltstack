
{% if salt['grains.get']('os') == 'CentOS' %}
include: 
  - tftpd.cenots_init
{% endif %}
