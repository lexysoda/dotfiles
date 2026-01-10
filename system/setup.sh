#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "System configuration setup"
echo "=========================="
echo ""

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run with sudo"
    echo "Usage: sudo $0"
    exit 1
fi

echo "This will install system configurations that require root access."
echo "The following files will be modified:"
echo "  - /etc/pam.d/login  (gnome-keyring auto-unlock)"
echo "  - /etc/pam.d/passwd (keyring password sync)"
echo ""
read -p "Continue? [y/N] " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
fi

echo ""
echo "Backing up existing PAM files..."
cp /etc/pam.d/login /etc/pam.d/login.bak.$(date +%Y%m%d%H%M%S)
cp /etc/pam.d/passwd /etc/pam.d/passwd.bak.$(date +%Y%m%d%H%M%S)

echo "Installing PAM configurations..."
cp "$SCRIPT_DIR/pam.d/login" /etc/pam.d/login
cp "$SCRIPT_DIR/pam.d/passwd" /etc/pam.d/passwd

echo ""
echo "Done! PAM files installed."
echo ""
echo "Next steps (run as regular user):"
echo "  1. Enable SSH agent:  systemctl --user enable gcr-ssh-agent.socket"
echo "  2. Re-login to activate gnome-keyring auto-unlock"
echo "  3. Add SSH keys:      ssh-add ~/.ssh/your_key"
