# bash completion for awscli
if which aws_bash_completer 2>&1 >/dev/null; then
    source `which aws_bash_completer`
fi
# bash completion for elastic beanstalk
if which eb_completion.bash 2>&1 >/dev/null; then
    source `which eb_completion.bash`
fi
