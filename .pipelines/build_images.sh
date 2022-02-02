#!/usr/bin/env bash
echo "---------------------------------------"
printenv | grep GITHUB_REF
echo "---------------------------------------"
sleep 2
set -exu
DOCKER_IMAGE_VERSION=$(echo ${GITHUB_REF} | sed -e "s/refs\/heads\///g")

if [ "${DOCKER_IMAGE_VERSION}" == "master" ]; then
  DOCKER_IMAGE_VERSION="latest"
fi;


if [ ${GITHUB_REF_TYPE} == "branch" ]; then

  if [ ${GITHUB_REF_NAME} == "master" ] || [ ${GITHUB_REF_NAME} == "main" ]; then
    DOCKER_IMAGE_VERSION=latest
  else
    DOCKER_IMAGE_VERSION=${GITHUB_REF_NAME}
  fi;
elif [ ${GITHUB_REF_TYPE} == "tag" ]; then
    DOCKER_IMAGE_VERSION=${GITHUB_REF_NAME}
fi;

