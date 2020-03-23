# Day to day awscli commands


## List a sum of objects in bucket sub-area

```bash
# [i]
 aws s3 ls s3://belinda-queenmary --recursive --human-readable --summarize | awk '{$1=$1}1' | tail -n 2

```

```
# [o]
Total Objects: 2328
Total Size: 47.3 MiB
```
