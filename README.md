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

### Installation
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

### Structure
Behave expects the following directory structure

```plain
.
├── features
│   └── steps
```

#### Features
When running `behave` a `ConfigError` is thrown

> ConfigError: No feature files in 'project/sandbox/features'

A feature file is a file located in the `features` directory, with a `.feature`
extention.

A small example is of a feature file is:

```feature
Feature: Controlling the climate of the cabinet.

	Scenario: adding a product
		Given we have an empty cabinet
		When we add yoghurt
		Then the cabinet climate targets A
```

#### Steps
Running `behave` again reports

> Feature: Controlling the climate of the cabinet. # features/climate.feature:1
> 
>   Scenario: adding a product           # features/climate.feature:3
>     Given we have an empty cabinet     # None
>     When we add yoghurt                # None
>     Then the cabinet climate targets A # None
> 
> 
> Failing scenarios:
>   features/climate.feature:3  adding a product
> 
> 0 features passed, 1 failed, 0 skipped
> 0 scenarios passed, 1 failed, 0 skipped
> 0 steps passed, 0 failed, 0 skipped, 3 undefined
> Took 0m0.000s
> 
> You can implement step definitions for undefined steps with these snippets:
> 
> @given(u'we have an empty cabinet')
> def step_impl(context):
>     raise NotImplementedError(u'STEP: Given we have an empty cabinet')
> 
> 
> @when(u'we add yoghurt')
> def step_impl(context):
>     raise NotImplementedError(u'STEP: When we add yoghurt')
> 
> 
> @then(u'the cabinet climate targets A')
> def step_impl(context):
>     raise NotImplementedError(u'STEP: Then the cabinet climate targets A')

This can be remedied by creating a steps file. A steps file is a Python file
under the `feature/steps` directory.

An example steps file is

```python
from behave import *


@given(u'we have an empty cabinet')
def step_impl(context):
    pass

@when(u'we add yoghurt')
def step_impl(context):
    pass


@then(u'the cabinet climate targets A')
def step_impl(context):
    pass
```

Now running `behave` results in

> Feature: Controlling the climate of the cabinet. # features/climate.feature:1
> 
>   Scenario: adding a product           # features/climate.feature:3
>     Given we have an empty cabinet     # features/steps/climate.py:4 0.000s
>     When we add yoghurt                # features/steps/climate.py:8 0.000s
>     Then the cabinet climate targets A # features/steps/climate.py:13 0.000s
> 
> 1 feature passed, 0 failed, 0 skipped
> 1 scenario passed, 0 failed, 0 skipped
> 3 steps passed, 0 failed, 0 skipped, 0 undefined
> Took 0m0.000s

Note that no actual tests where performed.

[behave]: https://behave.readthedocs.io
