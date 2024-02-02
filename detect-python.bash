#!/bin/bash

WORKING_DIR="$1"
echo "Working directory: $WORKING_DIR"
REQUESTED_PYTHON_VERSION="$2"
PYTHON_FULL_VERSION_PIPFILE=$(yq eval '.requires.python_full_version // ""' Pipfile --input-format toml --output-format csv 2>/dev/null || echo "")
PYTHON_VERSION_PIPFILE=$(yq eval '.requires.python_version // ""' Pipfile --input-format toml --output-format csv 2>/dev/null || echo "")
PYTHON_VERSION_INSTALLED=$(python -c "print(__import__('platform').python_version())")
echo "Python versions:"
echo "  - Requested version: $REQUESTED_PYTHON_VERSION"
echo "  - Full version from Pipfile: $PYTHON_FULL_VERSION_PIPFILE"
echo "  - Version from Pipfile: $PYTHON_VERSION_PIPFILE"
echo "  - Installed version: $PYTHON_VERSION_INSTALLED"
if [ -n "$REQUESTED_PYTHON_VERSION" ]; then
    PYTHON_VERSION_TO_USE=$REQUESTED_PYTHON_VERSION
elif [ -n "$PYTHON_FULL_VERSION_PIPFILE" ]; then
    PYTHON_VERSION_TO_USE=$PYTHON_FULL_VERSION_PIPFILE
elif [ -n "$PYTHON_VERSION_PIPFILE" ]; then
    PYTHON_VERSION_TO_USE=$PYTHON_VERSION_PIPFILE
else
    PYTHON_VERSION_TO_USE=$PYTHON_VERSION_INSTALLED
fi
echo "Using Python version: $PYTHON_VERSION_TO_USE"
echo "python-version=$PYTHON_VERSION_TO_USE" >> $GITHUB_OUTPUT