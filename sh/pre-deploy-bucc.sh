#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install direnv jq software-properties-common build-essential -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt update
sudo apt install certbot python3-certbot-dns-cloudflare -y
sudo apt autoremove -y



if grep -q direnv ~/.bashrc ;then
  echo "Direnv already setup"
else
  echo "#Direnv loading here:" >> ~/.bashrc
  echo -e "$(direnv hook bash)" | tee -a ~/.bashrc
fi
