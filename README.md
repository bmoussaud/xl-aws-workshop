## Ansible Controller

### Setup
on the XLDeploy Server
* install [xld-ansible-step-plugin](https://github.com/xebialabs-community/xld-ansible-step-plugin/releases/download/v1.1.0-rc.7/xld-ansible-step-plugin-1.1.0-rc.7.xldp)
* install [xld-aws-keypair-plugin](./plugins/xld-aws-keypair-plugin-0.0.1.jar)
* restart XLDeploy Server
* install [XL-CLI](https://dist.xebialabs.com/public/xl-cli/9.6.2/) depending of the running platform (Linux,Windows or MacOS)

## Actions
* apply the Devops-as-code defintions containing the deployment package
  and the infrastructure definition

```
xl apply -f xebialabs/ansible-controler.yaml
``` 


