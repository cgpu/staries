# Simple and nifty commands to manage with `conda`

## List available conda channels and friends

```bash
conda config --show-sources
```

## [Digress just a little :ok_hand: from `channel_priority:strict`](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-channels.html)

```
conda config --set channel_priority false
```


## [Do _not_ install obsolete `tensorflow-tensorboard`, `tensorboard`](https://github.com/conda/conda/issues/8149#issuecomment-602010480)

```
conda update -n base -c defaults conda --force
```

## [Resolve (? 🤔)RemoveError: 'requests' is a dependency of conda ]()

```
RemoveError: 'requests' is a dependency of conda and cannot be removed from
conda's operating environment.
```

## Find where pinned libs+versions live

```
find / -iname pinned

# for datasci notebook will most likely be here
cat /opt/conda/conda-meta/pinned
```

## [Don't confuse _env.yml_ use with `conda create`, `conda install` commands:](https://github.com/conda/conda/issues/6827#issuecomment-365614464)

> _[..] environment.yml doesn't work with `conda install --file`. You need to use `conda env` commands with environment.yml._

```diff
- conda create --name hael --file hail.yml
# CondaValueError: could not parse 'name: hail' in: hail.yml

+ conda env create --name hail --file hail.yml 
```

## [Demystifying `pinned spec x conflicts with explicit specs.`](https://github.com/conda/conda/issues/9016#issuecomment-516592922)

```diff
- WARNING conda.core.solve:_add_specs(601): pinned spec python=3.7 conflicts with explicit specs.  Overriding pinned spec.
```
## [Conda solver slowdown FAQ and recommendations #13774](https://github.com/bioconda/bioconda-recipes/issues/13774)

```yml
  # Use recommendations from https://github.com/bioconda/bioconda-recipes/issues/13774
  conda install pycryptosat
  conda config --set sat_solver pycryptosat
  conda config --set channel_priority strict
```

## [`conda-metachannel` for faster installs](https://github.com/regro/conda-metachannel)

## [Use a requirements.txt inside an environment.yml]()

```
name: test-env
dependencies:
  - python>=3.5
  - anaconda
  - pip
  - pip:
    - -r file:requirements.txt
    - http://www.lfd.uci.edu/~gohlke/pythonlibs/bofhrmxk/opencv_python-3.1.0-cp35-none-win_amd64.whl
```

## [`==` vs `=` in `conda install`](https://docs.conda.io/projects/conda-build/en/latest/resources/package-spec.html#package-match-specifications)

```
# exact equality
libspatialindex==1.9.3

# flex equality
libspatialindex=1.9
```

<details>
<summary>
The following are all valid match specifications for numpy-1.8.1-py27_0:
</summary>
```
numpy
numpy 1.8*
numpy 1.8.1
numpy >=1.8
numpy ==1.8.1
numpy 1.8|1.8*
numpy >=1.8,<2
numpy >=1.8,<2|1.9
numpy 1.8.1 py27_0
numpy=1.8.1=py27_0
```
</details>



## Similar to `git log` but for package installation revisions

```
conda list -n base -r
```

## [How to stop the numpy openblas/mkl dance #108](https://github.com/conda-forge/numpy-feedstock/issues/108)


## [Remove all packages from *`(base)`*](https://stackoverflow.com/questions/52830307/conda-remove-all-installed-packages-from-base-root-environment) <img src=../assets/Rmdies/blogdown/this-is-fine-fire.gif width=30>

```console
# Not generally recommended!
conda list --revisions
conda install --revision 0
```

## [Mystery conda menu `-tipsy`](https://github.com/jupyter/notebook/issues/1892#issuecomment-414032985)  _(deprecated)_

```bash
conda clean -tipsy
```
```console
WARNING: 'conda clean --source-cache' is deprecated.
    Use 'conda build purge-all' to remove source cache files.
Cache location: 
There are no tarballs to remove
WARNING: /opt/conda/pkgs does not exist
WARNING: /home/jovyan/.conda/pkgs does not exist
Cache location: 
There are no unused packages to remove
```

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
conda env export --no-builds | grep -v "^prefix: " > environment.yml
conda env export --from-history | grep -v "^prefix: " > environment.yml
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

## After installation cannot find command `conda`

https://github.com/conda/conda/issues/7980#issuecomment-441358406

```console
source ~/anaconda3/etc/profile.d/conda.sh
conda activate my_env
```


## [Install specific commit python library in env.yml](https://berkeley-stat159-f17.github.io/stat159-f17/lectures/06-conda-pip-environments..html) and [here](https://stackoverflow.com/questions/13685920/install-specific-git-commit-with-pip)

```
dependencies:
- pip:
    git+git://github.com/aladagemre/django-notification.git@2927346f4c513a217ac8ad076e494dd1adbf70e1
    git+git://github.com/aladagemre/django-notification.git@cool-feature-branch
    https://github.com/aladagemre/django-notification/archive/cool-feature-branch.tar.gz
    git+git://github.com/aladagemre/django-notification.git@v2.1.0
    
```


## Avoid conda activate/conda init+close terminal

```
# datasci-notebook
source /opt/conda/etc/profile.d/conda.sh && conda activate base
```

## [JupyterLab (semi)approved unofficial extensions](https://github.com/jupyterlab/team-compass/issues/52#issuecomment-618073188)

<details>
<summary>
The following are all unofficial jupyter labextensions:
</summary>

https://github.com/jupyterlab/jupyter-renderers
https://github.com/jupyterlab/jupyterlab_app
https://github.com/jupyterlab/jupyterlab_pygments
https://github.com/jupyterlab/jupyterlab-celltags
https://github.com/jupyterlab/jupyterlab-commenting
https://github.com/jupyterlab/jupyterlab-data-explorer
https://github.com/jupyterlab/jupyterlab-git
https://github.com/jupyterlab/jupyterlab-github
https://github.com/jupyterlab/jupyterlab-google-drive
https://github.com/jupyterlab/jupyterlab-hdf5
https://github.com/jupyterlab/jupyterlab-latex
https://github.com/jupyterlab/jupyterlab-metadata-service
https://github.com/jupyterlab/jupyterlab-monaco
https://github.com/jupyterlab/jupyterlab-mp4
https://github.com/jupyterlab/jupyterlab-shortcutui
https://github.com/jupyterlab/jupyterlab-telemetry
https://github.com/jupyterlab/jupyterlab-toc
https://github.com/jupyterlab/pull-requests

</details>


## [`pip/issues/5599`](https://github.com/pypa/pip/issues/5599)

```diff
- WARNING: pip is being invoked by an old script wrapper. This will fail in a future version of pip.
- Please see https://github.com/pypa/pip/issues/5599 for advice on fixing the underlying issue.
```
```sh
python -m pip  install docker
```
