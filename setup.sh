#!/bin/bash

################################################################################
# 📜 SETUP.SH – One-Time Gemini Terminal Chatbot Installer for Ubuntu
#
# USAGE:
#   1️⃣ Make this file executable: chmod +x setup.sh
#   2️⃣ Run it once to set everything up: ./setup.sh
#   3️⃣ Then run the chatbot using: ./run.sh
#
# WHAT IT DOES:
#   - Checks for python3
#   - Installs python3-venv (if missing)
#   - Creates a virtual environment (to avoid PEP 668 issues)
#   - Installs google-generativeai SDK inside the venv
################################################################################

# Exit on any error
set -e

# Check if python3 is available
if ! command -v python3 &> /dev/null; then
    echo "❌ python3 not found. Please install it using: sudo apt install python3"
    exit 1
fi

# Check if python3-venv is available
if ! python3 -m venv --help &> /dev/null; then
    echo "📦 python3-venv not found. Installing it now..."
    sudo apt update && sudo apt install -y python3-venv
fi

# Create virtual environment if not already created
if [ ! -d "venv" ]; then
    echo "📁 Creating virtual environment in ./venv ..."
    python3 -m venv venv
fi

# Activate the virtual environment
echo "⚙️ Activating virtual environment..."
source venv/bin/activate

# Upgrade pip to avoid old version warnings
echo "⬆️ Upgrading pip..."
pip install --upgrade pip

# Install Gemini client library
echo "🌐 Installing Gemini Python SDK (google-generativeai)..."
pip install google-generativeai

echo ""
echo "✅ Setup complete!"
echo "👉 You can now start chatting using: ./run.sh"
