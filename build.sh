#!/usr/bin/env sh

apk add -q --no-progress aws-cli docker
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
build_status=$(build)  # Run build command and capture its return status
echo "$build_status" > build_status.txt  # Write the return status to a file

# docker tag image "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_NAME:$IMAGE_TAG"
# docker push "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_NAME:$IMAGE_TAG"