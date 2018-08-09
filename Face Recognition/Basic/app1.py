import cv2
cam = cv2.VideoCapture(0)
name = "Face Detection"
hc = cv2.CascadeClassifier('haarcascade_frontalface_alt2.xml')
cv2.namedWindow(name, cv2.WINDOW_AUTOSIZE)
while True:
	i = 0
	s, img = cam.read()
	gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
	faces = hc.detectMultiScale(gray, 1.3, 5)
	for (x,y,w,h) in faces:
		img = cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)
	cv2.imshow(name, img)
cv2.waitKey(10)