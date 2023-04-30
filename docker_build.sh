#!/bin/bash
export PROJECT_ID=$(gcloud config list project --format "value(core.project)")
export REPO_NAME=juamiocf-dft-container-0
export IMAGE_NAME=juamiocfdft
export IMAGE_TAG=v0-3
export IMAGE_URI=us-east4-docker.pkg.dev/${PROJECT_ID}/${REPO_NAME}/${IMAGE_NAME}:${IMAGE_TAG}

docker build -f Dockerfile -t ${IMAGE_URI} ./
