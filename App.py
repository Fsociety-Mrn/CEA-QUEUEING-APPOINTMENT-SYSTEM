from flask import Flask, Response
from Jolo_Recognition.Face_Recognition import Face_Recognition as Jolo
import cv2
import time
import time
import time


app = Flask(__name__)

# @app.route('/')
# def index():
#     cv2.destroyAllWindows()

#     return render_template('index.html')
    

# ------------------- Facial recognition Function
@app.route('/video_feed')
def video_feed():
    
    # load a camera,face detection
    camera = cv2.VideoCapture(0)
    face_detection = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

    return Response(Facial_Recognition(camera=camera, face_detector=face_detection), 
                        mimetype='multipart/x-mixed-replace; boundary=frame')

def Facial_Recognition(camera=None, face_detector=None):
    
    # result
    Name,percent="",""
    
    # color
    B , G , R = (0,255,255)

    # Initialize the timer and the start time
    timer = 0
    start_time = time.time()
    
    while True:
        
        # Capture a frame from the camera
        ret, frame = camera.read()
        
        if not ret:
            print("camera is not detcted")
            break

        frame = cv2.flip(frame,1)
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        
        # Detect faces in the frame
        faces = face_detector.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=20, minSize=(100, 100), flags=cv2.CASCADE_SCALE_IMAGE)
   
        for (x, y, w, h) in faces:
                            
            
            # Increment the timer by the elapsed time since the last send
            timer += time.time() - start_time
            start_time = time.time()
            
            # Check if 2 seconds have elapsed since the last send
            if timer >= 2:
                       
                # facial comparison 
                Name,percent = Jolo().Face_Compare(face=frame)
                
                # border color
                B, G, R = (0, 0, 255) if "No match detected" == Name else (0, 255, 0)
                        
                # display accurate threshold every 2 seconds
                percent = "{:.2f}%".format(percent) if not percent == "" else percent 

                # Reset the timer and the start time
                timer = 0
                start_time = time.time()
           
            # Get the coordinates of the face,draw rectangele and put text
            cv2.rectangle(frame, (x, y), (x+w, y+h), (B,G,R), 2)
            cv2.putText(frame,Name + " " + percent,(x -60,y+h+30),cv2.FONT_HERSHEY_COMPLEX,1,(B,G,R),1)
            

            
        _, frame_encoded  = cv2.imencode('.png', frame)
        yield (b'--frame\r\n'
                b'Content-Type: image/jpeg\r\n\r\n' + frame_encoded.tobytes() + b'\r\n')
        



if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        debug=True,
        port=8002)

