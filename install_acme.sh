#!/bin/bash

# Function to create a Pac-Man animation
pacman_animation() {
    local text="$1"
    local length=${#text}
    local pacman="C"
    local pellet="•"

    echo -n "$pacman " # Pac-Man starts here
    for ((i = 0; i < length; i++)); do
        echo -n "${text:i:1} "
        sleep 0.1
    done
    echo "" # New line after the animation
}

# Cool ASCII art at the start of the script
ascii_art() {
    echo "    _____                          ____  _               _             "
    echo "   / ____|                        / __ \\| |             (_)            "
    echo "  | |     ___  _ __ ___  _ __    | |  | | |__   ___  ___ _  __ _ _ __  "
    echo "  | |    / _ \\| '_ \` _ \\| '_ \\   | |  | | '_ \\ / _ \\/ __| |/ _\` | '_ \\ "
    echo "  | |___| (_) | | | | | | |_) |  | |__| | | | |  __/ (__| | (_| | | | |"
    echo "   \\_____\\___/|_| |_| |_| .__/    \\____/|_| |_|\\___|\\___|_|\\__,_|_| |_|"
    echo "                        | |                                            "
    echo "                        |_|                                            "
    echo ""
}

# Function for initial download and setup
initial_setup() {
    pacman_animation "Starting the initial setup process..."
    echo "Downloading and installing acme.sh..."
    pacman_animation "Pac-Man is chomping up the acme.sh setup..."
    curl https://get.acme.sh | sh

    pacman_animation "Refreshing terminal session..."
    source ~/.bashrc

    pacman_animation "Setting default Certificate Authority to Let's Encrypt..."
    ~/.acme.sh/acme.sh --set-default-ca --server letsencrypt

    pacman_animation "Initial setup completed! Pac-Man is victorious!"
}

# Function for issuing and deploying certificates
issue_and_deploy() {
    pacman_animation "Starting the issue and deploy process..."
    # Prompt the user for domain and directory
    read -p "Enter your domain (e.g., example.com): " domain
    read -p "Enter the directory where the domain is located: " dir

    pacman_animation "Issuing certificates for $domain and www.$domain..."
    ~/.acme.sh/acme.sh --issue -d $domain -d www.$domain --force -w $dir

    pacman_animation "Deploying certificates for $domain and www.$domain using cPanel UAPI..."
    ~/.acme.sh/acme.sh --deploy --deploy-hook cpanel_uapi --domain $domain --domain www.$domain

    # Check if the previous commands succeeded
    if [ $? -eq 0 ]; then
        pacman_animation "Issue and deploy process completed successfully!"
        pacman_animation "Adding a cron job for automatic renewal and deployment..."
        # Add a crontab entry for automatic renewal
        (crontab -l 2>/dev/null; echo '0 0 * * * "~/.acme.sh"/acme.sh --cron --home "~/.acme.sh" > /dev/null 2>&1') | crontab -
        pacman_animation "Cron job added successfully! Pac-Man approves!"
    else
        pacman_animation "Issue or deploy process failed. Pac-Man is not pleased!"
        exit 1
    fi
}

# Display options to the user
ascii_art
pacman_animation "Please select an option:"
echo "1. Initial download and setup"
echo "2. Issue and deploy certificates"

# Read the user's choice
read -p "Enter your choice (1 or 2): " choice

# Execute the corresponding function based on the user's choice
if [ "$choice" -eq 1 ]; then
    initial_setup
elif [ "$choice" -eq 2 ]; then
    # Skip acme.sh download; proceed with issue and deploy only
    issue_and_deploy
else
    pacman_animation "Invalid choice. Please run the script again and select a valid option."
    exit 1
fi
