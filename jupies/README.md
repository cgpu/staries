# Useful bits and snippets for the Jo·vy·ans of the universe


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


