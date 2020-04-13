# Rmdies > blogdown
A collection of utility functions for blogdown deployment and maintenance

# [Update security risks](https://stackoverflow.com/questions/53115859/how-to-update-a-dependency-in-package-lock-json)

```bash
git clone https://github.com/cgpu/{{my-awesome-blogdown-repo}}.git
cd {{my-awesome-blogdown-repo}}/themes/{{the-theme-name}}

# You don't need to edit the lock file by hand, just run:
npm install --package-lock-only url-parse
```

```console
Example output
+ url-parse@1.4.7
added 60 packages and audited 60 packages in 2.152s
found 24 vulnerabilities (23 low, 1 moderate)
 run `npm audit fix` to fix them, or `npm audit` for details
```

```bash
# fix
npm audit fix
```

```console
# Example output
up to date in 3.682s
fixed 24 of 24 vulnerabilities in 60 scanned packages
```

```
git status
git add package-lock.json package.json
git commit -m ' ' ... etc
```

Recap:

![](https://github.com/cgpu/staries/raw/master/assets/Rmdies/blogdown/fix.gif)