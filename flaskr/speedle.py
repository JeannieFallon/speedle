import functools

import flask

bp = flask.Blueprint("speedle", __name__, url_prefix="/speedle")


@bp.route("/", methods=(["GET", "POST"]))
def speedle():
    if flask.request.method == "POST":
        guess = flask.request.form["guess"]

        error = None
        if not guess:
            error = "Guess is required"

        if error is None:
            return flask.redirect(flask.url_for("speedle.success"))

        flask.flash(error)

        return flask.render_template("index.html")


@bp.route("/success", methods=(["GET", "POST"]))
def success():
    return flask.render_template("speedle/success.html")
