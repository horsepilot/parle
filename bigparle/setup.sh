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
#   - Creates a virtual environment
#   - Installs the Google GenerativeAI SDK inside the venv
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

# ✅ Install packages inside venv without activating shell
echo "📦 Installing dependencies ..."
venv/bin/pip install --upgrade pip
venv/bin/pip install google-generativeai python-dotenv

echo ""
echo "✅ Setup complete!"
echo ""
echo "💡 To start using the chatbot:"
echo "   1. Activate the virtual environment:"
echo "      source venv/bin/activate"
echo "   2. Run the chatbot:"
echo "      ./run.sh"
