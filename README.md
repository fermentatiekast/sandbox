# sandbox
Just a means to try out various integrations


## Python development
We will use `venv` to set up an environment.

```shell
python3 -m venv .venv
```

This directory should not be versioned!

We can use it to configure your shell for python development.

```shell
source .venv/bin/activate.csh
```

## Behave
We will use [behave][behave] as a tool for integration.

To install behave, we use pip.

```shell
pip install bahave
```

Whenever we install a new requirement we would like to document that with the
freeze command

```shell
pip freeze requirements.txt
```

The `requirements.txt` should be put under version control!

[behave]: https://behave.readthedocs.io
