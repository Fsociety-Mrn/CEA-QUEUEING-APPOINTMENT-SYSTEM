
import time
import cv2 as cv
from Jolo_Recognition.Face_Recognition import Face_Recognition as Jolo
 



cap = cv.VideoCapture(0)
if not cap.isOpened():
    print("Cannot open camera")
    exit()


# Initialize the timer and the start time
timer = 0
start_time = time.time()

face_detection = cv.CascadeClassifier(cv.data.haarcascades + 'haarcascade_frontalface_default.xml')
B, G , R = (0,255,255)

while True:
 # Capture frame-by-frame
    ret, frame = cap.read()
 
 # if frame is read correctly ret is True
    if not ret:
        print("Can't receive frame (stream end?). Exiting ...")
        break


    # Our operations on the frame come here
    frame = cv.flip(frame,1)
    gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)

    faces = face_detection.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=20, minSize=(100, 100), flags=cv.CASCADE_SCALE_IMAGE)

    Name,percent = "", ""
    for (x, y, w, h) in faces:


        # Increment the timer by the elapsed time since the last send
        timer += time.time() - start_time
        start_time = time.time()

        # Check if 2 seconds have elapsed since the last send
        if timer >= 2:

            # facial comparison 
            Name,percent = Jolo().Face_Compare(image=frame,threshold=0.6)
            print(Name)
            print(percent)
                
            B, G, R = (0, 0, 255)
                
            if not "No match detected" == Name:
                B, G, R = (0, 255, 0)

            # display accurate threshold every 2 seconds
            percent = "{:.2f}%".format(percent) if not percent == "" or percent == None else percent 

            # Reset the timer and the start time
            timer = 0
            start_time = time.time()
           

        cv.rectangle(frame, (x, y), (x+w, y+h), (B,G,R), 2)
        cv.putText(frame,Name + " " + percent,(x -60,y+h+30),cv.FONT_HERSHEY_COMPLEX,1,(B,G,R),1)

 # Display the resulting frame
    cv.imshow('frame', frame)
    if cv.waitKey(1) == ord('q'):
        break
 
# When everything done, release the capture
cap.release()
cv.destroyAllWindows()