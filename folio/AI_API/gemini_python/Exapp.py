import streamlit as st
import os
import uuid
from dotenv import load_dotenv
from google.genai import Client

# ------------------
# 기본 설정
# ------------------
st.set_page_config(page_title="AI Chat", page_icon="🤖", layout="centered")

load_dotenv()
client = Client(api_key=os.getenv("GEMINI_API_KEY"))

# ------------------
# 캐릭터 프리셋
# ------------------
CHARACTERS = {
    "츤데레 😒": """
너는 츤데레 AI다.
답은 정확하지만 말투는 퉁명스럽다.
귀찮은 듯 말하지만 질문에는 답한다.
한국어로만 말해라.
""",
    "친절한 튜터 😊": """
너는 초보자에게 매우 친절한 튜터다.
어려운 개념은 예시와 함께 단계별로 설명해라.
항상 한국어로 대답해라.
""",
    "시니어 개발자 👨‍💻": """
너는 시니어 개발자다.
불필요한 말은 하지 말고 핵심만 말해라.
실무 관점에서 설명해라.
한국어로 대답해라.
"""
}

# ------------------
# 세션 초기화
# ------------------
if "chats" not in st.session_state:
    chat_id = str(uuid.uuid4())
    st.session_state.chats = {
        chat_id: {
            "character": "츤데레 😒",
            "messages": [
                {"role": "system", "content": CHARACTERS["츤데레 😒"]}
            ]
        }
    }
    st.session_state.current_chat = chat_id

# 🌞 라이트모드로 시작
if "dark_mode" not in st.session_state:
    st.session_state.dark_mode = False

# ------------------
# 테마 색상 + 애니메이션 CSS
# ------------------
if st.session_state.dark_mode:
    bg = "#0f172a"
    panel = "#020617"
    text = "#e5e7eb"
    bubble_user = "#1e293b"
    bubble_ai = "#020617"
else:
    bg = "#f8fafc"
    panel = "#ffffff"
    text = "#020617"
    bubble_user = "#e2e8f0"
    bubble_ai = "#ffffff"

st.markdown(f"""
<style>
* {{
    transition: background-color 0.35s ease,
                color 0.35s ease,
                border-color 0.35s ease;
}}

.stApp {{
    background-color: {bg};
    color: {text};
}}

section[data-testid="stSidebar"] {{
    background-color: {panel};
}}

.block-container {{
    max-width: 900px;
}}

div[data-testid="stChatMessage"]:has(span[data-testid="chatAvatarUser"]) {{
    background-color: {bubble_user};
    border-radius: 12px;
    padding: 10px;
}}

div[data-testid="stChatMessage"]:has(span[data-testid="chatAvatarAssistant"]) {{
    background-color: {bubble_ai};
    border-radius: 12px;
    padding: 10px;
    border: 1px solid #cbd5f5;
}}

.sidebar-footer {{
    position: fixed;
    bottom: 20px;
    left: 20px;
    width: 260px;
    opacity: 0.85;
    font-size: 0.85rem;
}}
</style>
""", unsafe_allow_html=True)

# ------------------
# 사이드바
# ------------------
st.sidebar.title("💬 Chat Menu")

# 새 채팅 생성
if st.sidebar.button("➕ 새 채팅"):
    new_id = str(uuid.uuid4())
    st.session_state.chats[new_id] = {
        "character": "츤데레 😒",
        "messages": [
            {"role": "system", "content": CHARACTERS["츤데레 😒"]}
        ]
    }
    st.session_state.current_chat = new_id
    st.rerun()

# 채팅 선택
chat_ids = list(st.session_state.chats.keys())
selected_chat = st.sidebar.radio(
    "채팅 목록",
    chat_ids,
    index=chat_ids.index(st.session_state.current_chat),
    format_func=lambda x: f"채팅 {chat_ids.index(x) + 1}"
)
st.session_state.current_chat = selected_chat

chat = st.session_state.chats[selected_chat]

# 캐릭터 선택
st.sidebar.markdown("---")
selected_character = st.sidebar.selectbox(
    "🎭 캐릭터",
    list(CHARACTERS.keys()),
    index=list(CHARACTERS.keys()).index(chat["character"])
)

if chat["character"] != selected_character:
    chat["character"] = selected_character
    chat["messages"] = [
        {"role": "system", "content": CHARACTERS[selected_character]}
    ]

# ------------------
# 사이드바 하단 - 다크모드 토글
# ------------------
st.sidebar.markdown('<div class="sidebar-footer">', unsafe_allow_html=True)

new_dark_mode = st.sidebar.toggle(
    "🌙 Dark mode",
    value=st.session_state.dark_mode
)

if new_dark_mode != st.session_state.dark_mode:
    st.session_state.dark_mode = new_dark_mode
    st.rerun()

st.sidebar.markdown('</div>', unsafe_allow_html=True)

# ------------------
# 메인 화면
# ------------------
st.title("🤖 AI Chat")

for msg in chat["messages"]:
    if msg["role"] == "system":
        continue
    with st.chat_message(msg["role"]):
        st.markdown(msg["content"])

# ------------------
# 입력 + 스트리밍 응답
# ------------------
prompt = st.chat_input("메시지를 입력하세요")

if prompt:
    chat["messages"].append(
        {"role": "user", "content": prompt}
    )

    with st.chat_message("user"):
        st.markdown(prompt)

    conversation = ""
    for msg in chat["messages"]:
        conversation += f"[{msg['role'].upper()}]\n{msg['content']}\n\n"

    with st.chat_message("assistant"):
        placeholder = st.empty()
        full_reply = ""

        for chunk in client.models.generate_content_stream(
            model="gemini-2.5-flash",
            contents=conversation
        ):
            if chunk.text:
                full_reply += chunk.text
                placeholder.markdown(full_reply + "▌")

        placeholder.markdown(full_reply)

    chat["messages"].append(
        {"role": "assistant", "content": full_reply}
    )