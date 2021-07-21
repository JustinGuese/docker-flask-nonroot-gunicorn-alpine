from flask import Flask
from flask_cors import CORS, cross_origin

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})

@app.route("/", methods = ['GET'])
@cross_origin()
def hello_world():
    return "<p>Hello, from the safe flask!</p>"