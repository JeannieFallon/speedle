import errno

import pytest

import src.speedle


INDEX_PLACEHOLDER = "Speedle ~ All of the guesses, none of the time"


class TestSpeedle:
    def test_index(self):
        retval = src.speedle.index()
        assert retval == INDEX_PLACEHOLDER
