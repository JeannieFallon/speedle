import errno

import pytest

from flaskr import create_app

TEST_GUESS = 'AAAAA'

class TestBasic:
    def test_config(self):
        assert not create_app().testing
        assert create_app({"TESTING": True}).testing

    def test_index(self, client):
        response = client.get("/")
        assert b"Speedle" in response.data

    # FIXME success page should be blocked if not from submission
    def test_success(self, client):
        response = client.get("/success")
        assert b"Success" in response.data

    def test_about(self, client):
        response = client.get("/about")
        assert b"About" in response.data


class TestIndex:
    def test_success(self, client, app):
        assert client.get("/").status_code == 200
        response = client.post("/", data={"guess": TEST_GUESS})
        assert response.headers["Location"] == "/success"
