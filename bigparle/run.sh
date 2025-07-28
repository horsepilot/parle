#!/bin/bash

################################################################################
# ▶️ RUN.SH – Launch the Gemini Terminal Chatbot
#
# HOW TO USE:
#   1. Run setup.sh first
#   2. Then just run: ./run.sh
#
# This will:
#   - Activate the virtual environment
#   - Start the chatbot loop
################################################################################

# ✅ Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "❌ venv not found. Please run ./setup.sh first."
    exit 1
fi

# ✅ Activate virtual environment
source venv/bin/activate

# ✅ Run the chatbot
python3 demo.py
