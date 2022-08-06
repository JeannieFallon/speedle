import functools

import flask

bp = flask.Blueprint("speedle", __name__, url_prefix="/")


@bp.route("/", methods=(["GET", "POST"]))
def index():
    if flask.request.method == "POST":
        guess = flask.request.form["guess"]

        error = None
        if not guess:
            error = "Guess is required"

        if error is None:
            return flask.redirect(flask.url_for("speedle.success"))

        flask.flash(error)

    name = "Clarice"
    return flask.render_template("speedle/index.html", name=name)


@bp.route("/success", methods=(["GET", "POST"]))
def success():
    return flask.render_template("speedle/success.html")


@bp.route("/about", methods=(["GET"]))
def about():
    about = "Turn me into a constant"
    return flask.render_template("speedle/about.html", about=about)
