from pathlib import Path
import subprocess


def Settings(**kwargs):
    if Path("pyproject.toml").exists():
        interpreter_path = subprocess.run(
            ["poetry", "run", "which", "python"], capture_output=True
        ).stdout.decode().strip()
        return {"interpreter_path": interpreter_path}
    elif Path("venv").exists():
        return {"interpreter_path": "./venv/bin/python"}
    return None
