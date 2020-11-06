#!/bin/bash
function sudocheck () {
  if [[ $EUID -ne 0 ]]; then
    tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔️  You Must Execute as a SUDO USER (with sudo) or as ROOT!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
    exit 0
  fi
}

function clone() {
    sudo git clone -b master --single-branch https://github.com/Hawkinzzz/python-plexlibrary.git   /opt/appdata/python-plexlibrary/
    sudo chown -cR 1000:1000 /opt/appdata/python-plexlibrary/ 1>/dev/null 2>&1
    sudo chmod -cR 755 /opt/appdata/python-plexlibrary/ >> /dev/null 1>/dev/null 2>&1
    cd /opt/appdata/python-plexlibrary/
    sudo pip3 install -r requirements.txt
    cp /opt/appdata/python-plexlibrary/config-template.yml /opt/appdata/python-plexlibrary/config.yml
    }
sudocheck
clone
