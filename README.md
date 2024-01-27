### Backend docker files and scripts for building and testing

This repo root directory contains some scripts for building docker images, scripts and files that
are needed inside the images, and several scripts for running the query server and client.

1. To build all the software in a docker image the *build_container.sh* script is used.
    It can take an optional argument of **"aws"** to build specifically for Amazon Linux (although this takes longer)
   or **"nonX86"** to build on a platform other than intel/amd. The default build picks the standard Rust docker image
   and a slimmer debian based container image.

1. The result of the build script will be an image in your local Docker enviroment as well as a tar.gz file that can be
   shared with others and directly loaded with *"docker load < whatever.tar.gz"* bypassing the image build process.

1. **run_query_server.sh** is used to start an interactive query server listening on a websocket - you should run this from a directory containing *test_data*

1. **run_query_request.sh** can be used to send a json formatted request to a running instance of query server ( -r request.json )

1. A directory of test data and request files can be found on the Growth.Health shared google drive under Technology / Test data and images as well as a precompiled container image0

1. Binaries can be copied out of a running container with *docker cp* if we want to use the containers for CI and then pull and deploy binaries 
