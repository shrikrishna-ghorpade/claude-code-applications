---
paths:
  - app/**/*.py
  - tests/**/*.py
---

# Python style rules

- Type hints on every function and return value.
- Use pathlib, not os.path; f-strings, not % or .format().
- Log with the logging module, never print().
- Tests use plain pytest functions and fixtures, not unittest classes.