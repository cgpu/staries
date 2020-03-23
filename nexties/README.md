# NextFlow snippets, patterns or groovy handy functions

## Optional issues

```groovy
# optional-input
params.inputs = 'prots/*{1,2,3}.fa'
params.filter = 'NO_FILE'

prots_ch = Channel.fromPath(params.inputs)
opt_file = file(params.filter)

process foo {
  input:
  file seq from prots_ch
  file opt from opt_file

  script:
  def filter = opt.name != 'NO_FILE' ? "--filter $opt" : ''
  """
  your_commad --input $seq $filter
  """
}
```


## Set threads pool
> Dataflow threads pool get exhausted with a large number of tasks

```
-Dnxf.pool.type=sync -Dnxf.pool.maxThreads=2000

```


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
