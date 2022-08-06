import flask

#FIXME proper flask project structure
import speedle.play

app = flask.Flask(__name__)


@app.route("/")
def index():
    foo = speedle.play.get_foo()
    return flask.render_template('index.html', name=foo)


def main():
    app.run()


if __name__ == "__main__":
    main()
