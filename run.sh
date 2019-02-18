#!/bin/bash
docker run\
 --rm\
 -it\
 -v "$(pwd)"/volume/workspace:/srv/workspace\
 -v "$(cd ../oidc-agent-stevo/ && pwd)"/volume/.oidc-agent:/root/.oidc-agent\
 -v "$(cd ../oidc-agent-stevo/ && pwd)"/volume/.config:/root/.config\
 deep-job-starter\
 /bin/bash
