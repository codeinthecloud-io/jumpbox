#!/bin/bash
sudo apt update
sudo apt install jq software-properties-common -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt update
sudo apt install certbot python3-certbot-dns-cloudflare -y