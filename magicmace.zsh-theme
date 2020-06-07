# vim:et sts=2 sw=2 ft=zsh
#
# magicmace theme
# Ideas and code taken from:
#   xero's zsh prompt <http://code.xero.nu/dotfiles>
#   eriner's eriner prompt <https://github.com/zimfw/eriner>
#
# Requires the `git-info` zmodule to be included in the .zimrc file.

_prompt_magicmace_main() {
  RETVAL=${?}
  local mace_color="${(%):-%(!.${COLOR_ROOT}.${COLOR_USER})}"
  print -n "%F{${mace_color}}"

  # Status: Was there an error? Are there background jobs? Ranger spawned shell?
  # Python venv activated?
  local symbols=''
  if (( RETVAL )) symbols+="%F{${COLOR_ERROR}}${RETVAL}%F{${COLOR_NORMAL}}" # ${?} for error.
  if (( $(jobs -l | wc -l) )) symbols+='b' # 'b' for background.
  if (( RANGER_LEVEL )) symbols+='r' # 'r' for... you guessed it!
  if [[ -n ${VIRTUAL_ENV} ]] symbols+='v'
  if [[ -n ${symbols} ]] print -n "─%F{${COLOR_NORMAL}}${symbols}%F{${mace_color}}─"

  # Pwd: current working directory.
  local current_dir=${(%):-%~}
  if [[ ${current_dir} != '~' ]]; then
    current_dir="${${(@j:/:M)${(@s:/:)current_dir:h}#?}%/}/${current_dir:t}"
  fi
  print -n "[%F{${COLOR_NORMAL}}${current_dir}%F{${mace_color}}]"
}

: ${COLOR_ROOT=red}
: ${COLOR_USER=cyan}
: ${COLOR_NORMAL=white}
: ${COLOR_ERROR=red}
VIRTUAL_ENV_DISABLE_PROMPT=1

setopt nopromptbang prompt{cr,percent,sp,subst}

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info:branch' format '%b'
  zstyle ':zim:git-info:commit' format '%c...'
  zstyle ':zim:git-info:dirty' format '*'
  zstyle ':zim:git-info:ahead' format '↑'
  zstyle ':zim:git-info:behind' format '↓'
  zstyle ':zim:git-info:keys' format \
      'prompt' '─[%F{${COLOR_NORMAL}}%b%c%D%A%B%F{%%(!.${COLOR_ROOT}.${COLOR_USER})}]'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

PS1='$(_prompt_magicmace_main)${(e)git_info[prompt]}── ─%f '
unset RPS1
