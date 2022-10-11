
ln -s ~/goinfre/vag   ./.vagrant.d
mkdir ~/goinfre/vag

python3 -m pip install --user ansible

vim ~/.zshrc

export PATH="$HOME/Library/Python/3.7/bin:$PATH"

ansible-vault encrypt inception/.env

ssh-keyscan -H 192.168.42.20 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.42.110 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.42.120 >> ~/.ssh/known_hosts

ansible-vault encrypt inception/.env

ansible-playbook -i provisioning/inventory.yaml provisioning/playbook.yaml --ask-vault-pass

wordpress ==> https://192.168.42.20
phpMyAdmin ==> https://192.168.42.20:8080



  python3 -m pip install requests
  python3 -m ensurepip --upgrade
  python3 -m pip install --upgrade pip
  python3 -m pip install --user ansible
 ansible-playbook