PYTHON_PKGS="
    awscli
    awsebcli
    pipenv
    virtualenv
"

for PKG in $PYTHON_PKGS ; do
    /usr/local/bin/pip install --user $PKG
done
