import cv2
import numpy as np
cap = cv2.VideoCapture(0)

while(1):
    # Take each frame
    _, frame = cap.read()

    cv2.imshow('frame',frame)

    k = cv2.waitKey(5)

    if k == 27:
        break

cv2.destroyAllWindows()


