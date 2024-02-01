#!/bin/bash
# --rm = cleanup container on exit
# --mount = mounts local host dirs into the container
# --env
docker run --rm --env RUST_LOG=info --mount type=bind,src=/data,dst=/data -it gh-queryserver dp_tool $*
