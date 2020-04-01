# Useful bits and snippets for the Jo·vy·ans of the universe 


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


