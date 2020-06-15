set -x
apt-get update
apt-get install --yes software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install --yes ansible
ansible-playbook --version
