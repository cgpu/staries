# Rmdies
A collection of utility functions for Rmarkdowns and R in geneRal.

# [Hack to only recompile R code in Rccppackages](https://discourse.mc-stan.org/t/devtools-install-local-true-always-re-compiles/10083)

> You can use `devtools::document()` to recompile the R side of the code: this should not trigger a recompilation (you can use `devtools::clean_dll()` followed by `devtools::load_all()` to recompile the Stan/C++ code without installing the package).


# Detach a package

```R
detach("package:babynames", unload=TRUE)
```

# [Load many packages with `lapply()`](https://stackoverflow.com/questions/8175912/load-multiple-packages-at-once)

```R
x <- c("Rfast", "Rclean")
invisible(lapply(x, library, character.only = TRUE))
```

# [Center a la blog Rmd title courtesy of Pimp My Rmd](https://github.com/holtzy/R-Markdown-Parallax/blob/e0af56699819532ab26d5b8295a6796da1097d6c/index.Rmd#L1-L10)

```Rmd
---
title: "<center><div class='mytitle'>R Markdown output with parallax</div></center>"
author: "<center><div class='mysubtitle'>See the code on [github](https://github.com/holtzy/R-Markdown-Parallax). This tip is part of my [Pimp my RMD](https://holtzy.github.io/Pimp-my-rmd/) project.</div></center>"
output:
  html_document:
      css: style.css
      toc: FALSE
      includes: 
        before_body: header.html
---

```

# [Parameterised Rmd with title from param value](https://stackoverflow.com/questions/31861569/setting-document-title-in-rmarkdown-from-parameters)

```Rmd
---
output: html_document
params:
  pres_author: "Me"
  pres_subject:  "doggos!"
author: "`r params$pres_author`"
title: "`r paste0('R Markdown Presentation for ', params$pres_subject)`"
---
```

# `lintr::lint` your R script:

```
# devtools::install_github("jimhester/lintr")
lintr::lint("script.R")
```
# Check if TRUE (aka both TRUE and logical)

```r
((( isTRUE(arg) && is.logical(arg)))
```

# [Set up your Rmd with  ` ```{r setup, include=FALSE}`](https://juliasilge.com/blog/intro-tidymodels/)

```R
```{r setup, include=FALSE}
library(knitr)
knitr::opts_chunk$set(cache = TRUE, warning = FALSE, message = FALSE, 
                      echo = TRUE, dpi = 300, cache.lazy = FALSE,
                      tidy = "styler", fig.width = 8, fig.height = 5)
` ``

```

# [Multiple Rmd rendered as one document](https://stackoverflow.com/questions/25824795/how-to-combine-two-rmarkdown-rmd-files-into-a-single-output)


```r
---  
title: My Report  
output: 
  pdf_document:
    toc: yes 
---

```{r child = 'chapter1.Rmd'}
``` `

```{r child = 'chapter2.Rmd'}

``` `

```




# No sudo? No problem! `--ubuntu`

This one is really handy when building containers, or installing in a non-interactive manner in general (VMs or setting up environments).

In `ubuntu` environments, the command `install.packages` of any flavour (eg. from `{devtools}`, `{remotes}`) might yield the following:


```diff
- devtools::install_github("devs-repo/neat-package") 
  Downloading GitHub repo devs-repo/neat-package@master
- sh: 1: /bin/gtar: not found
- sh: 1: /bin/gtar: not found
  Error: Failed to install 'neat-package' from GitHub:
  error in running command
  In addition: Warning messages:
  1: In system(cmd) : error in running command
- 2: In utils::untar(tarfile, ...) :
-  ‘/bin/gtar -xf '/tmp/Rtmpefbfe6/file1106465cec01.tar.gz' -C '/tmp/Rtmpefbfe6/remotes110647b47776'’ returned error code 127
  
```

Fear not, this is because of the `gtar` :guitar: quirk above - there's no such thing as `gtar`, it meant `tar`.
I have found the fix [here](https://github.com/r-dbi/RPostgres/issues/110);

**tl;dr** if you don't have `sudo`, execute the following before attempting to install packages:

```r
Sys.setenv(TAR = "/bin/tar")
```
or

```bash
export TAR="/bin/tar"
```


# Handy one-lineRs:

## Using {containerit} to create Dockerfiles from R

### `sessionInfo()`: Capture/Export R session dependencies into a Dockerfile

```r
sessionInfo <- sessionInfo()
file        <- tempfile(tmpdir = tempdir(), fileext = ".RData")
save(sessionInfo, file = file)
my_dockerfile <- containerit::dockerfile(from = file)
containerit::write(my_dockerfile, file = "Dockerfile")
```

### `load_package.R`: Capture/Export R session dependencies into a Dockerfile

```r
my_dockerfile <- containerit::dockerfile(from = "load_packages.R")
containerit::write(my_dockerfile, file = "Dockerfile")
```

where `"load_packages.R"` looks like this:

```
$ cat load_packages.R
library('topGO')
.
.
.
library('topGO')
```

## Check all the rows that contain missing values

```r
library(dplyr)
devtools::source_url('https://raw.githubusercontent.com/cgpu/xPanDaR/master/R/prepare_missingness_absence_presence_graph.R')
prepare_missingness_absence_presence_graph(dplyr::filter_all(naniar::riskfactors, any_vars(is.na(.))) ,   ts_id = 'sex' ) + coord_flip() + theme(axis.text.x = element_text(angle = 50, hjust = 1))
```

![](https://user-images.githubusercontent.com/38183826/71454544-45024180-2789-11ea-8840-5e10736c3ad0.png)

## `tree` the working directory and see the full path for it
```r 
fs::dir_tree(here::here())
```


## "_Sometimes you just want a project-less RStudio session_"

Working POW*-less sometimes might be useful, here's how to open a project less R session in Rstudio

```r
rstudioapi::terminalExecute("open -n /Applications/RStudio.app", show = FALSE)
```

> \* MandatoRy reads about __POW__ (__P__ roject __O__ riented __W__ orkflows):
- [Sometimes you just want a project-less RStudio session, @mine-cetinkaya-rundel](http://www.citizen-statistician.org/2019/08/sometimes-you-just-want-a-project-less-rstudio-session/)
- [Project Oriented Workflows, @jennybryan](https://twitter.com/jennybryan/status/1100990749468839936?lang=en)


## [`{think-r/remedy}`](https://github.com/ThinkR-open/remedy) R package 📦

Because some people understand! This is the most awesome thing ever!

![](https://github.com/ThinkR-open/remedy/raw/master/reference/figures/align.gif)


## Centers text, Rmd output 

source: https://stackoverflow.com/questions/40414270/r-how-to-center-output-in-r-markdown

```css
\begin{center} 
... 
\end{center}
```


## Control width of image generated by r block in Rmd

Blog source: [Tips and tricks for working with images and figures in R Markdown documents](http://zevross.com/blog/2017/06/19/tips-and-tricks-for-working-with-images-and-figures-in-r-markdown-documents/)
SO source: [How to set size for local image using knitr for markdown?](https://stackoverflow.com/questions/15625990/how-to-set-size-for-local-image-using-knitr-for-markdown)

```r

```{r,  out.width = "100%"
library(ggfortify)
library(ggplot2)

df <- iris[c(1, 2, 3, 4)] # omitting categorical variable
gg <- ggplot2::autoplot(prcomp(df), data = iris, color = 'Species')
gg

```

# Misc.

Aka low priority swag.

## Progress bar with % for forloops with [svMisc](https://github.com/SciViews/svMisc)::progress()

source: https://medium.com/human-in-a-machine-world/displaying-progress-in-a-loop-or-function-r-664796782c24
fork of [yahwes/print_progress.R](https://gist.github.com/cgpu/8a0e59f47c9c2b12778548d92f6b52a3)

```r
for (i in 0:101) {
  svMisc::progress(i)
  Sys.sleep(0.01)
  if (i == 101) cat("Done!\n")
}
```

![](https://miro.medium.com/max/1920/1*ub0fPkJnHYidpAkPSuPC1A.gif)

# [{bsselect} x Rmd](https://walkerke.github.io/2016/12/rmd-dropdowns/)


# [Compare dataframes by @sharlagelfand](https://sharla.party/post/comparing-two-dfs/)

```r
dplyr::all_equal(d1, d2)
janitor::compare_df_cols(d1,d2 , return = "mismatch") # no mismatch
vetr::alike(d1,d2)
testthat::expect_equal(d1,d2)
diffdf::diffdf(d1,d2)
visdat::vis_compare(d1, d2)
```

## [Try to install SAIGE with conda:](https://github.com/weizhouUMICH/SAIGE/issues/118#issue-514008206)

```
conda create -n RSAIGE8 r-essentials r-base=3.6.1 python=2.7
conda activate RSAIGE8
conda install -c anaconda cmake
conda install -c conda-forge gettext lapack r-matrix
conda install -c r r-rcpp  r-rcpparmadillo r-data.table r-bh
conda install -c conda-forge r-spatest r-rcppeigen r-devtools  r-skat
conda install -c bioconda r-rcppparallel r-optparse
conda install -c anaconda boost zlib
pip install cget click

FLAGPATH=`which python | sed 's|/bin/python$||'`
export LDFLAGS="-L${FLAGPATH}/lib"
export CPPFLAGS="-I${FLAGPATH}/include"

# Using method 3
# Open R and install package MetaSKAT
> install.packages('MetaSKAT')
# exit R and run bellow command
src_branch=master
repo_src_url=https://github.com/weizhouUMICH/SAIGE
git clone --depth 1 -b $src_branch $repo_src_url
R CMD INSTALL SAIGE

# Using by method 2
# open R and run (choose 3 no update any packages): 
devtools::install_github("weizhouUMICH/SAIGE") 
```


## Get libs

```R
Rscript -e "scripts <- list.files('.', pattern = '.R|.Rmd', recursive = TRUE); dput(unique(unlist(lapply(scripts, Rclean::get_libs))))"
Rscript -e "scripts <- list.files('.', pattern = '.R$ |.Rmd$', recursive = TRUE); dput(unique(unlist(lapply(scripts, Rclean::get_libs))))"
```


## IQR filtering the elbow grease way

```
# This is a matrix with rownames
h <- read.csv("IQR.csv", header = TRUE, sep = ",")
h <- as.matrix(h)
h
# Here we calculate the standard deviation across rows (1 for rows in apply)
vars <- apply(h, 1, sd)
vars
# Here we apply elbow grease quantile filtering
filtered <- h[vars > quantile(vars, 0.75, na.rm = TRUE), ] 
filtered
```
