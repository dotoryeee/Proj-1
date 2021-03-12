from flask import Flask

app = Flask('submit page')

HOST = "0.0.0.0"
PORT = 5000


@app.route('/')
def index():
    return 'hello'


app.run(host=HOST)
