#!/bin/bash

export ORCHENT_URL=https://paas.cloud.ba.infn.it/orchestrator
export ORCHENT_TOKEN=$(oidc-token deep)
 
orchent depcreate ./deep-oc-dogs_breed-mesos-cpu.yml \
'{ "rclone_url": "https://nc.deep-hybrid-datacloud.eu/remote.php/webdav/",
   "rclone_vendor": "nextcloud",
   "rclone_user": "DEEP-IAM-986b37db-bcb3-4067-8b03-d88dc4cc021",
   "rclone_pass": "dGMVmJuM60BPdJJ8Plr4Ogl1GJgVq7Ea6DwxJ-r40edA5o75RfhOXDefgyZj" }'
