# AWS Workshop

## Setup

on the machine running the XLDeploy Server.

* install [xld-ansible-step-plugin](https://github.com/xebialabs-community/xld-ansible-step-plugin/releases/download/v1.1.0-rc.8/xld-ansible-step-plugin-1.1.0-rc.8.xldp) plugin. Copy the file into $XL_DEPLOY_HOME/plugins directory.
* install [xld-aws-keypair-plugin](./plugins/xld-aws-ec2-keypair-plugin-0.0.3.jar) plugin. Copy the file into $XL_DEPLOY_HOME/plugins directory.
* install [overtherepy](https://github.com/xebialabs-community/overthere-pylib/releases/download/v0.0.4/overtherepy-0.0.4.jar) plugin. Copy the file into $XL_DEPLOY_HOME/plugins directory.
* restart XL Deploy Server
* install [XL-CLI](https://dist.xebialabs.com/public/xl-cli/9.6.2/) depending of the running platform (Linux,Windows or MacOS). Copy the file into $XL_DEPLOY_HOME/xl-cli directory.[Devops As Code Documentation](https://docs.xebialabs.com/v.9.6/xl-release/concept/get-started-with-devops-as-code#get-started)

## Actions

The workshop will setup the following stack:

![image](images/schema-1.png)

### Provision the ansible controlleur in AWS

* apply the Devops-as-code defintions containing the deployment package for ansible controller

```bash
xl apply -f xebialabs/ansible_controler.yaml
```

* edit CI Applications/ansible-controller/1.0.0/ansible-host-template/ansible-controler-template, to modify devops properties to match your current environment (devopsAsCodeUrl & xlPath)
* deploy `Applications/ansible-controller/1.0.0` package in an environment containing an aws.Cloud Configuration item with your AWS credentials.
* Once deployed, in the Infrastructure,a new configuration item representing the Ansible controler has been created and added to the environment. It follows the following pattern 'Infrastructure/ansible-controlleur-{{%instanceId%}}-host'.

### Provision a new target host in AWS

* apply the Devops-as-code defintions containing the deployment package containing the aws-host package.

```bash
xlw apply -f xebialabs/aws_host.yaml
```

* deploy `Applications/aws-host/1.0.0` package in an environmnet containing an aws.Cloud Configuration item with your AWS credentials.
* Once deployed, in the Infrastructure, a new Configuration representing the new EC2 instance has been created and added to the environment. it follows the following pattern 'Infrastructure/{{%instanceId%}}-host'.

### Provision tomcat using Ansible

* apply the Devops-as-code defintions containing the deployment package containing the java-server-application package. 

```bash
xlw apply -f xebialabs/application_tomcat.yaml
```

* deploy `Applications/java-server-application/0.1.1` package in the same environment.
* Once deployed, in the Infrastructure, 2 new configuration items representing the new `tomcat server` have been created and added to the environment. It follows the following pattern `Infrastructure/{{%instanceId%}}-host/tomcat-server` and `Infrastructure/{{%instanceId%}}-host/tomcat-server/tomcat.vh`

### Deploy the Web application

* Right-click on the `Applications` node, and select `import from XLDeploy Server`
* Select `PetClinic-war/1.0` package and click on the `Import` button
* Right-click on the `Applications` node, and select `import from XLDeploy Server`
* Select `PetClinic-war/2.0` package and click on the `Import` button
* Deploy `Applications/PetClinic-war/1.0` package in the same environment.
* Open a web browser to the `http://%IP_OF_AWS_HOST%/petclinic` address.
* Deploy `Applications/PetClinic-war/2.0` package in the same environment.
* Open a web browser to the `http://%IP_OF_AWS_HOST%/petclinic` address. Check the difference.

### Dump the state

* using the XL command line, you can dump the complete state of
  * the infrastructure `xl generate xl-deploy -p Infrastructure -f infrastructure.yaml`
  * the applications `xlw generate xl-deploy -p Applications -f app.yaml`
  * the environments `xlw generate xl-deploy -p Environments -f env.yaml`



