import cv2
import numpy as np
import easyocr
import re
from PIL import ImageFont, ImageDraw, Image
while True:

    reader = easyocr.Reader(['ko','en'])

    def is_plate(text):
        text = text.replace(" ", "")
        pattern = r"[0-9]{2,3}[가-힣][0-9]{4}"
        return re.search(pattern, text) is not None

    no = int(input("차량 영상 번호( 0:종료 ) : "))  # 차량 번호 입력
    if no == 0: break

    fname = "images(3)/test_car/{0:02d}.jpg".format(no)
    image = cv2.imread(fname, cv2.IMREAD_COLOR)

    results = reader.readtext(image)

    best_text = ""
    best_box = None

    for bbox, text, prob in results:
        if is_plate(text):
            best_text = text
            best_box = np.array(bbox)
            break

    if best_box is not None:
        pts = best_box.astype(int)

        # OpenCV로 사각형만 그리기
        for i in range(4):
            cv2.line(image, tuple(pts[i]), tuple(pts[(i+1)%4]), (0,255,0), 2)

        # Pillow로 한글 텍스트 넣기
        img_pil = Image.fromarray(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))
        draw = ImageDraw.Draw(img_pil)

        font_path = "C:/Windows/Fonts/malgun.ttf"   # 윈도우 기본 한글 폰트
        font = ImageFont.truetype(font_path, 40)

        draw.text((pts[0][0], pts[0][1]-50), best_text, font=font, fill=(0,255,0))

        image = cv2.cvtColor(np.array(img_pil), cv2.COLOR_RGB2BGR)

        print("번호판 인식 결과:", best_text)

    else:
        print("번호판을 찾지 못했습니다.")

    cv2.imshow("result", image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()