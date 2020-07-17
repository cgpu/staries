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


# Useful AWS console links

- https://aws.amazon.com/well-architected-tool/
= https://aws.amazon.com/big-data/datalakes-and-analytics/
- https://console.aws.amazon.com/billing/
- https://aws.amazon.com/solutions/case-studies/
- https://aws.amazon.com/solutions/consulting-offers/
- https://aws.amazon.com/solutions/
- https://aws.amazon.com/quickstart/
- https://aws.amazon.com/quickstart/biotech-blueprint/nextflow/
- https://github.com/aws-quickstart/quickstart-nextflow
- https://github.com/aws-samples/aws-genomics-workflows/blob/master/src/templates/nextflow/nextflow-aio.template.yaml
- https://aws.amazon.com/architecture/icons/
- https://aws.amazon.com/architecture/?solutions-all.sort-by=item.additionalFields.sortDate&solutions-all.sort-order=desc&whitepapers-main.sort-by=item.additionalFields.sortDate&whitepapers-main.sort-order=desc&reference-architecture.sort-by=item.additionalFields.sortDate&reference-architecture.sort-order=desc
- https://aws.amazon.com/solutions/implementations/genomics-tertiary-analysis-and-data-lakes-using-aws-glue-and-amazon-athena/?did=sl_card&trk=sl_card
