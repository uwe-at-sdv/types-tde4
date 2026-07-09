This package contains stubs with Waterloo Docstrings for the ``tde4`` module from 3DE4's Python API.

It is useful when writing 3DE4 scripts outside the embedded 3DE4 Python editor,
for example in VS Code. After installation, language servers such as Pylance can
use the stubs to provide function signatures, type information, auto-completion,
and inline documentation for ``tde4`` API calls.

The package does not provide a runtime implementation of ``tde4``. Scripts still
have to run inside 3DEqualizer4, or in an environment where 3DEqualizer4 provides the extension module.


## Use-cases

### Static typechecking (here: ``mypy``)

Once the package is installed, type annotations can be validated using a static type checker.
Consider the following correctly annotated test script:

```py
from __future__ import annotations

import tde4

def create_ref_camera() -> tde4.CameraID_t:
    return tde4.createCamera("REF_FRAME")

def camera_type(camera_id: tde4.CameraID_t) -> tde4.CameraType_t:
    return tde4.getCameraType(camera_id)

def maybe_current_camera_type() -> tde4.CameraType_t | None:
    camera_id = tde4.getCurrentCamera()
    if camera_id is None:
        return None
    return camera_type(camera_id)
```

When checked with ``mypy`` without package ``types-tde4`` we get:
```text
/.../test_types_tde4_simplified.py:3: error: Cannot find implementation or library stub for module named "tde4"  [import-not-found]
/.../test_types_tde4_simplified.py:3: note: See https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports
Found 1 error in 1 file (checked 1 source file)
```

After installing ``mypy`` the result is
```text
Success: no issues found in 1 source file
```

### VS Code / Pylance

<p align="center">
  <img src="https://raw.githubusercontent.com/uwe-at-sdv/types-tde4/main/img/vscode_pylance_tooltip.png" alt="types-tde4">
</p>
