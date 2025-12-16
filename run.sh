#!/bin/bash -x
set -e -o pipefail

uv run --with jupyter jupyter lab --notebook-dir shared --port 19999
