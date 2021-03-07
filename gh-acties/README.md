# GitHub Actions notes  <img src="https://avatars0.githubusercontent.com/u/44036562?s=200&v=4"  width="25"> 

## [Create frugal best practice token for ghcr.io or docker.pkg.github.com ](https://docs.github.com/en/free-pro-team@latest/packages/getting-started-with-github-container-registry/migrating-to-github-container-registry-for-docker-images)


https://github.com/settings/tokens/new?scopes=write:packages&description=GITHUB_CR_WRITE_PACKAGES


## [Dump github context](https://github.community/t/how-to-trigger-different-action-only-on-merge/18260/2)

```yaml
  build:
    name: Testing
    runs-on: ubuntu-latest
    steps:
      - name: Dump GitHub context
        env:
          GITHUB_CONTEXT: ${{ toJson(github) }}
        run: echo "$GITHUB_CONTEXT"
```


## If: push to master

```yaml
      - name: Re-tag prod images from pr cached and push
        if: github.event_name == 'push' && github.ref == 'refs/heads/master'
```
