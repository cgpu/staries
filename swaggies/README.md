# <img src="https://emojis.slackmojis.com/emojis/images/1531849430/4246/blob-sunglasses.gif?1531849430" alt="drawing" width="26"/>  swaggies
Awesome markdown trix and misc. snippets for docs-writing swag. 

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



