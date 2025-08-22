#!/bin/bash

# -----------------------------
# Touci Tool Installer
# -----------------------------

echo "🔄 Updating package list..."
sudo apt update -y

echo "📦 Installing required packages..."
sudo apt install -y ffmpeg feh openssh-server

# ✅ Enable and start SSH service
echo "🔑 Enabling and starting SSH..."
sudo systemctl enable ssh
sudo systemctl start ssh

# 📌 Show SSH status
echo "-----------------------------------------"
sudo systemctl status ssh --no-pager | head -n 10
echo "-----------------------------------------"

# Check if touci.sh exists
if [ ! -f touci.sh ]; then
    echo "❌ Error: touci.sh not found in the current directory!"
    exit 1
fi

# Make touci.sh executable
chmod +x touci.sh

echo "-----------------------------------------"
echo "✅ Touci Tool installed successfully!"
echo "👉 Run it with: ./touci.sh"
echo "-----------------------------------------"

