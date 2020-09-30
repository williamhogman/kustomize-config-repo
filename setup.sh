#!/usr/bin/env bash

cd "$(dirname "$0")"

if [ -z "$1" ]
  then
    echo "setup.sh name-of-your-service"
    exit
fi

sed -i '' "s/your-app/$1/g" base/deployment.yaml
sed -i '' "s/your-app/$1/g" base/service.yaml
sed -i '' "s/your-app/$1/g" base/kustomization.yaml
sed -i '' "s/your-app/$1/g" prod/deployment.yaml

git add base/*.yaml prod/*.yaml
git rm setup.sh README.md
git commit -m "Automated setup"


