
<!---


## 1.0.0

PR: https://github.com/cgpu/staries/pull/x

- Changes installation of THIS to conda install
- Fixes installation for tic, tac, toe (the artefacts we were using were removed from Bioconductor, CRAN so we had to change)

<details>
<summary> More details on individual commits: </summary>

-   Adds THIS in there.yml; Deletes redundant deps ff478bf00f05dddecf32260d8a0b6969673152c8

    Removes a lot of dependencies that were needed for installing this.
    Installing via conda constitutes these extra dependencies redundant,
    as they will be installed from the r-this recipe.

</details>

-->
