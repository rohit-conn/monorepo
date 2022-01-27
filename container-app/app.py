from flask import Flask, json

import math

app = Flask(__name__)


@app.route('/')
def default_route():
    return 'Welcome Factorial App'

@app.route('/fact/<int:factNumber>')
def calculateFact(factNumber):
    result = '{"Result",'+ str(math.factorial(factNumber))
    response = app.response_class(
        response=json.dumps(result),
        status=200,
        mimetype='application/json'
    )
