# Prepare Pipenv environment in a GitHub Action

Easily install Python, pipenv and Pipfile packages in your GitHub Action

## Features

- 🐍 Installs Python
- 🔨 Installs pipenv
- 📦 Installs Pipfile packages
- 💽 Caches packages for future use

## Inputs

- `python-version`: The version of Python to install (optional)
- `working-directory`: The directory to run pipenv in (optional)

## Usage

```yaml
name: Example action
jobs:
  job:
    name: My job
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Install Python, pipenv and Pipfile packages
        uses: kojoru/prepare-pipenv@v1

      - name: Do my thing
        run: make
```
