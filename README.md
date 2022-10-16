

python3 -m pip install --user ansible

vim ~/.zshrc

export PATH="$HOME/Library/Python/3.7/bin:$PATH"

ansible-vault encrypt inception/.env

ansible-playbook -i provisioning/inventory.yaml provisioning/playbook.yaml --ask-vault-pass

wordpress ==> https://192.168.42.20
phpMyAdmin ==> https://192.168.42.20:8080



  python3 -m pip install requests
  python3 -m ensurepip --upgrade
  python3 -m pip install --upgrade pip
  python3 -m pip install --user ansible



ansible-inventory -i inventory.ini --list
ansible all -i inventory.ini -m ping