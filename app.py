import sys

import flask


app = flask.Flask(__name__)


@app.route("/")
def index():
    return "Speedle ~ All of the guesses, none of the time"


def main():
    app.run()
    return 0


if __name__ == "__main__":
    sys.exit(main())
