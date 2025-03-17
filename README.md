# install_acme.sh: Automated SSL Management with Pac-Man Animation 🎮🍒👾

## Overview
`install_acme.sh` is a fun and functional script for automating SSL certificate management for domains hosted on cPanel. It uses the robust `acme.sh` tool to handle SSL certificate issuance, deployment, and automatic renewal with Let's Encrypt. To make it enjoyable, the script features **Pac-Man-inspired animations**, ensuring your tasks are both productive and entertaining!

---

## Features
- **Initial Setup**: Install and configure `acme.sh` with Let's Encrypt as the default Certificate Authority.
- **Issue and Deploy Certificates**: Automatically manage SSL certificates for your main domain and `www` subdomain, deploying them seamlessly through cPanel UAPI.
- **Automatic Renewal**: Sets up a `crontab` job to ensure SSL certificates are renewed and redeployed without any manual effort.
- **Interactive Interface**: Offers a menu-based selection between setup and deployment options.
- **Dynamic Animations**: Pac-Man-style animations guide you through the script's steps, adding a fun visual element to the process.

---

## Requirements
- A server with cPanel hosting.
- User permissions to install tools and configure cron jobs.
- `curl` installed on the system.

---

## Installation and Usage

1. **Download the Script**
   Save the script to your server with the name `install_acme.sh`.

2. **Make the Script Executable**
   Run the following command to make it executable:
   ```bash
   chmod +x install_acme.sh
