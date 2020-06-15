<<<<<<< HEAD
=======
set -x
apt-get update
apt-get install --yes software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install --yes ansible
ansible-playbook --version
>>>>>>> 986bb07a86c49241c5d011a3fe07958856b4129a
