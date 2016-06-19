named_pkgs:  
  pkg:
    - installed
    - pkgs:
      - bind
      - bind-utils

  service.running:
    - name: named
    - enable: True
    - require:
      - pkg: named_pkgs

