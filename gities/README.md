# gities
Useful snippets for dangerous git missions :sunglasses:

- [PR from `unrelated-histories` (eg. template repo)](https://github.community/t5/How-to-use-Git-and-GitHub/How-to-deal-with-quot-refusing-to-merge-unrelated-histories-quot/td-p/12619)

```bash
git pull --allow-unrelated-histories
```

- [ "Peel off" latest commit](https://stackoverflow.com/questions/8225125/remove-last-commit-from-remote-git-repository/8225166)

```bash
git reset HEAD^ # remove commit locally
git push origin +HEAD # force-push the new HEAD commit
```

- [Change remote repo](https://stackoverflow.com/questions/2432764/how-to-change-the-uri-url-for-a-remote-git-repository)

```sh
git remote set-url origin https://github.com/cgpu/staries.git
```
