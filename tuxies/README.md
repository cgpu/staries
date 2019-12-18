# tuxies
Useful scripts, snippets and guidelines for common command line tasks

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
