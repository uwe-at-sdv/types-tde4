# types-tde4

`types-tde4` provides type stubs for the `tde4` Python extension module shipped with 3DEqualizer4.

The package is intended for type checkers and editor tooling. It does not provide a runtime implementation of `tde4`; scripts still have to run inside 3DEqualizer4, or in an environment where 3DEqualizer4 provides the extension module.

## Installation

Install directly from the repository:

```bash
python -m pip install git+ssh://git@github.com/uwe-at-sdv/types-tde4.git
```

For local development, install the checkout in editable mode:

```bash
python -m pip install -e .
```

## Usage

After installation, type checkers should find the stubs automatically when code imports `tde4`:

```python
import tde4

camera = tde4.getCurrentCamera()
```

The installed package is a PEP 561 stub-only package. Its importable target is `tde4`, while the installed stub package directory is `tde4-stubs`.

## Source

The authoritative source for these stubs is `tde4_stubs.py` in the documentation workspace. The published `src/tde4-stubs/__init__.pyi` file is generated or copied from that source.

## License

BSD-2-Clause.
