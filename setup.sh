#!/bin/bash

################################################################################
# 📜 SETUP.SH – One-Time Gemini Terminal Chatbot Installer for Ubuntu
#
# HOW TO USE:
#   1. Make it executable: chmod +x setup.sh
#   2. Run it: ./setup.sh
#
# WHAT IT DOES:
#   - Ensures Python 3 is installed
#   - Installs python3-venv if missing
#   - Creates a virtual environment to avoid permission/PEP issues
#   - Installs the Google GenerativeAI SDK
################################################################################

set -e  # Stop if any error occurs

# ✅ Check if python3 exists
if ! command -v python3 &> /dev/null; then
    echo "❌ python3 not found. Please install using: sudo apt install python3"
    exit 1
fi

# ✅ Install venv module if missing
if ! python3 -m venv --help &> /dev/null; then
    echo "📦 Installing python3-venv ..."
    sudo apt update
    sudo apt install -y python3-venv
fi

# ✅ Create virtual environment if not present
if [ ! -d "venv" ]; then
    echo "📁 Creating virtual environment in ./venv ..."
    python3 -m venv venv
fi

# ✅ Activate virtual environment
source venv/bin/activate

# ✅ Upgrade pip
pip install --upgrade pip

# ✅ Install Gemini SDK
pip install google-generativeai

echo ""
echo "✅ All set! Now run the chatbot using: ./run.sh"
