# Simple and nifty commands to manage with `conda`


## [Export activated conda environment in a file](https://stackoverflow.com/questions/56472295/can-you-export-a-created-python-conda-environment-for-others-to-activate-on-thei)

```bash
conda env export | grep -v "^prefix: " > environment.yml
```
