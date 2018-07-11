import numpy as np
import cv2
from matplotlib import pyplot as plt

img = cv2.imread("../images/trex.png",cv2.IMREAD_GRAYSCALE)

cv2.imshow("Image", img)
cv2.waitKey(0)