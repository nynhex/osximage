BGPPREFIX="$HOME/Library/Homebrew/opt/bash-git-prompt"

if [ -f "$BGPPREFIX/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$BGPPREFIX/share/gitprompt.sh"
fi
