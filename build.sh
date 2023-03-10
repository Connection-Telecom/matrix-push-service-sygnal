#! /bin/bash

# Update this TAG for each new build...
TAG=0.1

PREFIX=registry.telviva.com:5000
IMAGE=matrix-push-service
FULL_IMAGE_NAME="$PREFIX/$IMAGE:$TAG"

echo "Starting build for ${FULL_IMAGE_NAME}..."
docker build --no-cache -t $FULL_IMAGE_NAME .

if [ $? -eq 0 ]; then
    echo "Build complete."
else
    echo "Build FAILED!"
    exit 1
fi

echo "Pushing to registry..."
docker push $FULL_IMAGE_NAME

if [ $? -eq 0 ]; then
    echo "Push complete."
else
    echo "Push FAILED!"
    exit 1
fi

echo "Successfully built and pushed $FULL_IMAGE_NAME"
