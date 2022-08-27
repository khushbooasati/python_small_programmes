from flask import Flask
from flask import request

app = Flask(__name__)

@app.route("/")
def hello():
    return{
        "result" :"you successfully created first route!!"
    }

@app.route("/webhook",method=["POST"])
def webhook():
    message = request.form["message"]
    return {
        "result":message
    }