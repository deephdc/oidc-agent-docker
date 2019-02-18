#!/bin/bash

orchent depcreate "${DEEP_HOME}"/tosca/deep-oc-mods_mesos-webdav-cpu-uisav.yml \
'{ "docker_image": "deephdc/deep-oc-mods",
   "rclone_url": "https://nc.deep-hybrid-datacloud.eu/remote.php/webdav/",
   "rclone_vendor": "nextcloud",
   "rclone_user": "'$RCLONE_USER'",
   "rclone_pass": "'$RCLONE_PASS'" }'
