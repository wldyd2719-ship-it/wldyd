import openai

# OpenAI API 키 설정 (본인의 키 입력)
client = openai.OpenAI(api_key="YOUR_API_KEY_HERE")

def python_tutor_chatbot():
    # 대화 기록 저장 (System Prompt로 역할 고정)
    messages = [
        {"role": "system", "content": "당신은 친절하고 실력이 뛰어난 '파이썬 학습 도우미' 멘토입니다. 입문자의 눈높이에서 설명하며, 코드 예시를 반드시 포함해 답변하세요."}
    ]
    
    print("🤖 파이썬 학습 도우미 챗봇입니다! 무엇이든 물어보세요 (종료: '종료')")

    while True:
        user_input = input("\n나: ")
        if user_input == "종료": break
        
        messages.append({"role": "user", "content": user_input})
        
        try:
            # API 호출
            response = client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=messages
            )
            
            answer = response.choices[0].message.content
            print(f"\n멘토: {answer}")
            
            # 대화 맥락 유지를 위해 답변 저장
            messages.append({"role": "assistant", "content": answer})
            
        except Exception as e:
            print(f"⚠️ 오류가 발생했습니다: {e}")
            break

if __name__ == "__main__":
    python_tutor_chatbot()