#!/bin/bash
dt=`date +"%Y%m%d"`
if [ -f /data/dqs_links/libmdAddr.so ]
then
    cp /data/dqs_links/*.so ./container_contents/.
    chmod 755 container_contents/*.so
fi

# you can build using amazonlinux but it has to pull all the rust toolchain and gcc
if [ "$1" = "aws" ]
then
    docker build -t gh-qs-aws --ssh default -f Dockerfile.amd64_aws . && docker save -o gh-qs-aws.$dt.tar gh-qs-aws  && gzip gh-qs-aws.$dt.tar
elif [ "$1" = "nonX86" ]
then
    docker build -t gh-qs-nonx86 --ssh default -f Dockerfile.nonX86 . && docker save -o gh_qs_nonx86.$dt.tar gh-qs-nonx86 && gzip gh-qs-nonx86.$dt.tar
else
    # by default we use the standard rust:latest and then a debian image to run it
    docker build -t gh-queryserver --ssh default -f Dockerfile.amd64 . && docker save -o gh-queryserver.$dt.tar gh-queryserver && gzip gh-queryserver.$dt.tar
fi

if [ $? = 0 ]
then
    echo ""
    echo "Compressed images can be loaded in docker with 'docker load < file.tar.gz'"
    echo "Binaries can be pulled out of the container with 'docker cp gw_aws:/tools .'"
    echo "The server name prefix is actually the container name or id - not the image name you just made or launched."
fi
