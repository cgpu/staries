

# pythies  <img src="https://raw.githubusercontent.com/cgpu/staries/master/assets/logos/python.png?raw=true" alt="drawing" width="24"/></a>

A collection of utility functions for ipynb and python in general.


## [(Easy way to) Run a function from the command line](https://stackoverflow.com/questions/3987041/run-function-from-the-command-line)

```python
def myfunction(mystring):
    print mystring


if __name__ == '__main__':
    globals()[sys.argv[1]](sys.argv[2])
```

> This way, running python myscript.py myfunction "hello" will output hello.


## [Convert html to ipynb](https://stackoverflow.com/questions/28972614/ipython-notebook-convert-an-html-notebook-to-ipynb)

See [here](pythies/py/html2ipynb.py)


## [Fix: AtributeError: 'module' object has no attribute 'plt' - Seaborn](https://stackoverflow.com/questions/45070959/atributeerror-module-object-has-no-attribute-plt-seaborn)

```diff

+ import matplotlib.pyplot as plt

- sns.plt.show()
+ plt.show()ss
```