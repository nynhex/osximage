BGPPREFIX="$HOME/Library/Homebrew/opt/bash-git-prompt"

if [ -f "$BGPPREFIX/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Plague_Doctor
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_FETCH_REMOTE_STATUS=0
  source "$BGPPREFIX/share/gitprompt.sh"
fi
