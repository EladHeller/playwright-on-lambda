export $(cat .env | xargs) > /dev/null 2>&1

cd src && \
npm ci && \
cd .. && \
zip -rq dist.zip src && \
aws s3 cp dist.zip s3://$BUCKET_NAME/dist.zip && \
rm dist.zip