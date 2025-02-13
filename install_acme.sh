#!/bin/bash

# Prompt the user for domain and directory
read -p "Enter your domain (e.g., example.com): " domain
read -p "Enter the directory where the domain is located: " dir

# Install acme.sh
curl https://get.acme.sh | sh

# Source bashrc to refresh the terminal session
source ~/.bashrc

# Set default CA to Let's Encrypt
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt

# Issue certificates for the provided domain and directory
~/.acme.sh/acme.sh --issue -d $domain -d www.$domain --force -w $dir

# Deploy certificates using cPanel UAPI for the provided domain
~/.acme.sh/acme.sh --deploy --deploy-hook cpanel_uapi --domain $domain --domain www.$domain
