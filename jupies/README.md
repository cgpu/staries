# Useful bits and snippets for the Jo·vy·ans of the universe


### Roundtripping an .ipynb to .Rmd and back

Do not ommit `--update` see here:

```
jupytext --update --to Rmd jupyter.ipynb
jupytext --update --to ipynb jupyter.Rmd
```

## R 


### Control the size of a plot

```r
options(repr.plot.width=6.5, repr.plot.height=4)
```



## Python 


