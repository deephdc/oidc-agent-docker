#!/bin/bash

export ORCHENT_URL=https://paas.cloud.ba.infn.it/orchestrator
export ORCHENT_TOKEN=$(oidc-token deep)
 
orchent depcreate ./deep-oc-dogs_breed-mesos-cpu.yml \
'{ "rclone_url": "https://nc.deep-hybrid-datacloud.eu/remote.php/webdav/",
   "rclone_vendor": "nextcloud",
   "rclone_user": "DEEP-IAM-id",
   "rclone_pass": "passwd" }'
