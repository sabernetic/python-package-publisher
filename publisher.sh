#!/bin/bash
acc_id=$1
domain=$2
repo=$3

pip install setuptools wheel twine
export TWINE_USERNAME=aws
export TWINE_PASSWORD=`aws codeartifact get-authorization-token --domain $domain --domain-owner $acc_id --query authorizationToken --output text`
export TWINE_REPOSITORY_URL=`aws codeartifact get-repository-endpoint --domain $domain --domain-owner $acc_id --repository $repo --format pypi --query repositoryEndpoint --output text`
python setup.py sdist bdist_wheel
twine upload dist/*
