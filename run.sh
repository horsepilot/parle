#!/bin/bash

# 📜 RUN.SH – Start Gemini Terminal Chatbot
#
# USAGE:
#   Just run this file after you've completed setup.sh:
#     ./run.sh
#
# This will:
#   ✅ Activate the virtual environment
#   ✅ Run chatbot.py in the same terminal

# Check if venv folder exists
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found. Please run ./setup.sh first."
    exit 1
fi

# Activate the virtual environment
source venv/bin/activate

# Run the chatbot script
python3 demo.py
