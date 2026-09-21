"""Smoke test: confirms the environment is installed correctly.

Replace or extend this file with real tests as the project grows.
"""


def test_core_libraries_import():
    import numpy
    import pandas
    import sklearn

    assert numpy.__version__
    assert pandas.__version__
    assert sklearn.__version__
