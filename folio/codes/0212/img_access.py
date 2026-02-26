import numpy as np, cv2, time
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm

font_path = "C:/Windows/Fonts/malgun.ttf"
font_name = fm.FontProperties(fname=font_path).get_name()
mpl.rcParams['font.family'] = font_name
mpl.rcParams['axes.unicode_minus'] = False


def pixel_access1(image):
    image1 = np.zeros(image.shape[:2], image.dtype)
    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            pixel = image[i,j]
            image1[i, j] = 255 - pixel
    return image1

def pixel_access2(image):
    image2 = np.zeros(image.shape[:2], image.dtype)
    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            pixel = image.item(i, j)
            image2[i, j] = 255 - pixel
    return image2

def pixel_access3(image):
    lut = [255- i for i in range(256)]
    lut = np.array(lut, np.uint8)
    image3 = lut[image]
    return image3

def pixel_access4(image):
    image4 = cv2.subtract(255, image)
    return image4

def pixel_access5(image):
    image5 = 255 - image
    return image5

image = cv2.imread("images (2)/bright.jpg", cv2.IMREAD_GRAYSCALE)
if image is None: raise Exception("영상파일 읽기 오류")


# 한글 폰트 설정 (Windows 기본 한글 폰트)
mpl.rcParams['font.family'] = 'Malgun Gothic'

# 마이너스 깨짐 방지
mpl.rcParams['axes.unicode_minus'] = False

def time_check(func, msg):
    start_time = time.perf_counter()
    ret_img = func(image)
    elapsed = (time.perf_counter() - start_time) * 1000
    print(msg, "수행시간: %0.2fms" % elapsed)
    return ret_img

image1 = time_check(pixel_access1, "[방법1] 직접 접근 방식")
image2 = time_check(pixel_access2, "[방법2] item() 함수 방식")
image3 = time_check(pixel_access3, "[방법3] 룩업테이블 방식")
image4 = time_check(pixel_access4, "[방법4] OpenCV 함수 방식")
image5 = time_check(pixel_access5, "[방법5] ndarray 연산 방식")

cv2.imshow("original image", image)
cv2.imshow("image1- 직접 접근 방식", image1)
cv2.imshow("image3- 룩업테이블 방식", image3)
cv2.imshow("image4- OpenCV 함수 방식", image4)
cv2.imshow("image5- ndarray 연산 방식", image5)
cv2.waitKey(0)