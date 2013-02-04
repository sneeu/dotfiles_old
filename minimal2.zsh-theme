ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_CLEAN_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DIRTY_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_REV_COLOUR="%{$fg[yellow]%}"

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    local dirty=$(parse_git_dirty)
    local prompt=""
    if [ -n "$dirty" ]; then
      prompt="$ZSH_THEME_GIT_PROMPT_DIRTY_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_REV_COLOUR@$(current_rev)$ZSH_THEME_GIT_PROMPT_DIRTY_SUFFIX"
    else
      prompt="$ZSH_THEME_GIT_PROMPT_CLEAN_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_REV_COLOUR@$(current_rev)$ZSH_THEME_GIT_PROMPT_CLEAN_SUFFIX"
    fi
    echo " $ZSH_THEME_GIT_PROMPT_PREFIX$prompt$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

virtual_env_status() {
  if [ -n "$VIRTUAL_ENV" ]; then
    local ve=$(basename `echo $VIRTUAL_ENV`)
    echo "%{$fg[yellow]%}$ve %{$reset_color%}"
  fi
}

PROMPT='$(virtual_env_status)${${PWD}/$HOME/~}$(git_custom_status) »%b '
