#!/usr/bin/env bash
sudo ansible-playbook --become-user=root server.yml --connection=local
