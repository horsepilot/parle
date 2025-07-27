import google.generativeai as genai
#pip install google-generativeai
# Replace with your actual API key
genai.configure(api_key="AIzaSyBWu7cTNXhQreg2hAPyoRd2QA_1r2UOJEk")

model = genai.GenerativeModel("gemini-pro")

chat = model.start_chat()

while True:
    prompt = input("You: ")
    if prompt.lower() in ["exit", "quit"]:
        break
    response = chat.send_message(prompt)
    print("Gemini:", response.text)
