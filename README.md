## Ansible Controller

### Setup
on the XLDeploy Server
* install [xld-ansible-step-plugin](https://github.com/xebialabs-community/xld-ansible-step-plugin/releases/download/v1.1.0-rc.7/xld-ansible-step-plugin-1.1.0-rc.7.xldp)
* install [xld-aws-keypair-plugin](./plugins/xld-aws-keypair-plugin-0.0.1.jar)
* install https://github.com/xebialabs-community/overthere-pylib/releases/download/v0.0.4/overtherepy-0.0.4.jar
* restart XLDeploy Server
* install [XL-CLI](https://dist.xebialabs.com/public/xl-cli/9.6.2/) depending of the running platform (Linux,Windows or MacOS)
* create the ssh-keypari directory in xl-deploy installation folder

## Actions
* apply the Devops-as-code defintions containing the deployment package for ansible controlleur

```
xl apply -f xebialabs/ansible-controler.yaml
``` 
* edit CI Applications/ansible-controller/1.0.0/ansible-host-template/ansible-controler-template devops properties
* deploy this package in an environmnet containing an aws.Cloud Configuration item
* in the Infrastructure,a new Configuration representing the ansible controler has been created and added to the environment.it follows the following pattern 'Infrastructure/ansible-controlleur-{{%instanceId%}}-host' 

* apply the Devops-as-code defintions containing the deployment package containing the aws-host package. 

```
xlw apply -f xebialabs/aws_host.yaml
``` 
* deploy this package in an environmnet containing an aws.Cloud Configuration item
* in the Infrastructure, a new Configuration representing the new EC2 instance has been created and added to the environment. it follows the following pattern 'Infrastructure/{{%instanceId%}}-host' 
* 
* apply the Devops-as-code defintions containing the deployment package containing the aws-host package. 

```
xlw apply -f xebialabs\application_tomcat.yaml
``` 



