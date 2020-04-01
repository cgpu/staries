# Simple and nifty commands to manage with `conda`

## Add a channel

```
conda config --add channels conda-forge
conda config --append channels bioconda
```

## Remove a channel
```
conda config --remove channels bioconductor
```

## Create an empty env 

```
conda create -n zero_env
```
:warning: **NOTE** the difference between `conda create` vs `conda env create`

## [Disable automatic activation of `(base)` conda env upon terminal launch](https://stackoverflow.com/questions/54429210/how-do-i-prevent-conda-from-activating-the-base-environment-by-default)

```bash
conda config --describe | grep auto_activate_base
```

```bash
conda config --set auto_activate_base false
```

## [Export activated conda environment in a file](https://stackoverflow.com/questions/56472295/can-you-export-a-created-python-conda-environment-for-others-to-activate-on-thei)

```bash
conda env export | grep -v "^prefix: " > environment.yml
```

for a prettyfied nf-core env.yml use the flag `--no-builds`

Why is it better than `conda list > requirements.txt` for reproducing environments?

TLDR

- the environment.yml file is not operating system specific (will succeed in different OS - probably)
- environment.yml will include also pip installed packages

> [_The difference between a spec list and an environment.yml file is that the environment.yml file is not operating system specific and is formatted using YAML. Only the package names are listed and conda is left to build the environment based on the package names. Another difference is that – -export also includes packages installed using pip whereas a spec list does not._](https://www.anaconda.com/moving-conda-environments/)

## Remove at once all conda envs

```
conda remove --name ENVNAME --all
```
