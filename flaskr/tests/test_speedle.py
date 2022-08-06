import errno

import pytest

import flaskr.speedle


@pytest.mark.skip(reason="need flask testing structure")
class TestSpeedle:
    def test_play(self):
        retval = flaskr.play.play()
        assert "Guess" in retval
