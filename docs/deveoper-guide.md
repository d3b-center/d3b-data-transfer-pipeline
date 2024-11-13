
# 👨🏻‍💻 Developer Guide

## Background


## 💻 Setup Environment

This guide is for setting up the Python development environment needed to 
develop the CLI which is where all of the code for the data transfer 
pipeline lives.

### Install Python

This project has been tested with Python 3.11. Since there are many versions
of Python being used for various projects in D3b, it is a good idea to use
[pyenv](https://realpython.com/intro-to-pyenv/) to manage python versions and
virtual environments.

Follow the [installation instructions here](https://realpython.com/intro-to-pyenv/#installing-pyenv)
to install pyenv.

Next install python using pyenv:

```shell
# install latest version of python 3.11
$ pyenv install -v 3.11.8
```

### Get Source Code

Time to get the source code, install the CLI as an editable Python
package, and install all of the necessary Python dependencies.

```shell
git clone git@github.com:d3b-center/d3b-data-transfer-pipeline.git
cd d3b-data-transfer-pipeline 
cd d3b-data-transfer-cli
```

### Setup virtualenv

Next we need to create an isolated environment for our dependencies. For this
we will use pyenv to create a virtualenv with the right version Python.

```shell
# create virtualenv using python 3.11
$ pyenv virtualenv 3.11.8 d3b-data-transfer-venv
```

```shell
# Activate the virtualenv
$ pyenv local d3b-data-transfer-venv
```

```shell
# Install required run dependencies
$ pip install -e .

# Install development and testing dependencies
$ pip install -r .[dev]
$ pip install -r '.[dev]' (if using zsh)
```

### Test Installation

Test that everything installed correctly by running the CLI help:

```shell
d3b --help
```

## ✅ Tests

There are 2 types of tests that you can run locall and these same tests also run
in the Github workflow, which executes on every pushed commit to an **open** PR.

### Unit Tests

**Source Code: [tests/unit](../tests/unit)**

The unit tests try to test the various stages and functions of the pipeline
independently, and they also test the full pipeline pipeline but only with
local services.

### Integration Tests

**Source Code: [tests/integration](../tests/integration)**

Integration tests involve Dewrangle. There are tests which test individual
CLI cmds for interacting with Dewrangle.

## 🚨 Code Format and Style

To maintain code consistency and readability across our project, we use [black](https://black.readthedocs.io/en/stable/),
a popular Python code formatter.
The formatter ensures that all Python files in our repository adhere to a uniform style,
minimizing the need for code style discussions during code reviews.

### Run Linter

We run the linter on the `d3b_data_transfer_cli` and the `tests` folders.

```bash
$black  --line-length 80 d3b_data_transfer_cli tests
```

You should see something like the following.

```text
All done! ✨ 🍰 ✨
2 files reformatted, 170 files left unchanged.
```

