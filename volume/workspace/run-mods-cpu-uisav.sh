#!/bin/bash

orchent depcreate ./tosca/deep-oc-mods_mesos-webdav-cpu-uisav.yml \
'{
	"docker_image": "deephdc/deep-oc-mods",
	"rclone_url": "https://nc.deep-hybrid-datacloud.eu/remote.php/webdav/",
	"rclone_vendor": "nextcloud",
	"rclone_user": "'$RCLONE_USER'",
	"rclone_password": "'$RCLONE_PASS'",
	"rclone_conf": "/srv/mods/.rclone.conf",
	"num_cpus": "1",
	"run_command": "/srv/deep-debug_log/debug_log.sh --deepaas_port=5000 --remote_dir=deepnc:/Logs/"
}'
