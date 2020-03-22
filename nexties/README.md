# NextFlow snippets, patterns or groovy handy functions


## Fetch all avail cpus in config `Runtime.runtime.availableProcessors()`

```groovy
Runtime.runtime.availableProcessors()
```

## if exit in one line without curlies

```groovy
if (!params.check) exit 1, 'You have successfully one-linered your way to if'
```
## [containsKey()](https://www.tutorialspoint.com/groovy/groovy_containskey.htm)

```
# https://github.com/cgpu/sarek/blob/501a5becfbc2f5f78e923aa02013c2739f3f4b17/create_pon.nf#L59

`containsKey()`
```
returns boolean


## [The Elvis operator `?:`](https://mrhaki.blogspot.com/2009/08/groovy-goodness-elvis-operator.html) 🕺🏻

```groovy
def sampleText
 
// Normal ternary operator.
def ternaryOutput = (sampleText != null) ? sampleText : 'Hello Groovy!'
 
// The Elvis operator in action. We must read: 'If sampleText is not null assign
// sampleText to elvisOuput, otherwise assign 'Viva Las Vegas!' to elvisOutput.
def elvisOutput = sampleText ?: 'Viva Las Vegas!'
```
