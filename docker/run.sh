source .env
docker run --platform linux/arm64 -d -v ~/.aws-lambda-rie:/aws-lambda -p 9000:8080 \
    --entrypoint /aws-lambda/aws-lambda-rie \
    $DOCKER_IMAGE_NAME \
    /usr/local/bin/npx aws-lambda-ric index.handler