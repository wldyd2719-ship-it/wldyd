import os
import cv2
import easyocr
from ultralytics import YOLO

reader = easyocr.Reader(['ko','en'])

# YOLO 모델 로드 (사전 학습된 yolov8n 사용)
model = YOLO("yolov8n.pt")

def is_plate(text):
    text = text.replace(" ", "")
    import re
    pattern = r"[0-9]{2,3}[가-힣][0-9]{4}"
    return re.search(pattern, text) is not None

input_dir = "images(3)/test_car"
output_dir = "output"
os.makedirs(output_dir, exist_ok=True)

for filename in os.listdir(input_dir):
    if not filename.lower().endswith((".jpg", ".png", ".jpeg")):
        continue

    img_path = os.path.join(input_dir, filename)
    img = cv2.imread(img_path)

    # YOLO로 번호판 영역 검출
    results = model.predict(img)

    best_text = ""
    best_box = None

    for r in results:
        for box in r.boxes:
            x1, y1, x2, y2 = map(int, box.xyxy[0])
            crop = img[y1:y2, x1:x2]

            # OCR 수행
            ocr_result = reader.readtext(crop)
            text = "".join([t[1] for t in ocr_result]).replace(" ", "")

            if is_plate(text):
                best_text = text
                best_box = (x1, y1, x2, y2)
                break

    # 결과 출력
    if best_box:
        x1, y1, x2, y2 = best_box
        cv2.rectangle(img, (x1, y1), (x2, y2), (0,255,0), 2)
        cv2.putText(img, best_text, (x1, y1-10),
                    cv2.FONT_HERSHEY_SIMPLEX, 1, (0,255,0), 2)
        print(f"{filename} -> 번호판: {best_text}")
    else:
        print(f"{filename} -> 번호판 못 찾음")

    # 결과 저장
    cv2.imwrite(os.path.join(output_dir, filename), img)
