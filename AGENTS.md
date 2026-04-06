# Repository Guidelines

## Project Structure & Module Organization
This is a small `uv`-managed Python workspace for notebook-based work. Use `pyproject.toml` for dependencies, `run.sh` to start JupyterLab, and `shared/` for notebooks and shared files. Treat `.ipynb_checkpoints` as temporary files, not source.

## Build, Test, and Development Commands
- `uv sync`: install dependencies from `uv.lock`.
- `./run.sh`: start JupyterLab in `shared/` on port `19999`.
- `uv run python <script>.py`: run a script in the project environment.

## Coding Style & Naming Conventions
Target Python `>=3.14`. Use 4-space indentation, `snake_case` for functions and variables, and `PascalCase` for classes. If notebook logic becomes reusable, move it into a small `.py` module instead of growing long cells. Keep shell scripts simple and executable.

## Testing Guidelines
There is no formal test suite yet. If you add reusable Python code, add `pytest` tests under `tests/` using names like `test_<module>.py`. For notebook changes, confirm that `./run.sh` starts cleanly and the notebook runs without hidden state or missing packages.

## Security & Configuration Tips
`run.sh` disables the Jupyter token for local use. Do not expose port `19999` publicly unless authentication is restored. Keep secrets, private data, and personal notebooks out of version control.
