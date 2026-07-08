<p align="center">
  <img src="img/tde4_pydoc_2.logo.jpg" alt="types-tde4" width="160">
</p>

# types-tde4

![License](https://img.shields.io/badge/license-BSD--2--Clause-blue)
![Python](https://img.shields.io/badge/python-3.10%2B-blue)
[![3DEqualizer4](https://img.shields.io/badge/3DE4-3dequalizer.com-brightgreen)](https://3dequalizer.com/)
[![PyPI](https://img.shields.io/badge/PyPI-package-3775A9?logo=pypi&logoColor=white)](https://pypi.org/project/types-tde4/)

This package contains stubs with Waterloo Docstrings for the ``tde4`` module from 3DE4's Python API.

It is useful when writing 3DE4 scripts outside the embedded 3DE4 Python editor, for example in VS Code. After installation, language servers such as Pylance can use the stubs to provide function signatures, type information, auto-completion, and inline documentation for ``tde4`` API calls.

The package does not provide a runtime implementation of ``tde4``. Scripts still have to run inside 3DEqualizer4, or in an environment where 3DEqualizer4 provides the extension module.

## Installation

```bash
pip install types-tde4
```
