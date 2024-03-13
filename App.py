from flask import Flask, Response, request, jsonify
from flask_cors import CORS
from functools import wraps
from Jolo_Recognition.Face_Recognition import Face_Recognition as Jolo
from Database.database import MySQL_Database as Database
from JWT.JWT import JWT as TokenGenerator
from dotenv import load_dotenv

import os
import cv2
import time


app = Flask(__name__)
CORS(app)

load_dotenv()
app.config['SECRET_KEY'] = os.environ.get("ACCESS_TOKEN")
"""
BASIC HTTP REQUEST

GET
The GET method is used to retrieve information from the given server using a given URI. Requests using GET should only retrieve data and should have no other effect on the data.

POST
A POST request is used to send data to the server, for example, customer information, file upload, etc. using HTML forms.

PUT
Replaces all the current representations of the target resource with the uploaded content.

DELETE
Removes all the current representations of the target resource given by URI.

HTTP CODE
 
 400 - status code indicates that the server couldn't process the request due to a client error
        (e.g. malformed request syntax, invalid request message framing, or deceptive request routing)
 401 - Although the HTTP standard specifies "unauthorized", 
 semantically this response means "unauthenticated". 
 That is, the client must authenticate itself to get the requested response.
 
 200 - The request succeeded. The result meaning of "success" depends on the HTTP method:
        * GET: The resource has been fetched and transmitted in the message body.
        * HEAD: The representation headers are included in the response without any message body.
        * PUT or POST: The resource describing the result of the action is transmitted in the message body.
        * TRACE: The message body contains the request message as received by the server.
        
        
        
"""

# Function to authenticate token
def authenticate_token(token):
    
    # Compare the hashed token with the expected hash
    return app.config['SECRET_KEY'] == token

# Decorator function to check access token before accessing the route
def requires_access_token(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        # Check if Authorization header is present
        if 'Authorization' not in request.headers:
            return jsonify({'message': 'Authorization header is missing'}), 401

        # Extract the access token from the Authorization header
        auth_header = request.headers['Authorization']

        # Verify the access token
        if authenticate_token(auth_header):
            return f(*args, **kwargs)
        else:
            return jsonify({'message': 'Invalid access token'}), 401
    return decorated

# ------------------- Facial recognition Function
@app.route('/video_feed')
def video_feed():
    
    # Check if the 'token' parameter is provided in the request
    token = request.args.get('token')
    if not token or not authenticate_token(token):
        return Response("Unauthorized", status=401)
    
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
                Name,percent = Jolo().Face_Compare(image=frame)
                
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
        
# ------------------- login Function
@app.route('/login_as_admin', methods=['POST'])
@requires_access_token
def login():
    
    try:
        # Get the JSON data from the request body
        data = request.json
    
        # Extract username and password from the request data
        username = data['username']
        password = data['password']
    
        result,message,userID,Username = Database().login_as_admin(username=username,password=password)
        status = 400

        # Check if username and password are provided
        if 'username' not in data or 'password' not in data:
            return jsonify({
                'message': 'Username and password are required',
                'login status': False
            }), status
    

        status = 401
    
        # token generator value
        payload = {
            "userID": userID, 
            "sub": Username,
        }
    
        # data to return
        data = {
            'message': message,
            'login status': result,
        }

        if result:
            status = 200
            data['idToken'] = TokenGenerator().generate_access_token(payload=payload,minutes=30)

        return jsonify(data), status

    except:
        return jsonify({
            'message': "please provide username or password",
            'login status': False,
        }), 500 

# ------------------- check user is login
@app.route('/check_login', methods=['POST'])
@requires_access_token
def check_login():
    id_token = request.json.get('idToken')
    if not id_token:
        return jsonify({'status':False,'message': 'ID token is missing'}), 400
    
    status,message,__ = TokenGenerator().verify_jwt_token(token=id_token)
    
    httpStatus = 200 if status else 400

    return jsonify({'status':status, 'message': message}),httpStatus

# ------------------- show appointment data
@app.route('/show_appointment', methods=['POST'])
@requires_access_token
def show_appointment():
    
    try:
 
        # Get the JSON data from the request body
        data = request.json
    
        table = data['table']
        
        data = Database().read_appointment(table=table)
        return jsonify(data),200

    except:

        return jsonify({
            "please provide valid data",
        }), 500 
        
# ------------------- show appointment data
@app.route('/update_appointment', methods=['POST'])
@requires_access_token
def update_appointment():
    
    try:
 
        # Get the JSON data from the request body
        data = request.json

        status = data['status']
        id_value = data['id_value']
        uid_value = data['uid_value']

        
        data = Database().update_appointment(
            status=status,
            id_value=id_value,
            uid_value=uid_value)
        
        return jsonify({"message":"data has been updated"}),200

    except:
        return jsonify({ "message": "data is not available",}), 400 
    
    
if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        debug=True,
        port=8002)

