#!/bin/bash -xe
exec > > (tee var/log/cloud-init-output.log|logger -t user-data -s 2>/dev/console)2>&1

yum install -y python37
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
git clone https://github.com/eloyvega/bootcamp-module-devops.git
cd ~/bootcamp-module-devops/backend/
pip install -r requirements.txt
nohup gunicorn -w 3 -b 0.0.0.0:8000 app:app &