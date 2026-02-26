import cv2
import numpy as np
import re
from ultralytics import YOLO
from paddleocr import PaddleOCR

# YOLO 모델 불러오기 (번호판 탐지용 best.pt)
model = YOLO("best.pt")

# PaddleOCR 불러오기 (한국어+영어)
ocr = PaddleOCR(lang="korean", use_angle_cls=True)

# 번호판 패턴 검사 함수
def is_plate(text):
    text = text.replace(" ", "")
    pattern = r"[0-9]{2,3}[가-힣][0-9]{4}"
    return re.search(pattern, text) is not None

while True:
    no = int(input("차량 영상 번호( 0:종료 ) : "))
    if no == 0:
        break

    fname = f"images(3)/test_car/{no:02d}.jpg"
    image = cv2.imread(fname)

    if image is None:
        print("파일을 찾을 수 없습니다:", fname)
        continue

    # YOLO 탐지
    results = model.predict(image, conf=0.25, imgsz=1024)

    plate_found = False

    for r in results:
        for box in r.boxes:
            x1, y1, x2, y2 = map(int, box.xyxy[0])

            plate_img = image[y1:y2, x1:x2]

            # OCR 수행
            ocr_result = ocr.ocr(plate_img, cls=True)

            # OCR 결과에서 텍스트만 추출
            for line in ocr_result:
                text = line[1][0]
                prob = line[1][1]

                print("OCR raw:", text, "확률:", prob)

                if is_plate(text):
                    plate_found = True

                    # 사각형 표시
                    cv2.rectangle(image, (x1, y1), (x2, y2), (0,255,0), 2)
                    cv2.putText(image, text, (x1, y1-10),
                                cv2.FONT_HERSHEY_SIMPLEX, 1, (0,255,0), 2)

    if plate_found:
        print("번호판 인식 성공!")
    else:
        print("번호판을 찾지 못했습니다.")

    cv2.imshow("result", image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
