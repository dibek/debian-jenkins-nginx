#!/bin/sh
ansible-galaxy install --roles-path ./roles geerlingguy.jenkins
ansible-galaxy install --roles-path ./roles williamyeh.oracle-java
ansible-galaxy install --roles-path ./roles geerlingguy.docker
