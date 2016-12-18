##
##
##
{% for groupname, detail in pillar.get('groups', {}).items() %}
{{ groupname }}:
   group:
     - present 
     - name: {{ groupname }}
     - gid: {{ detail.get('gid','')  }}
{% endfor %}
{% for username, details in pillar.get('users', {}).items() %}
{{ username }}:
 group:
    - present 
    - name: {{ username }}
    - gid: {{ details.get('uid','') }}
 user:
    - present
    - fullname: {{ details.get('fullname','') }}
    - name: {{ username }}
    - shell: /bin/bash
    - home: /home/{{ username }}
    - uid: {{ details.get('uid', '') }}
    - gid: {{ details.get('gid', '') }}
    - password: {{ details.get('crypt','') }}
    {% if 'groups' in details %}
    - groups:
      {% for group in details.get('groups', []) %}
      - {{ group }}
      {% endfor %}
    {% endif %}
{% endfor %}
