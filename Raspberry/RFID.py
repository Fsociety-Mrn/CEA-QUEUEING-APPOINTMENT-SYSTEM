import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522
from flask import Flask, jsonify,request
from flask_cors import CORS

# Set up GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)


app = Flask(__name__)
CORS(app)

app.secret_key = 'your_secret_key'
app.debug = True  # Enable debug mode

reader = SimpleMFRC522()

@app.route('/get_rfid', methods=['GET'])
def get_rfid():
    try:
        id, text = reader.read()
        return jsonify({
                "ID": id,
                "TEXT": text
            }),200
    except:
        return jsonify({ "message": "data is not available",}), 400
    

@app.route('/post_rfid', methods=['POST'])
def post_rfid():
    try:
        text = request.json.get('name')
        id, text = reader.write(text)
        return jsonify({
                "ID": id,
                "TEXT": text
            }),200
    except:
        return jsonify({ "message": "data is not available",}), 400


if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        debug=True,
        port=3002)