## 1 Build the image
Execute `build.sh` or 

```bash
# docker build --rm -t deep-job-starter -f Dockerfile .
```

## 2 Create and execute the container
Execute `run.sh` or

```bash
# docker run\
 --rm\
 -it\
 -v "$(pwd)"/volume/workspace:/srv/workspace\
 -v "$(pwd)"/volume/.oidc-agent:/root/.oidc-agent\
 deep-job-starter\
 /bin/bash
```

## 3 Start the *OIDC agent*
Inside the container, execute following command

```bash
# eval `oidc-agent`
```

## 4 *OIDC agent* configuration

### 4a) New configuration
Inside the container, retrieve OIDC `deep` token. It will be saved in the mounted directory `./volume/.oidc-agent/` or `/root/.oidc-agent/` respectively

```bash
# oidc-gen
```

and use following inputs on request:

```
deep-aim
https://iam.deep-hybrid-datacloud.eu/
deep
aim
2
```

### 4b) Existing configuration 
Inside the container, check if the OIDC configuration exists in the `/root/.oidc-agent/` directory and load it

```bash
# oidc-add deep
Enter encryption password for account config deep: 
success
```

## 5 Configure *Orchent* and *rclone*
Inside the container, set the environment variables in `/srv/workspace/env.sh`

```bash
#!/usr/bin/env bash

export ORCHENT_URL="https://paas.cloud.cnaf.infn.it/orchestrator"
export ORCHENT_TOKEN=$(oidc-token deep)
export RCLONE_USER="..."
export RCLONE_PASS="..."
```

and load it

```bash
source /srv/workspace/env.sh
```

## 6 Deploy the app

```bash
# cd workspace
# ./run-mods.sh
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
    self [https://paas.cloud.cnaf.infn.it/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec]
    resources [https://paas.cloud.cnaf.infn.it/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec/resources]
    template [https://paas.cloud.cnaf.infn.it/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec/template]
```

## 7 Monitor the deployment progress

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
		...
          }
      ],
      "endpoint": "some_endpoint_IP:10011",
      "marathon_load_balancer_ips": [
          {
              "definition": false,
              "printable": true,
              "value": "... some_url ..."
          }
      ]
  }
  links:
    self [https://some_paas_url/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec]
    resources [https://some_paas_url/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec/resources]
    template [https://some_paas_url/orchestrator/deployments/11e914d8-ff58-297d-b51f-0242c04420ec/template]

```

## 8 Access the endpoint in the browser

```
http://some_endpoint_IP:10011
```

## 9 Undeploy the app

```bash
# orchent depdel 11e914d8-ff58-297d-b51f-0242c04420ec
deletion of deployment 11e914d8-ff58-297d-b51f-0242c04420ec successfully triggered
```
