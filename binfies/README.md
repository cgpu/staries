# binfies

Day to day commands for binfies 101 tasks

## Split plink .{bed,bim,fam} files to chromosomes

```
# get test data
wget https://www.staff.ncl.ac.uk/heather.cordell/quantfamdata.bed
wget https://www.staff.ncl.ac.uk/heather.cordell/quantfamdata.bim
wget https://www.staff.ncl.ac.uk/heather.cordell/quantfamdata.fam

# try the plink command
BFILE=quantfamdata
for i in $(seq 22); do plink --silent --bfile ${BFILE} --make-bed   --chr $i --out ${BFILE}.chr$i; done
```


## Split file in chunks of L lines (linux)


```bash
N=100
CHUNK_FILE_SUFFIX=1
split --numeric-suffixes --suffix-length=${CHUNK_FILE_SUFFIX} --lines=${L}
```


## Find L lines of each subset of file so that N chunks is the total subsetted files count

Useful for creating subsets of files to parallelise horizontally

```bash
FILE="/path/to/file.suffix"

# Given
N=100

# count lines of the file
TOTAL_LINES=`wc -l ${FILE} | awk -F " " '{print $1}'`
L=`echo $(( $TOTAL_LINES / $N))`
```

