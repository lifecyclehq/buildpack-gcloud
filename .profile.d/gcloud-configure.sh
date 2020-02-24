#!/usr/bin/env bash

# Add gcloud to PATH
export PATH=/app/vendor/google-cloud-sdk/bin:/app/vendor/bin:$PATH

if [ -z $GOOGLE_CREDENTIALS ]; then
    echo "GOOGLE_CREDENTIALS not set"
else
    echo "$GOOGLE_CREDENTIALS" | base64 -d > /app/google-credentials.json
    gcloud auth activate-service-account --key-file /app/google-credentials.json
fi

# Set default project and compute zone
if [ ! -z $GOOGLE_HOST_PROJECT_ID ]; then
    gcloud config set project $GOOGLE_HOST_PROJECT_ID
fi

if [ ! -z $GOOGLE_HOST_ZONE ]; then
    gcloud config set compute/zone $GOOGLE_HOST_ZONE
fi
