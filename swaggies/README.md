# <img src="https://emojis.slackmojis.com/emojis/images/1531849430/4246/blob-sunglasses.gif?1531849430" alt="drawing" width="26"/>  swaggies
Awesome markdown trix and misc. snippets for docs-writing swag. 


## Sup and Sub 

<sup>I am a superscript</sup> <sub>I am a subscript</sub>

```
<sup>I am a superscript</sup> <sub>I am a subscript</sub>
```

## Random badgies

[![GitHub issues](https://img.shields.io/github/issues/cgpu/staries?color=green)](https://github.com/cgpu/staries/issues/new) <a href="https://hits.seeyoufarm.com"/><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FYinLiLin%2FCMplot"/></a>
=========

## Markdown swag, click & expand section

<details>
<summary>
This is what you see as description before expanding
</summary>
These
are
all
the
hidden
details.
TaDa!
    
</details>

```
<details>
<summary>
This is what you see as description before expanding
</summary>
These
are
all
the
hidden
details.
TaDa!
    
</details>
```

## [List with oh so many Github markdowns emojis](https://gist.github.com/rxaviers/7360908)
:bowtie: :neckbeard: :koala: :bug: :mushroom: :squirrel: :bamboo: :icecream:

## Make a gif of your terminal actions with `asciinema2gif` and friends

```bash
asciinema rec demo.json # ctrl+D

docker run --rm -v $PWD:/data asciinema/asciicast2gif https://asciinema.org/a/yxHxQyKeQLg5LlphmBLw5bD37.cast demo.gif
docker run --rm -v $PWD:/data asciinema/asciicast2gif https://asciinema.org/a/yxHxQyKeQLg5LlphmBLw5bD37 demo.gif
docker run --rm -v $PWD:/data asciinema/asciicast2gif demo.json demo.gif

```

## Capture a screenshot of your {iTerm, Terminal}

```
screencapture -l$(osascript -e 'tell app "iTerm" to id of window 1') test.png
screencapture -l$(osascript -e 'tell app "Terminal" to id of window 1') test.png

```

## Use a github repo to reference https:// links of assets (for docs etc_

Concept: https://github.com/mwouts/jupytext-screenshots


```bash
![](https://github.com/mwouts/jupytext-screenshots/raw/master/IntroducingJupytext/JupyterPyCharm.gif)
```


## Display images side by side

<p float="left"; align="middle">
  <img src="https://pythonforfinance.net/wp-content/uploads/2019/07/Jupyter.jpg" width="165" />
  <img src="https://brandslogos.com/wp-content/uploads/thumbs/docker-logo-vector.svg" width="100" />
</p>

```html
<p float="left"; align="middle">
  <img src="https://pythonforfinance.net/wp-content/uploads/2019/07/Jupyter.jpg" width="165" />
  <img src="https://brandslogos.com/wp-content/uploads/thumbs/docker-logo-vector.svg" width="100" />
</p>
```
