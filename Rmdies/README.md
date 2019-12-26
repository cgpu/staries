# Rmdies
Rmdies: A collection of utility functions for Rmarkdowns


# Handy one-lineRs:

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
