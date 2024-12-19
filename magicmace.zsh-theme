# vim:et sts=2 sw=2 ft=zsh
#
# magicmace theme
# Ideas and code taken from:
#   xero's zsh prompt <http://code.xero.nu/dotfiles>
#   eriner's eriner prompt <https://github.com/zimfw/eriner>
#
# Requires the `prompt-pwd` and `git-info` zmodules to be included in the .zimrc file.

_prompt_magicmace_status() {
  # This runs in a subshell
  RETVAL=${?}
  # Status: Was there an error? Are there background jobs? Ranger spawned shell?
  # Python venv activated?
  local symbols=
  if (( RETVAL )) symbols+="%F{${COLOR_ERROR}}${RETVAL}%F{${COLOR_NORMAL}}" # ${?} for error.
  if (( ${#jobstates} )) symbols+=b # b for background.
  if (( RANGER_LEVEL )) symbols+=r # r for... you guessed it!
  if [[ -n ${VIRTUAL_ENV} ]] symbols+=v
  if [[ -n ${symbols} ]] print -n "─%F{${COLOR_NORMAL}}${symbols}%F{${USER_LEVEL}}─"
}

typeset -g USER_LEVEL
if (( EUID )); then
  USER_LEVEL=${COLOR_USER:-cyan}
else
  USER_LEVEL=${COLOR_ROOT:-red}
fi
if (( ! ${+COLOR_NORMAL} )) typeset -g COLOR_NORMAL=white
if (( ! ${+COLOR_ERROR} )) typeset -g COLOR_ERROR=red
typeset -g VIRTUAL_ENV_DISABLE_PROMPT=1

setopt nopromptbang prompt{cr,percent,sp,subst}

zstyle ':zim:prompt-pwd:fish-style' dir-length 1

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info:branch' format '%b'
  zstyle ':zim:git-info:commit' format '%c...'
  zstyle ':zim:git-info:dirty' format '*'
  zstyle ':zim:git-info:ahead' format '↑'
  zstyle ':zim:git-info:behind' format '↓'
  zstyle ':zim:git-info:keys' format \
      'prompt' '─[%F{${COLOR_NORMAL}}%b%c%D%A%B%F{${USER_LEVEL}}]'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

PS1='%F{${USER_LEVEL}}$(_prompt_magicmace_status)[%F{${COLOR_NORMAL}}$(prompt-pwd)%F{${USER_LEVEL}}]${(e)git_info[prompt]}── ─%f '
unset RPS1
