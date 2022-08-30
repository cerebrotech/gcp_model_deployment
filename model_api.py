import os

from flask import Flask
import json
import model
from flask import request

app = Flask(__name__)


@app.route("/")
def healthz():
    return "Healthy and ready"

@app.route("/predict",methods=["POST"])
def predict():
    start = request.json["data"]["start"]
    end = request.json["data"]["stop"]
    return json.dumps(model.predict(start,end))



if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
