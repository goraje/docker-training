#!/bin/bash

if [[ ! -z ${https_proxy} ]]; then
    >&2 echo "=== MODIFYING SUDOERS FILE ==="
    echo -e 'Defaults env_keep += "http_proxy https_proxy"' | tee -a /etc/sudoers
fi

>&2 echo "=== PERFORMING GLOBAL SYSTEM UPDATE ==="
pacman -Syu --noconfirm

>&2 echo "=== INSTALLING REFLECTOR ==="
pacman -S --noconfirm reflector

>&2 echo "=== RANKING MIRRORS ==="
reflector --latest 20 --verbose --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist

>&2 echo "=== SYNCING THE DATABASES ==="
pacman -Syy --noconfirm

>&2 echo "=== INSTALLING BASIC DEVELOPMENT TOOLS"
pacman -S --noconfirm base-devel git python-pip

>&2 echo "=== INSTALLING ANSIBLE ==="
pip install ansible
