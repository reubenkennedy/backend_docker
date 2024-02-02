#!/bin/bash
# --rm = cleanup container on exit
# -p = bind loopback:3000 to the container 3000
# --mount = mounts local host dirs into the container
# --env
if [ "$1" = "app-stack" ]
then
    # if you want to run against the app-stack container use this one
    docker run --rm --network=host --env JWT_SECRET="secret" --env RUST_LOG=info --mount type=bind,src=.,dst=/data -it gh-queryserver query_tool send -t token.json -u "ws://127.0.0.1:4002/ws" $*
else 
    # else you are running against one fired up with run_query_server.sh
    docker run --rm --network container:backend --env JWT_SECRET="secret" --env RUST_LOG=info --mount type=bind,src=.,dst=/data -it gh-queryserver query_tool send -t token.json -u "ws://127.0.0.1:3000/ws" $*

fi
