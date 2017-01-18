{% from "openldap_client/map.jinja" import openldap_client with context %}

make sure all pkgs are installed:
  pkg.installed:
    - pkgs: {{ openldap_client.pkgs|json }}

authconfig --enableldap --enableldapauth --ldapserver=admin.internal.cluster --ldapbasedn="dc=cm,dc=cluster" --enablemkhomedir --update :
  cmd.run:
    - creates: /root/.ldap
