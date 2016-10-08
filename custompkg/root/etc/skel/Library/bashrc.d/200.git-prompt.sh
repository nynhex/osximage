if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
