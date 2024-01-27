#!/bin/bash
# --rm = cleanup container on exit
# -p = bind loopback:3000 to the container 3000
# --mount = mounts local host dirs into the container
# --env
docker run --rm --network container:backend --env JWT_SECRET="secret" --env RUST_LOG=info --mount type=bind,src=.,dst=/data -it gh_debian query_tool send -t token.json -u "ws://127.0.0.1:3000/ws" $*
