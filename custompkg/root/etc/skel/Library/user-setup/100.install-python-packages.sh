PYTHON_PKGS="
    awscli
    virtualenv
"

for PKG in $PYTHON_PKGS ; do
    /usr/local/bin/pip install --user $PKG
done
