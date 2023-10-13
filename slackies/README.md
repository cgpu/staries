## Documentation

### Automate bulk deletion of Slack drafts

Found here: https://gist.github.com/ScottMaclure/80adda47040b039965248289c37cfe8b

```console
(async function(x) {
    for (let e = document.querySelector('[type="trash"]'); e != null; e = document.querySelector('[type="trash"]')) {
        e.click(); 
        await new Promise(resolve => setTimeout(resolve, 500))
        document.querySelector('[data-qa="drafts_page_draft_delete_confirm"]').click();
        await new Promise(resolve => setTimeout(resolve, 1500))
    }
})();
```
