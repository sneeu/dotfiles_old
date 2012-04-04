ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_CLEAN_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DIRTY_SUFFIX="%{$reset_color%}"

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    local dirty=$(parse_git_dirty)
    if [ -n "$dirty" ]; then
      echo "- $ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_DIRTY_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_DIRTY_SUFFIX$ZSH_THEME_GIT_PROMPT_SUFFIX"
    else
      echo "- $ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_CLEAN_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_CLEAN_SUFFIX$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
  fi
}

PROMPT='${${PWD/#$WORKON_HOME/**}/$HOME/~} $(git_custom_status) »%b '
