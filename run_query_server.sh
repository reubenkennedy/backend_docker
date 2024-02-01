#!/bin/bash
# --rm = cleanup container on exit
# -p = bind loopback:3000 to the container 3000
# --mount = mounts local host dirs into the container
# --env
docker run --name backend --rm --env JWT_SECRET="secret" --env RUST_LOG=info -p 127.0.0.1:3000:3000/tcp --mount type=bind,src=.,dst=/data -it gh-queryserver
