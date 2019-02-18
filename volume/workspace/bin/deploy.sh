#!/usr/bin/env bash

if [ -z "${DEEP_HOME}" ]; then
	export DEEP_HOME="$(cd "`dirname "$0"`"/..; pwd)"
fi

source "${DEEP_HOME}"/bin/load-env.sh
exec $1
