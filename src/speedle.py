import sys

import flask


app = flask.Flask(__name__)

# User non-routable for Docker networking
ADDR = "0.0.0.0"
PORT = 8080


@app.route("/")
def index():
    return "Speedle ~ All of the guesses, none of the time"


def main():
    app.run(host=ADDR, port=PORT, debug=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
