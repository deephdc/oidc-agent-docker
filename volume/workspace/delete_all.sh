#!/bin/bash
####
# Simple bash script to check all user deployments
# and delete them
# vkozlov @19-Feb-2019
###
 
DeploymentList=$(orchent depls -c me |grep Deployment)
 
for dep in $DeploymentList
do
    onedep=$(echo $dep | cut -d '[' -f2 | cut -d ']' -f1)
    if [ "$onedep" != "Deployment" ]; then
       echo "Deleting $onedep"
       orchent depdel $onedep
    fi
done

