#!/usr/bin/env bash

export ORCHENT_URL="https://paas.cloud.cnaf.infn.it/orchestrator"
export ORCHENT_TOKEN=$(oidc-token deep)
export RCLONE_USER=""
export RCLONE_PASS=""
