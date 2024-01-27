#!/bin/bash
cp /data/dqs_links/*.so .
chmod 755 *.so
if [ "$1" = "aws" ]
then
    docker build -t gh_aws --ssh default -f Dockerfile.amd64_aws .
elif [ "$1" = "nonX86" ]
then
    docker build -t gh_nonX86 --ssh default -f Dockerfile.nonX86.
else
    docker build -t gh_debian --ssh default -f Dockerfile.amd64 .
fi
