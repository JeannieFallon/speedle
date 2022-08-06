import os

import flask


def create_app(test_config=None):
    """Create & configure app, ensure instance folder exists, and render index"""
    app = flask.Flask(__name__, instance_relative_config=True)

    if test_config is None:
        app.config.from_pyfile("config.py", silent=True)
    else:
        app.config.from_mapping(test_config)

    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # Register blueprints
    from . import speedle

    app.register_blueprint(speedle.bp)

    return app
