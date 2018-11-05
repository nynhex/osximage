PYTHON_PKGS="
    awscli
    awsebcli
    pipenv
    powerline-shell
    virtualenv
"

for PKG in $PYTHON_PKGS ; do
    /usr/local/bin/pip install --user $PKG
done
