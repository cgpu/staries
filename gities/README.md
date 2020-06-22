# gities
Useful snippets for dangerous git missions :sunglasses:

## Hash of latest commit

```
git rev-parse HEAD
```

## [Peek :eyes: branch creation date](https://stackoverflow.com/questions/2255416/how-to-determine-when-a-git-branch-was-created)

```shell
git checkout my-branch-of-interest
git log  --no-walk --decorate
```

## Save yourself from `emacs` and/or [`vim`](https://twitter.com/aarondjents/status/1152994105875714048) :smiling_imp:

```bash
git config --global core.editor nano
```

## Save yourself from :flushed: typos in commit messages

```bash
git commit -amend

```
## Sync your fork with upstream

```
git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git

# to catch up with latest changes:
git pull upstream master
```

## [ Change default color of ignored files](https://stackoverflow.com/questions/12255028/how-to-show-git-colors-on-zsh) 

### How my ~/.gitconfig looks like:

```console

[color]
  diff = auto
  status = auto
  branch = auto
  
[color "status"]
  changed = yellow
  added = green
  untracked = red
  ignored = yellow
```

## How my ignored files look like

<img src="https://user-images.githubusercontent.com/38183826/73766737-61bd6c00-476e-11ea-9c5a-e2be706cdbd0.png" alt="drawing" width="400"/></a>

## [PR from `unrelated-histories` (eg. template repo)](https://github.community/t5/How-to-use-Git-and-GitHub/How-to-deal-with-quot-refusing-to-merge-unrelated-histories-quot/td-p/12619)

```bash
git pull --allow-unrelated-histories
```

## [ "Peel off" latest commit](https://stackoverflow.com/questions/8225125/remove-last-commit-from-remote-git-repository/8225166)

```bash
git reset HEAD^ # remove commit locally
git push origin +HEAD # force-push the new HEAD commit
```

## [Change remote repo](https://stackoverflow.com/questions/2432764/how-to-change-the-uri-url-for-a-remote-git-repository)

```sh
git remote set-url origin https://github.com/cgpu/staries.git
```

## Check the history of your commits 

|what|command|showme|
|:----------:|:--------:|:--------:|
| short hash |    `git log --oneline`|<img src="https://user-images.githubusercontent.com/38183826/77423232-bb353500-6dc6-11ea-9de7-f40aea92d614.png" alt="drawing" width="400"/></a> |
|  full hash|`git log --pretty=oneline` |<img src="https://user-images.githubusercontent.com/38183826/77423274-cd16d800-6dc6-11ea-987d-7db50e128dbd.png" alt="drawing" width="400"/></a>|
|  full hash|`git log --graph` |<img src="https://user-images.githubusercontent.com/38183826/77443201-d2821b80-6de2-11ea-8969-811d6a84515f.png" alt="drawing" width="400"/></a>|


# Bonus edition: TIL

## [TIL what a foxtrot merge is (and why one shouldn't do it)](https://bit-booster.blogspot.com/2016/02/no-foxtrots-allowed.html)


## [Update origin with branches created in upstream after forking](https://stackoverflow.com/questions/10312521/how-to-fetch-all-git-branches)


## [Ultra shallow git clone (1 commit)](https://www.techiedelight.com/clone-git-repository-with-specific-revision/)

```
mkdir staries-shallow
cd staries-shallow
git init
git remote add origin https://github.com/cgpu/staries.git
git fetch origin a4e25b0cd7c0382400d1d37d9283dfca9027564d
git reset --hard FETCH_HEAD
```


## Follow specific files git history

```
git log --pretty=oneline  --follow -- jupyter/figure3.ipynb  
#or  
git log  --follow -- jupyter/figure3.ipynb

# or ninja style 
# from here: https://stackoverflow.com/questions/1441010/the-shortest-possible-output-from-git-log-containing-author-and-date
git log --date=short --pretty="%C(Yellow)%h  %C(reset)%ad (%C(Green)%cr%C(reset))%x09 %C(Cyan)%an : %C(reset)%s" --follow -- jupyter/figure3.ipynb
```
