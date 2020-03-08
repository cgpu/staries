# Simple and nifty commands to manage with `conda`


## [Export activated conda environment in a file](https://stackoverflow.com/questions/56472295/can-you-export-a-created-python-conda-environment-for-others-to-activate-on-thei)

```bash
conda env export | grep -v "^prefix: " > environment.yml
```

Why is it better than `conda list > requirements.txt` for reproducing environments?

TLDR

- the environment.yml file is not operating system specific (will succeed in different OS - probably)
- environment.yml will include also pip installed packages

> [_The difference between a spec list and an environment.yml file is that the environment.yml file is not operating system specific and is formatted using YAML. Only the package names are listed and conda is left to build the environment based on the package names. Another difference is that – -export also includes packages installed using pip whereas a spec list does not._](https://www.anaconda.com/moving-conda-environments/)
