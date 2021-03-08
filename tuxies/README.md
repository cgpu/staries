# tuxies

### [Align tab seperated output with `column-t`]()

```log
# docker images --digests | grep sha | awk -v OFS="\t" -F " " '{$3=substr($3, 1, 14); print }' | column -t
cgpu/notebook                          latest                 sha256:e0095d2  e7c4481bed7d  6   hours   ago  970MB
hadolint/hadolint                      latest                 sha256:d3489ac  60ce59bdda63  5   days    ago  8.98MB
```

vs

```log
# docker images --digests | grep sha | awk -v OFS="\t" -F " " '{$3=substr($3, 1, 14); print }' 
cgpu/notebook   latest  sha256:e0095d2  e7c4481bed7d    6       hours   ago     970MB
hadolint/hadolint       latest  sha256:d3489ac  60ce59bdda63    5       days    ago     8.98MB
```



### Largest files
 
```
cd ~ && du -ah . | sort -rh | head -n 20
```
 
## [Rename files](https://unix.stackexchange.com/questions/33279/how-can-i-rename-multiple-files-by-removing-a-character-or-string)

```bash
for file in *unwanted-substring-from-filename*; do
    mv "$file" "${file/unwanted-substring-from-filename/}"
done
```

## [Kill task running in a specific port](https://stackoverflow.com/questions/11583562/how-to-kill-a-process-running-on-particular-port-in-linux)

```
kill -9 $(lsof -t -i tcp:8888)
```

## [Redirect both stdout and stderr in files]()

```bash
# If you want to log to the same file:

command1 >> log_file 2>&1

# If you want different files:

command1 >> log_file 2>> err_file
```

## [List recursively and retrieve full absolut path of all files](https://superuser.com/questions/595697/recursively-list-full-absolute-path-of-files-with-permissions-in-linux)

```bash
tree -ifpugDs dir/
```

## [List all directories sorted by size in descending order](https://stackoverflow.com/questions/51443182/list-all-directories-sorted-by-size-in-descending-order)

```sh
du -h * | sort -nr
```

## [Best practices shebang](https://stackoverflow.com/questions/10376206/what-is-the-preferred-bash-shebang)

```sh
#!/usr/bin/env bash

ls -l
```

## [CLI script with `-` flags](https://stackoverflow.com/questions/7069682/how-to-get-arguments-with-flags-in-bash/21128172)


Useful scripts, snippets and guidelines for common command line tasks

## [Match row that contains `name`](https://stackoverflow.com/questions/31745545/regex-match-line-containing-string)

```
.*name.*\n
```
## vscode: regex everything after =

```
\=(.*)
```

## vscode: regex everything after the last =

```
x=[^=]*$
```

## For loop to subsample
```
n_reads=10000

for fastq in ls *fastq ; seqtk sample -s12345 $fastq $n_reads  > head_${n_reads}_$fastq; done
```

## Print header as single column in csv

```
# print  |  1st row | replace , with \n     | first few rows
cat file |  head -1 | sed 's/,/\'$'\n''/g'  | head 
```


## Replace with sed and friends

```
# replace \n with ,
sed -z 's/\n/,/g'
paste -s -d ',' 

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
gzcat file.gz | head
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

- [To count occurrences of a character per line:](https://stackoverflow.com/questions/8629410/count-occurrences-of-character-per-line-field-on-unix)

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


## [Reset default Java version if 2 or more avail in system on CentOS](https://www.liquidweb.com/kb/install-java-8-on-centos-7/)

```shell
update-alternatives --config java
```


## Plink utils

```bash
for i in {1..22}; do
    plink --vcf chr${i}.vcf.gz --keep-allele-order --make-bed --out chr${i}
done


for i in {1..22}; do
    plink --bfile chr${i} --recode vcf-iid bgz --out chr${i}
done

 tabix -p vcf 
for i in {1..22}; do
    tabix -p vcf chr${i}.vcf.gz
done

bcftools index *gz

for i in {1..22}; do
    bcftools index chr${i}.vcf.gz
done


# https://www.biostars.org/p/306623/
for i in {1..22}
do
echo chr$i >> mergelist.txt
done
plink --merge-list mergelist.txt --allow-no-sex --make-bed --out hd_snps
```
