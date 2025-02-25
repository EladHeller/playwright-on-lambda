source .env

export IMAGE_VERSION=dusyvkuyfd
echo IMAGE_VERSION=$IMAGE_VERSION
aws ecr get-login-password --region il-central-1 | \
docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.il-central-1.amazonaws.com && \
docker buildx build --platform=linux/amd64 --provenance=false -t $DOCKER_IMAGE_NAME:$IMAGE_VERSION -f ./docker/Dockerfile ./src && \
docker tag $DOCKER_IMAGE_NAME:$IMAGE_VERSION $AWS_ACCOUNT_ID.dkr.ecr.il-central-1.amazonaws.com/$REPOSITORY_NAME:$IMAGE_VERSION && \
docker push $AWS_ACCOUNT_ID.dkr.ecr.il-central-1.amazonaws.com/$REPOSITORY_NAME:$IMAGE_VERSION
