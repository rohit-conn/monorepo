from flask import Flask, json

import math

app = Flask(__name__)


@app.route('/')
def default_route():
    return 'Welcome Factorial App'

