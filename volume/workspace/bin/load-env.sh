#!/bin/bash

if [ -z "${DEEP_HOME}" ]; then
	export DEEP_HOME="$(cd "`dirname "$0"`"/..;pwd)"
fi

if [ -z "$DEEP_ENV_LOADED" ]; then
	export DEEP_ENV_LOADED=1
	
	parent_dir="${DEEP_HOME}"
	
	user_conf_dir="${DEEP_CONF:-"$parent_dir"/conf}"
	
	if [ -f "${user_conf_dir}/env.sh" ]; then
		set -a
		. "${user_conf_dir}/env.sh"
		set +a
	fi
fi
