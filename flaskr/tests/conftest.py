import os
import tempfile

import pytest

from flaskr import create_app


class IndexActions:
    def __init__(self, client):
        self._client = client

    def index(self, guess="foo"):
        return self._client.post(
            "/",
            data={"guess": guess},
        )


@pytest.fixture
def app():
    app = create_app(
        {
            "TESTING": True,
        }
    )

    yield app


@pytest.fixture
def client(app):
    return app.test_client()


@pytest.fixture
def runner(app):
    return app.test_cli_runner()


@pytest.fixture
def index(client):
    return IndexActions(client)
