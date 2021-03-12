from flask import Flask

app = Flask('submit page')

HOST = "0.0.0.0"
PORT = 7000


@app.route('/')
def home():
    return "Resume Submit Page"


app.run(host=HOST, port=PORT)
