#!/bin/bash
source .env
echo $IMAGE_VERSION
# export CODE_VERSION=$(aws s3api head-object --region=il-central-1 --bucket $BUCKET_NAME --key dist.zip --query 'VersionId' --output text)
aws cloudformation update-stack --stack-name $1 \
     --template-body file://deploy/$1.yaml \
     --capabilities CAPABILITY_NAMED_IAM \
    --parameters ParameterKey=DockerRepoName,ParameterValue=$REPOSITORY_NAME ParameterKey=CodeVersion,ParameterValue=$IMAGE_VERSION \
     --region=il-central-1


#  --parameters ParameterKey=BucketName,ParameterValue=$BUCKET_NAME \
#    --parameters ParameterKey=BucketName,ParameterValue=$BUCKET_NAME ParameterKey=CodeVerion,ParameterValue=$CODE_VERSION \
#    --parameters ParameterKey=RepositoryName,ParameterValue=$REPOSITORY_NAME \
