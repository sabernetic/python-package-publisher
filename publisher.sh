#!/bin/bash
pip install twine wheel
python setup.py sdist bdist_wheel
export token=$(aws codeartifact get-authorization-token --domain sabernetic --domain-owner 538326023882 --query authorizationToken --output text)
twine upload --repository codeartifact dist/* -u aws -p $token