sudo:
  pkg:
    - installed

/tmp/01_rc:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://sudoers/files/etc/sudoers.d/01_rc.j2
    - context:
        included: False
    - require:
      - pkg: sudo


/etc/sudoers.d/01_rc:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://sudoers/files/etc/sudoers.d/01_rc.j2
    - check_cmd: visudo -c -f
    - context:
        included: False
    - require:
      - pkg: sudo
