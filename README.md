# Acme.sh Automation Script

This script automates the installation and setup of acme.sh to issue and deploy SSL certificates using Let's Encrypt for specified domains. It includes setting the default Certificate Authority (CA) to Let's Encrypt and deploying the certificates via cPanel UAPI.

## Prerequisites

- A Unix-based operating system (e.g., Linux, macOS)
- Bash shell
- cPanel with UAPI access
- Internet connection

## Usage

1. Clone or download this repository to your local machine.
2. Navigate to the directory where `install_acme.sh` is located.
3. Make the script executable:
    ```bash
    chmod +x install_acme.sh
    ```
4. Run the script:
    ```bash
    ./install_acme.sh
    ```

## Script Details

The script performs the following steps:

1. Prompts the user for the domain and directory where the domain is located.
2. Installs `acme.sh` from the official source.
3. Sources the `.bashrc` file to refresh the terminal session.
4. Sets the default CA to Let's Encrypt.
5. Issues SSL certificates for the provided domain and its www subdomain.
6. Deploys the certificates using cPanel UAPI.
7. Sets up a cron job to automatically renew the certificates.

## Cron Job

A cron job is automatically set up to renew the certificates. The cron job runs daily at 00:44. You can view or edit the cron job by running:

```bash
crontab -e

