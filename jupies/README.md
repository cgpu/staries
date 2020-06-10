# Useful bits and snippets for the Jo·vy·ans of the universe 

## [Can I customise the JupyterLab browser tab label?](https://github.com/jupyterlab/jupyterlab/issues/4422#issuecomment-382841157)

yes!

## [Is there a way to specify a jupyter lab extension in a conda env?](https://stackoverflow.com/questions/54186373/is-there-a-way-to-specify-a-jupyter-lab-extension-in-a-conda-env)

## [Which environment is your notebook running on?](https://stackoverflow.com/questions/37085665/in-which-conda-environment-is-jupyter-executing)

Type the following commands in the notebook shell:

```python
import sys
print(sys.executable)
```

## [Conda envs with JupyterLab notebooks via `nb_conda_kernels`](https://dwflanagan.github.io/2018-04-20-conda-envs-in-jupyter/)

## [Parse .ipynb for deps and export in env.yml](https://github.com/cgat-developers/conda-deps)

## Research website from jupyter notebooks (workflowr, packagedown etc concept)

https://github.com/stephenslab/ipynb-website

## List jupyterlab extensions

```
jupyter labextension list
```

## jupyter-theme (thy only one!) in JupyterLab 

- [x] Step 1: Install [Stylish](https://chrome.google.com/webstore/detail/stylish-custom-themes-for/fjnbnpbmkenffdnngjfgmeleoegfcffe/related) Chrome extension
- [x] Step 2: Install [JupyterLab theme with Stylish](https://userstyles.org/styles/178898/jupyter-lab-legos-light?utm_campaign=stylish_stylepage)

<img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" width="30"/> Check documentation at [dunovank/jupyter-themes](https://github.com/dunovank/jupyter-themes#themes-for-jupyter-lab)

<img src="http://g.recordit.co/XvNPTxzlU1.gif" width="600"/>

```
## :pause_button: `WIP` 

SO thread: [here](https://stackoverflow.com/questions/39604271/conda-environments-not-showing-up-in-jupyter-notebook)

```
source activate myenv
python -m ipykernel install --user --name myenv --display-name "Python (myenv)"
```
<img src="https://user-images.githubusercontent.com/38183826/78125183-906f6000-7408-11ea-8f01-2b01a0fb4439.png" width="500"/>


Other suggestions:
- SO thread on [`nb_conda`](https://stackoverflow.com/questions/52913748/how-to-choose-your-conda-environment-in-jupyter-notebook)
- SO thread on [`nb_conda_kernels`](https://stackoverflow.com/questions/39604271/conda-environments-not-showing-up-in-jupyter-notebook)

## Conda package manager UI

> *To install in the JupyterLab:*

```
conda install -c conda-forge jupyterlab=1 jupyter_conda
jupyter labextension install jupyterlab_toastify jupyterlab_conda
```
<img src="http://g.recordit.co/mFSUPrTX0o.gif" width="500"/>

## `font`:`Ayuthaya` :heart:

```js
# @JupyterLab: Settings > Terminal > User Preferences
    // Font family
    // The font family used to render text.
    "fontFamily": "Ayuthaya",

    // Font size
    // The font size used to render text.
    "fontSize": 15,    

```

## Roundtripping an .ipynb to .Rmd and back

Do not ommit `--update` see here:

```
jupytext --update --to Rmd jupyter.ipynb
jupytext --update --to ipynb jupyter.Rmd
```

## Launch classic notebook in JupyterLab

`Halp!` > `Launch Classic Notebook`

![](https://user-images.githubusercontent.com/38183826/77491131-d63e8e00-6e34-11ea-95c0-bb078ded18a4.png)

## Diff .ipynb with `nbdiff` from `nbdime` lib

![](https://user-images.githubusercontent.com/38183826/77492094-8ca37280-6e37-11ea-8da3-b8e77950eda8.png)

# R 


## Control the size of a plot

```r
options(repr.plot.width=6.5, repr.plot.height=4)
```



# Python 


- [ ] [Plots and interactive data tables](http://www.programmersought.com/article/7873512203/)



# General Utils

- Comment out multiple lines of code: <kbd>⌘</kbd>+<kbd>/</kbd>


# What's this? :thinking:

- https://github.com/jupyterhub/nbgitpuller
