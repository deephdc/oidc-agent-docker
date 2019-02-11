## Prepare rclone
Replace `DEEP-AIM-id` and `passwd` by real values from `rclone.config` in all places!!!

## Prepare OIDC token 
The token is called `deep` in `./volume/.oidc-agent/`

```bash
eval $(oidc-agent)
oidc-gen
	deep-aim
	https://iam.deep-hybrid-datacloud.eu/
	deep
	aim
	2
oidc-token deep
```

## Build the image
Execute `build.sh` or 

```bash
# docker build --rm -t deep-job-starter -f Dockerfile .
```

## Create and execute the container
Execute `run.sh` or

```bash
# docker run\
 --rm\
 -it\
 -v "$(pwd)"/volume/workspace:/srv/workspace\
 -v "$(pwd)"/volume/.oidc-agent:/root/.oidc-agent\
 -v "$(pwd)"/volume/.config:/root/.config\
 deep-job-starter\
 /bin/bash
```

## Start oidc-agent and load configuration
Inside the container, execute the oidc-agent

```bash
# eval `oidc-agent`
Agent pid 12
```

and load configuration

```bash
# oidc-add deep
Enter encryption password for account config deep: 
success
```

## Deploy the app

```bash
# cd workspace
# . ./run-mods.sh
Deployment [11e914d8-ff58-297d-b51f-0242c04420ec]:
  status: CREATE_IN_PROGRESS
  creation time: 2019-01-10T13:09+0000
  update time: 2019-01-10T13:09+0000
  callback: 
  status reason: 
  task: NONE
  CloudProviderName: 
  outputs: 
  {}
  links:
    self [https://deep-paas.cloud.ba.infn.it/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec]
    resources [https://deep-paas.cloud.ba.infn.it/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec/resources]
    template [https://deep-paas.cloud.ba.infn.it/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec/template]
```

## Monitor the deployment progress

```bash
# orchend depshow 11e914d8-ff58-297d-b51f-0242c04420ec
Deployment [11e914d8-ff58-297d-b51f-0242c04420ec]:
  status: CREATE_COMPLETE
  creation time: 2019-01-10T13:09+0000
  update time: 2019-01-10T13:10+0000
  callback: 
  status reason: 
  task: NONE
  CloudProviderName: provider-RECAS-BARI
  outputs: 
  {
      "Docker_host_publish_ports": [
          {
              "definition": false,
              "printable": true,
              "value": {
                  "protocol": {
                      "definition": false,
                      "printable": true,
                      "value": "tcp"
                  },
                  "source": {
                      "definition": false,
                      "printable": true,
                      "value": "5000"
                  }
              }
          }
      ],
      "endpoint": "mesos-lb.recas.ba.infn.it:10011",
      "marathon_load_balancer_ips": [
          {
              "definition": false,
              "printable": true,
              "value": "mesos-lb.recas.ba.infn.it"
          }
      ]
  }
  links:
    self [https://deep-paas.cloud.ba.infn.it/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec]
    resources [https://deep-paas.cloud.ba.infn.it/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec/resources]
    template [https://deep-paas.cloud.ba.infn.it/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec/template]

```

## Access the endpoint in the browser

```
http://mesos-lb.recas.ba.infn.it:10011
```

## Undeploy the app

```bash
# orchent depdel 11e914d8-ff58-297d-b51f-0242c04420ec
deletion of deployment 11e914d8-ff58-297d-b51f-0242c04420ec successfully triggered
```
