export $(cat .env | xargs) > /dev/null 2>&1
docker buildx build --platform=linux/arm64 --provenance=false -t $DOCKER_IMAGE_NAME -f ./docker/Dockerfile ./src