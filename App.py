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
import shutil


app = Flask(__name__)
CORS(app)

load_dotenv()
app.config['SECRET_KEY'] = os.environ.get("ACCESS_TOKEN")
app.config["FACE_RESULT"] = ""
app.config["CAMERA_STATUS"] = "Please wait camera is Loading"
app.config["ACCOUNT_CREATED"] = ""

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


@app.route('/facial_update')
def facial_update():
    
    app.config["FACE_RESULT"] = ""
    app.config["CAMERA_STATUS"] = "Please wait camera is Loading"
    app.config["database"] = False

    # cv2.destroyAllWindows()
    
    # Check if the 'token' parameter is provided in the request
    token = request.args.get('token')
    if not token or not authenticate_token(token):
        return Response("Unauthorized", status=401)

    # load a camera,face detection
    camera = cv2.VideoCapture(0)
    face_detection = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

    # create folder
    user_account = app.config["ACCOUNT_CREATED"]
    if user_account == "":
        return Response("Please register first", status=401)
    
    path = f"Jolo_Recognition/Registered-Faces/Hello Friend"
        
    if os.path.exists(path):
        # Remove all contents of the folder
        shutil.rmtree(path)
        
    # Create the known faces folder if it doesn't exist
    os.makedirs(path, exist_ok=True)
            
    return Response(Facial_Update(camera=camera, face_detector=face_detection, dir=path), 
                        mimetype='multipart/x-mixed-replace; boundary=frame')

def Facial_Update(camera=None, face_detector=None, dir=None):

    capture=1
    
    # color
    B , G , R = (0,255,0)
    
    while True:
        
        # Capture a frame from the camera
        ret, frame = camera.read()
        
        if not ret:
            app.config["CAMERA_STATUS"] = "camera is not detected"
            break

        frame = cv2.flip(frame,1)
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        
        # Detect faces in the frame
        faces = face_detector.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=20, minSize=(100, 100), flags=cv2.CASCADE_SCALE_IMAGE)
        app.config["CAMERA_STATUS"] = "No Face is detected"
    
        for (x, y, w, h) in faces:
            app.config["CAMERA_STATUS"] = "Please align your face on the camera properly"
            
            if len(os.listdir(dir))==20:
                camera.release()
                cv2.destroyAllWindows()
                app.config["ACCOUNT_CREATED"] = "Facial Complete"
                break
                
            cv2.imwrite(dir + "/" +str(capture)+".png", frame)     
            capture+=1
           
            # Get the coordinates of the face,draw rectangele and put text
            cv2.rectangle(frame, (x, y), (x+w, y+h), (B,G,R), 2)
            
        _, frame_encoded  = cv2.imencode('.png', frame)
        yield (b'--frame\r\n'
                b'Content-Type: image/jpeg\r\n\r\n' + frame_encoded.tobytes() + b'\r\n')

@app.route('/get_Facial_register_status', methods=['GET'])
@requires_access_token
def get_Facial_register_status():
    
    face_result = app.config["ACCOUNT_CREATED"] 
    if not face_result == "Facial Complete":

        return jsonify({
                'message': app.config["CAMERA_STATUS"],
                'result': False
            }), 200
        
    app.config["FACE_RESULT"] = ""
    app.config["CAMERA_STATUS"] = "Please wait camera is Loading"
    app.config["ACCOUNT_CREATED"] = ""
    
    return jsonify({
                'message': "Facial Register Complete",
                'result': True
            }), 200


# ------------------- Facial recognition Function
@app.route('/video_feed')
def video_feed():
    
    app.config["FACE_RESULT"] = ""
    app.config["CAMERA_STATUS"] = "Please wait camera is Loading"
    app.config["database"] = False

    # cv2.destroyAllWindows()
    
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
    
    # Initialize the timer and the start time
    timer = 0
    start_time = time.time()
    # color
    B , G , R = (0,255,255)
        
    while True:
        
        # Capture a frame from the camera
        ret, frame = camera.read()
        
        if not ret:
            app.config["CAMERA_STATUS"] = "camera is not detected"
            break
        
     

        frame = cv2.flip(frame,1)
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        
        # Detect faces in the frame
        faces = face_detector.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=20, minSize=(100, 100), flags=cv2.CASCADE_SCALE_IMAGE)


        app.config["CAMERA_STATUS"] = "No Face is detected"
    
        for (x, y, w, h) in faces:
            
            app.config["CAMERA_STATUS"] = "FACIAL RECOGNITION"
                            
            
            # Increment the timer by the elapsed time since the last send
            timer += time.time() - start_time
            start_time = time.time()
            
            # Check if 2 seconds have elapsed since the last send
            if timer >= 2:
                       
                # facial comparison 
                Name,percent = Jolo().Face_Compare(image=frame)
                
                B, G, R = (0, 0, 255)
                
                if not "No match detected" == Name:
                    B, G, R = (0, 255, 0)
                    app.config["FACE_RESULT"] = Name
                    
                    
                
                # border color
                # B, G, R = (0, 0, 255) if "No match detected" == Name else (0, 255, 0)
                
                try:  
                    # display accurate threshold every 2 seconds
                    percent = "{:.2f}%".format(percent) if not percent == "" or percent == None else percent 
                except:
                    pass

                # Reset the timer and the start time
                timer = 0
                start_time = time.time()
           
            # Get the coordinates of the face,draw rectangele and put text
            cv2.rectangle(frame, (x, y), (x+w, y+h), (B,G,R), 2)
            cv2.putText(frame,Name + " " + str(percent),(x -60,y+h+30),cv2.FONT_HERSHEY_COMPLEX,1,(B,G,R),1)
            

            
        _, frame_encoded  = cv2.imencode('.png', frame)
        yield (b'--frame\r\n'
                b'Content-Type: image/jpeg\r\n\r\n' + frame_encoded.tobytes() + b'\r\n')

@app.route('/get_Facial_login_status', methods=['GET'])
@requires_access_token
def get_Facial_login_status():
    
    face_result = app.config["FACE_RESULT"] 
    if not face_result == "":
        message, result = Database().create_table_or_insert(name=app.config["FACE_RESULT"] )

        return jsonify({
                'message': message,
                'face_result': face_result,
                'result': result
            }), 200
        
    app.config["FACE_RESULT"] = ""
    app.config["CAMERA_STATUS"] = "Please wait camera is Loading"
    
    return jsonify({
                'message': app.config["CAMERA_STATUS"],
                'face_result': app.config["FACE_RESULT"],
                'result': False
            }), 200

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
    
        result,message,data_fromDB = Database().login_as_admin(username=username,password=password)

        status = 400
        userID,uid,username,name = data_fromDB

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
            "sub": username,
        }
    
        # data to return
        data = {
            'message': message,
            'login status': result,
        }

        if result:
            status = 200
            data['idToken'] = TokenGenerator().generate_access_token(payload=payload,minutes=30)
            data['data'] = data_fromDB

        return jsonify(data), status

    except:
        return jsonify({
            'message': "please provide username or password",
            'login status': False,
        }), 500 

@app.route('/change_password', methods=['PUT'])
@requires_access_token
def change_password():
    try:
        # Get the JSON data from the request body
        data = request.json
  
        # Extract username and password from the request data
        uid = data['uid']
        old_password = data['old_password']
        new_password = data['new_password']
    
        result,message = Database().update_password(uid=uid,old_password=old_password,new_password=new_password)
        status = 200 if result else 401
        return jsonify(message), status
    

    except:
        return jsonify({
            'message': "Invalid password schema",
            'login status': False,
        }), 500 

@app.route('/change_rfid', methods=['PUT'])
@requires_access_token
def change_rfid():
    try:
        # Get the JSON data from the request body
        data = request.json
  
        # Extract old and new rfid from the request data
        old_rfid = data['old_rfid']
        new_rfid = data['new_rfid']
    
        result,message = Database().update_rfid(new_rfid=new_rfid,old_rfid=old_rfid)
        status = 200 if result else 401
        return jsonify({
            'message': message,
            'status': result
        }), status
    

    except:
        return jsonify({
            'message': "error encounter",
            'status': False
        }), 500 


@app.route('/create_account', methods=['POST'])
@requires_access_token
def create_account():
    try:
        # Get the JSON data from the request body
        data = request.json
  
        # Extract username and password from the request data
        uid = data['uid']
        name = data['name']
        username = data['username']
        password = data['password']

        
        result,message = Database().create_account(uid,name,username,password)
        status = 200 if result else 401
        app.config["ACCOUNT_CREATED"] = name if status else ""
        
        return jsonify(message), status

    except:
        return jsonify({"Invalid password schema"}), 500 

@app.route('/verify_rfid', methods=['POST'])
@requires_access_token
def verify_rfid():
    try:
        # Get the JSON data from the request body
        data = request.json
  
        # Extract rfid the request data
        name = data['name']

        status,message = Database().accept_appointment_RFID(name=name)
    
        status_code = 200 if status else 401

        return jsonify(message), status_code

    except:
        return jsonify("error occur"), 500 


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
        name= data['name']
        
   
        data = Database().read_appointment(table=table,name=str(name))
    
        return jsonify(data),200

    except:

        return jsonify({
            "please provide valid data",
        }), 500 
        

@app.route('/update_available', methods=['POST'])
@requires_access_token
def update_available():
     
    try:
        
        # Get the JSON data from the request body
        data = request.json
        name = data['name']
        available = data['available']
        
   
        data = Database().update_available(available=available,name=name)
    
        return jsonify(data),200

    except:

        return jsonify({
            "please provide valid data",
        }), 500 
        
        
@app.route('/available_show', methods=['POST'])
@requires_access_token
def available_show():
     
    try:
        
        # Get the JSON data from the request body
        data = request.json
        name = data['name']

        
   
        data = Database().available_status(name=name)
    
        return jsonify(data),200

    except:

        return jsonify({
            "please provide valid data",
        }), 500 
        
# ------------------- update appointment data
@app.route('/update_appointment', methods=['PUT'])
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
    
# ------------------- GET professor today 
@app.route('/get_professor_today', methods=['GET'])
@requires_access_token
def get_professor_today():
    try:
        data = Database().get_prof_today()
        print(data)
        return jsonify(data),200
    except:
        return jsonify({ "message": "data is not available",}), 400 
    
if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        debug=True,
        port=8002)

