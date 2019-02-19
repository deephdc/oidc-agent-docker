#!/bin/bash
docker run\
 --rm\
 -it\
 -v "$(pwd)"/volume/workspace:/srv/workspace\
 -v "$(pwd)"/volume/.oidc-agent:/root/.oidc-agent\
 deep-job-starter\
 /bin/bash
