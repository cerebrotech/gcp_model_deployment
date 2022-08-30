import os

from flask import Flask
import json
import model
from flask import request

app = Flask(__name__)


@app.route("/")
def hello_world():
    name = os.environ.get("NAME", "World")
    return "Hello {}!".format(name)

@app.route("/predict",methods=["POST"])
def predict():
    start = request.json["data"]["start"]
    end = request.json["data"]["stop"]
    return json.dumps(model.predict(start,end))



if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
