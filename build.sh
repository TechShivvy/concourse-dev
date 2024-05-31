#!/usr/bin/env sh

apk add -q --no-progress aws-cli docker
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
build  # Run build command
build_status=$?  # Capture the exit status of the build command

if [ $build_status -eq 0 ]; then
    echo "Success" > build_status/build_status.txt
else
    echo "Failure" > build_status/build_status.txt
fi

# Append metadata to the file
echo "Job Name: \$BUILD_JOB_NAME" >> build_status/build_status.txt
echo "Pipeline Name: \$BUILD_PIPELINE_NAME" >> build_status/build_status.txt
echo "Created By: \$BUILD_CREATED_BY" >> build_status/build_status.txt

echo "BUILD_ID = $BUILD_ID"
echo "BUILD_NAME = $BUILD_NAME"
echo "BUILD_JOB_NAME = $BUILD_JOB_NAME"
echo "BUILD_PIPELINE_NAME = $BUILD_PIPELINE_NAME"
echo "BUILD_PIPELINE_INSTANCE_VARS = $BUILD_PIPELINE_INSTANCE_VARS"
echo "BUILD_TEAM_NAME = $BUILD_TEAM_NAME"
echo "BUILD_CREATED_BY = $BUILD_CREATED_BY"
echo "ATC_EXTERNAL_URL = $ATC_EXTERNAL_URL"


# docker tag image "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_NAME:$IMAGE_TAG"
# docker push "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_NAME:$IMAGE_TAG"