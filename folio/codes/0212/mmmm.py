import cv2
from hyperlpr3 import LPR

lpr = LPR("hyperlpr3/models")

# 이미지 파일 입력
img = cv2.imread("images(3)/test_car/05.jpg")

if img is None:
    raise Exception("이미지 로드 실패")

# 인식 수행
results = lpr.plate_recognition(img)

print("인식 결과:", results)

# 결과 출력용
for r in results:
    plate_text = r[0]   # 인식된 번호판 문자열
    confidence = r[1]   # 신뢰도
    box = r[2]          # 좌표

    print("번호판:", plate_text, "신뢰도:", confidence)

    # 사각형 그리기
    x1, y1, x2, y2 = box
    cv2.rectangle(img, (x1, y1), (x2, y2), (0,255,0), 2)
    cv2.putText(img, plate_text, (x1, y1-10),
                cv2.FONT_HERSHEY_SIMPLEX, 1, (0,255,0), 2)

cv2.imshow("result", img)
cv2.waitKey(0)
cv2.destroyAllWindows()
