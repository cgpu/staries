# tuxies

Useful scripts, snippets and guidelines for common command line tasks

## Replace with sed

```
# replace \n with ,
sed -z 's/\n/,/g'

# replace , with \n
sed 's/,/\'$'\n''/g' 
```

## Sum of file size in directory

```
du -ch *.txt | grep total
```

## Replace pattern of all filenames in directory

```
# replace foo with bar
# SO: https://stackoverflow.com/questions/9393607/find-and-replace-filename-recursively-in-a-directory
find -name "*foo*.filetype" -exec rename 's/foo/bar/' {} ";"
```

## [zcat/gzcat works in linux, not on osx.](https://serverfault.com/questions/570024/zcat-gzcat-works-in-linux-not-on-osx-general-linux-osx-compatibility)

```bash
zcat < foo.txt.gz 
```

## [Keep the line after pattern match](https://stackoverflow.com/questions/5346896/print-everything-on-line-after-match)

```bash
# eg name: conda_env
sed -n 's/name: //p' filename
```

- [To round the result of a `mathlib` supported operation (using `bc`):](https://askubuntu.com/questions/179898/how-to-round-decimals-using-bc-in-bash)

```console
wwooo! I am the console!
```

```nextflow
// time and mem errors are in the range 137-140
{ task.exitStatus >= 140 ? 'ignore' : 'terminate' }

// exponential backoff retry strategy 
errorStrategy { sleep(Math.pow(2, task.attempt) * 200); return 'retry' }
```

```bash
#!/bin/sh
bcr()
{
    echo "scale=$2+1;t=$1;scale-=1;(t*10^scale+((t>0)-(t<0))/2)/10^scale" | bc -l
}

# Example usage:
>_ bcr '0.666666+1' 0

# Result:
1
```

- [To count occurences of a character per line:](https://stackoverflow.com/questions/8629410/count-occurrences-of-character-per-line-field-on-unix)

```bash
awk -F 't' '{print NF-1, NR}'  input.txt
```


- [To select columns of a dataframe by name in bash:](https://unix.stackexchange.com/questions/25138/how-to-print-certain-columns-by-name)

Requirements:

```
pip install csvkit
```

```bash
cat test.csv

# outputs:
#id,age
#1,50
#2,70
```

```bash
csvcut -c "age"
# outputs:

#age
#50
#70
```
```bash
csvcut -c "id,age" test.csv | csvlook
# outputs:

| id | age |
| -- | --- |
|  1 |  50 |
|  2 |  70 |
```

which looks like a table:

| id | age |
| -- | --- |
|  1 |  50 |
|  2 |  70 |


- [To write the output of a command to a file, there are basically 10 commonly used ways](https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file)

```
          || visible in terminal ||   visible in file   || existing
  Syntax  ||  StdOut  |  StdErr  ||  StdOut  |  StdErr  ||   file   
==========++==========+==========++==========+==========++===========
    >     ||    no    |   yes    ||   yes    |    no    || overwrite
    >>    ||    no    |   yes    ||   yes    |    no    ||  append
          ||          |          ||          |          ||
   2>     ||   yes    |    no    ||    no    |   yes    || overwrite
   2>>    ||   yes    |    no    ||    no    |   yes    ||  append
          ||          |          ||          |          ||
   &>     ||    no    |    no    ||   yes    |   yes    || overwrite
   &>>    ||    no    |    no    ||   yes    |   yes    ||  append
          ||          |          ||          |          ||
 | tee    ||   yes    |   yes    ||   yes    |    no    || overwrite
 | tee -a ||   yes    |   yes    ||   yes    |    no    ||  append
          ||          |          ||          |          ||
 n.e. (*) ||   yes    |   yes    ||    no    |   yes    || overwrite
 n.e. (*) ||   yes    |   yes    ||    no    |   yes    ||  append
          ||          |          ||          |          ||
|& tee    ||   yes    |   yes    ||   yes    |   yes    || overwrite
|& tee -a ||   yes    |   yes    ||   yes    |   yes    ||  append

```
