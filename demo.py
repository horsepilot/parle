import google.generativeai as genai

# Replace with your actual API key
genai.configure(api_key="YOUR_API_KEY")

model = genai.GenerativeModel("gemini-pro")

chat = model.start_chat()

while True:
    prompt = input("You: ")
    if prompt.lower() in ["exit", "quit"]:
        break
    response = chat.send_message(prompt)
    print("Gemini:", response.text)
