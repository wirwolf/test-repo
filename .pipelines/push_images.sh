#!/usr/bin/env bash
. .pipelines/build_images.sh

################### APP IMAGES ###################

function push_image() {
    echo "$(tput bold)$(tput setb 4)$(tput setaf 3)$1$(tput sgr0)"
    IMAGE=$2
    if [ "${DOCKER_PUSH_TO_REGISTRY}" == "master" ]; then
      echo "docker push ${IMAGE}"
    else
      echo "[PUSH] - skip this step for image ${IMAGE}"
    fi;


}

push_image "push api"  "$DOCKER_SERVER_HOST/$DOCKER_PROJECT_PATH:$DOCKER_IMAGE_VERSION"

