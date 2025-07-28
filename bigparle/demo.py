################################################################################
# 🤖 DEMO.PY – Gemini Chatbot Terminal App
#
# HOW TO RUN:
#   1. First, run setup.sh once using: ./setup.sh
#   2. Then launch the chatbot anytime using: python3 demo.py
#
# You can exit by typing: exit or quit
################################################################################

import google.generativeai as genai  # ✅ Correct import

# 🔑 Replace with your actual API key
genai.configure(api_key="AIzaSyBWu7cTNXhQreg2hAPyoRd2QA_1r2UOJEk")  # 👈 Replace this with your key

# Load the Gemini model
model = genai.GenerativeModel("gemini-2.5-flash")

# Start a chat session
chat = model.start_chat()

# 🧠 Chat loop
while True:
    prompt = input("You: ")
    if prompt.lower() in ["exit", "quit"]:
        break
    try:
        response = chat.send_message(prompt)
        print("output:", response.text)
    except Exception as e:
        print("⚠️ Error:", e)






