#!/bin/bash
set -e
echo "[install_dependencies] starting"

# update & basic tools
yum update -y
sudo yum install -y ruby wget unzip curl --allowerasing

# install AWS CLI v2 if not present
if ! command -v aws >/dev/null 2>&1; then
  echo "[install_dependencies] installing AWS CLI v2"
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
  unzip /tmp/awscliv2.zip -d /tmp
  /tmp/aws/install
fi

# make sure app directory exists
mkdir -p /home/ec2-user/app
chown -R ec2-user:ec2-user /home/ec2-user/app

echo "[install_dependencies] done"
