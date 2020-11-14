#!/bin/bash
# hooks/build
# https://docs.docker.com/docker-cloud/builds/advanced/
# Modified for this use case

## $IMAGE_NAME var is injected into the build so the tag is correct.
echo "[***] Build hook starting..."
GITHUB_USERREPO="Herbaltea-GG/DSaaS"
DOCKER_REPO="https://hub.docker.com/r/herbaltea/dsaas"
APPLICATION="DSaaS"

echo "[---] DOCKER_REPO: ${DOCKER_REPO}"
echo "[---] APPLICATION: ${APPLICATION}"

# Set description from github
DESCRIPTION=$(curl -s https://api.github.com/repos/${GITHUB_USERREPO} \
    | grep '"description".*' \
    | head -n 1 \
    | cut -d '"' -f 4)

echo "[---] GITHUB_USERREPO: ${GITHUB_USERREPO}"
echo "[---] DESCRIPTION: ${DESCRIPTION}"

docker build \
        --build-arg APPLICATION=${APPLICATION} \
        --build-arg BUILD_RFC3339=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
        --build-arg REVISION=$(git rev-parse --short HEAD) \
    	--build-arg PACKAGE="${GITHUB_USERREPO}" \
        --build-arg DESCRIPTION="${DESCRIPTION}" \
        --build-arg VERSION="1.0.0" \
        --build-arg BRANCH=$(git rev-parse --abbrev-ref HEAD) \
        -t herbaltea/dsaas:latest \
        .
