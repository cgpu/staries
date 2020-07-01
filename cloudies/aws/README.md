# Day to day awscli commands


## List a sum of objects in bucket sub-area

```bash
# [i]
 aws s3 ls s3://my-bucket/some-object/ --recursive --human-readable --summarize | awk '{$1=$1}1' | tail -n 2

```

## 

```
aws ec2 describe-vpcs 
aws iam list-access-keys --region eu-west-1 --profile potent
```


```
# [o]
Total Objects: 2328
Total Size: 47.3 MiB
```


