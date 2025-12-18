#!/bin/bash
set -e

# Validate required environment variables
if [[ -z "$NEXUS_URL" || -z "$NEXUS_REPO_ID" ]]; then
  echo "::error::Missing required environment variables: NEXUS_URL or NEXUS_REPO_ID"
  exit 1
fi

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo " PUBLISH TO NEXUS (via deploy-file)"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# Deploy POM to Nexus
echo ">> Deploying POM artifact"
mvn -B deploy:deploy-file \
  -Durl="${NEXUS_URL}" \
  -DrepositoryId="${NEXUS_REPO_ID}" \
  -Dfile=pom.xml \
  -DpomFile=pom.xml \
  -Dpackaging=pom \
  -DgeneratePom=false \
  -DretryFailedDeploymentCount=3

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo " PUBLISH COMPLETE"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"