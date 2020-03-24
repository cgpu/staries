# <img src="https://emojis.slackmojis.com/emojis/images/1531849430/4246/blob-sunglasses.gif?1531849430" alt="drawing" width="26"/>  swaggies
Awesome markdown trix and misc. snippets for docs-writing swag. 

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

