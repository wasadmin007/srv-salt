
pam:
  pkg.installed:
    - name: pam

/etc/security/limits.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://websphere/limits/files/limits.conf
    - require:
      - pkg: pam
