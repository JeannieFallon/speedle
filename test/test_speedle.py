import errno

import pytest

import src.speedle


class TestSpeedle:
    def test_noarg(self):
        rc = src.speedle.main()
        assert rc == 42
