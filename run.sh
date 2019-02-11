#!/bin/bash
docker run\
 --rm\
 -it\
 -v "$(pwd)"/volume/workspace:/srv/workspace\
 -v "$(pwd)"/volume/.oidc-agent:/root/.oidc-agent\
 -v "$(pwd)"/volume/.config:/root/.config\
 deep-job-starter\
 /bin/bash
