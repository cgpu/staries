# NextFlow snippets, patterns or groovy handy functions

## Linux dependencies for alpine images

```
awk
bash
ps # procps
date
sed
grep
egrep
tail
```

## If ecr container needed
https://github.com/nextflow-io/nextflow/issues/45#issuecomment-498549201

## gcloud errorStrategy for preemptible machines

```groovy
     errorStrategy = { task.exitStatus in [3,8,10,14] ||  task.attempt <=  6 ? 'retry' : 'ignore' }
```

## `publishDir` : `copyNoFollow` 

see `nextflow/issues/592`

## [publishDir](https://github.com/nextflow-io/nextflow/issues/256#issuecomment-285087760)

```groovy
 publishDir '.', saveAs: { it == "foo.*" ? "foos/$it" : "bars/$it" }

```

## Optional output

```groovy
output:
    file("foo") optional true into ch_ontologizer_a3ss
```

## Optional input

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

## Fetch .png image from url and save as local file in current workdir

### [1. `.withOutputStream` ](https://stackoverflow.com/questions/4674995/groovy-download-image-from-url)
```groovy
public void download_img(def address) {
  new File("${address.tokenize('/')[-1]}").withOutputStream { out ->
      new URL(address).withInputStream { from ->  out << from; }
  }
}


download_img("https://raw.githubusercontent.com/groovy/artwork/master/medium.png") 
```

### [2. `.guessContentTypeFromStream`](https://stackoverflow.com/questions/4674995/groovy-download-image-from-url)

```groovy
def download_img (String url, String filename) {
    content = url.toURL().getBytes()
    ext=URLConnection.guessContentTypeFromStream(new ByteArrayInputStream(content)).replaceFirst("^image/","")
    new File(filename+"."+ext).setBytes(content)
}

download_img("https://raw.githubusercontent.com/groovy/artwork/master/medium.png", "groovy_logo") 
```

## [Fetch text file from url and save as local file in current workdir](https://gist.github.com/cgpu/0c041b39708a7c9d1cfe1fcd859a4687)

```
new File("output.txt") << new URL ("http://some.url/some/path.txt").getText()
```


## [Execute shell command from groovy](https://stackoverflow.com/questions/2701547/how-to-make-system-command-calls-in-java-groovy)


```shell
groovy -e 'print "touch file_made_from_groovy_using_shell.txt".execute()'
```

or 

```groovy
"touch file_made_from_groovy_using_shell.txt".execute()
```
