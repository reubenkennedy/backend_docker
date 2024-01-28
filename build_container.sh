#!/bin/bash
dt=`date +"%Y%m%d"`
if [ -f /data/dqs_links/libmdAddr.so ]
then
    cp /data/dqs_links/*.so ./container_contents/.
    chmod 755 container_contents/*.so
fi
if [ "$1" = "aws" ]
then
    docker build -t gh_aws --ssh default -f Dockerfile.amd64_aws . && docker save -o gh_aws.$dt.tar gh_aws  && gzip gh_aws.$dt.tar
elif [ "$1" = "nonX86" ]
then
    docker build -t gh_nonx86 --ssh default -f Dockerfile.nonX86 . && docker save -o gh_nonx86.$dt.tar gh_nonx86 && gzip gh_nonx86.$dt.tar
else
    docker build -t gh_debian --ssh default -f Dockerfile.amd64 . && docker save -o gh_debian.$dt.tar gh_debian && gzip gh_debian.$dt.tar
fi

if [ $? = 0 ]
then
    echo ""
    echo "Compressed images can be loaded in docker with 'docker load < file.tar.gz'"
    echo "Binaries can be pulled out of the container with 'docker cp gw_aws:/tools .'"
    echo "The server name prefix is actually the container name or id - not the image name you just made or launched."
fi
