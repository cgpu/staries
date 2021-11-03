# gities
Useful snippets for dangerous git missions :sunglasses:


## Retrieve the files from a repo

### [List files of specific folder of repo of the latest commit of the default branch](https://stackoverflow.com/a/27433218)

```bash
svn ls https://github.com/cgpu/templates/trunk/inst/templates/nextflow/
```

### [Copy in the current working directory the files of specific folder of repo of the latest commit of the default branch](https://stackoverflow.com/a/27433218)

```bash
svn export --force  https://github.com/cgpu/templates/trunk/inst/templates/nextflow/ .
```

### Specific pypi lib to download specific files

http://githubdl.seso.io/

## Create GitHub PAT

[https://github.com/settings/tokens/new?scopes=repo,user,gist,workflow&description=R:GITHUB_PAT](https://github.com/settings/tokens/new?scopes=repo,user,gist,workflow&description=R:GITHUB_PAT)

## [`git cherry-pick` from other repo (hint: `remote add`)](https://coderwall.com/p/sgpksw/git-cherry-pick-from-another-repository)

## [`git cherry-pit`](https://sethrobertson.github.io/GitFixUm/fixup.html) (how to spit out an intermediate commit from your branh)

```
# Assuming that:
# 1. SHA you want to remove is this one e798989acda5d2d40f9d41dd0b5299da8746eda8
# 2. you are on a branch named my-feat-branch

git rebase -p --onto e798989acda5d2d40f9d41dd0b5299da8746eda8^ e798989acda5d2d40f9d41dd0b5299da8746eda8
git push --force origin my-feat-branch
```

## [Visualise git diff range .. or ...](https://stackoverflow.com/questions/7251477/what-are-the-differences-between-double-dot-and-triple-dot-in-git-dif/7256391#7256391)

## [Delete local and remote branch](https://www.freecodecamp.org/news/how-to-delete-a-git-branch-both-locally-and-remotely/)

```
# local
git branch -d feature-branch-name

# remote
git push origin --delete feature-branch-name
```

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

# If you wrote the upstream with a typo
git remote rm upstream

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

## [`git reset HEAD^` leaves behind untracked files (how to get rid of them)](https://stackoverflow.com/questions/4327708/git-reset-hard-head-leaves-untracked-files-behind)

```
git reset --hard && git clean -dfx
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


## [The shortest possible output from git log containing author and date](https://stackoverflow.com/questions/1441010/the-shortest-possible-output-from-git-log-containing-author-and-date)

```bash
git log --pretty=format:"%h%x09%an%x09%ad%x09%s"
```

## Get the user that created an org repo by proxy (initial commit author)

```
# if you want to verify it's the initial commit
git log --reverse --pretty=format:"%an%x09%s" | grep "Initial commit"| head -1 | cut -f1

# if you trust git log deeply
git log --reverse --pretty=format:"%an" | head -1
```

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

## Update author if an EC2 user

```
git commit --amend --author="cgpu <my-email-name@gmail.com>"
```

## Do not track _Changes not staged for commit:_ 

File by file:

```
git checkout -- <filename>
```
  
  
## Undo `git add`

```
git reset HEAD
```

## Rename old branch, push new name and delete old named branch in local and remote

```bash
prefix="adds-"
suffix="-data"

for i in $(git branch --all \
| cut -d "/" -f 3 \
| grep ${prefix} \
| grep -v HEAD \
); \
do \
echo  $i \
| sed "s/${prefix}//" \
| sed "s/${suffix}//" \
| grep -v "\*" \
>> branches.txt \
;
done 

for i in $(cat branches.txt \
| uniq) \
; \
do git checkout ${prefix}${i}${suffix} && \
git branch -m $i && \
git push origin -u $i && \
git push origin --delete  ${prefix}${i}${suffix} ; \
done
```

## Create and delete tag


```
TAG="my-tag"
git tag -d $TAG && git push --delete origin $TAG
git tag $TAG && git push origin $TAG
```
