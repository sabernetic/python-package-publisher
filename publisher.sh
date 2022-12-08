#!/bin/bash
# pip install twine wheel
# python setup.py sdist bdist_wheel
# export token=$(aws codeartifact get-authorization-token --domain sabernetic --domain-owner 538326023882 --query authorizationToken --output text)
# twine upload --repository codeartifact dist/* -u aws -p $token

export TWINE_USERNAME=aws
export TWINE_PASSWORD=`aws codeartifact get-authorization-token --domain $1 --domain-owner $3 --query authorizationToken --output text`
export TWINE_REPOSITORY_URL=`aws codeartifact get-repository-endpoint --domain $1 --domain-owner $3 --repository $2 --format pypi --query repositoryEndpoint --output text`
python setup.py sdist bdist_wheel
twine upload dist/*
