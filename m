
---
- hosts: 172.31.21.9 
  become: yes
  tasks:
  - include_tasks: myfile.yml

  - name: i want to install webserver
    apt:
      name: apache2
      state: present
    notify: restartwebserver

  - name: i want to copy index file into ansible node
    template:
      src: myindex.j2
      dest: /var/www/html/index.html
    notify: restartwebserver


  handlers:
  - name: restartwebserver
    service:
      name: apache2
      state: restarted