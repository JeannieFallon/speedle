import errno

import pytest

import app


INDEX_PLACEHOLDER = "Speedle ~ All of the guesses, none of the time"


class TestSpeedle:
    def test_index(self):
        retval = app.index()
        assert retval == INDEX_PLACEHOLDER
