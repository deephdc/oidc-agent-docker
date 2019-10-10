#!/bin/bash

orchent depcreate ./tosca/deep-oc-mods_mesos-webdav-cpu-uisav.yml \
'{
	"docker_image": "deephdc/deep-oc-mods",
	"rclone_url": "https://nc.deep-hybrid-datacloud.eu/remote.php/webdav/",
	"rclone_vendor": "nextcloud",
	"rclone_user": "'$RCLONE_USER'",
	"rclone_password": "'$RCLONE_PASS'"
}'
