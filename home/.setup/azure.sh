
pkg install openssl libffi python

#pkg install openssl-dev libffi-dev python-dev python
pip install --user virtualenv
$HOME/.local/bin/virtualenv $HOME/venv/azure
$HOME/venv/azure/bin/pip install cffi
$HOME/venv/azure/bin/pip install azure-cli
$HOME/venv/azure/bin/pip install --upgrade --force-reinstall azure-nspkg azure-mgmt-nspkg

#curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
