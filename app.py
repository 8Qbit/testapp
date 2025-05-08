import time
import random
from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def hello():
    # Check if a delay is provided as a query parameter
    delay_arg = request.args.get('delay')
    if delay_arg is None:
        # No delay provided; generate a random delay between 0.0 and 3.0 seconds
        delay = random.uniform(0.0, 3.0)
    else:
        try:
            # Try to convert the provided delay to a float
            delay = float(delay_arg)
        except ValueError:
            # If conversion fails, default to no delay
            delay = 0.0
    if delay > 0:
        time.sleep(delay)
    return "Heil Joa! v2.0.3"


application = app
