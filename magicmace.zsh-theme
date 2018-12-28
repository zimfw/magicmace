# vim:et sts=2 sw=2 ft=zsh
#
# magicmace theme
# Ideas and code taken from:
#   xero's zsh prompt <http://code.xero.nu/dotfiles>
#   eriner's eriner prompt <https://github.com/zimfw/zimfw/blob/master/modules/prompt/themes/eriner.zsh-theme>
#
# Requires the `git-info` zmodule to be included in the .zimrc file.

prompt_magicmace_help () {
  cat <<EOH
This theme is color-scheme-able. You can customize it using:

    prompt magicmace [user_color] [root_color] [normal_color] [error_color]

The default values are cyan, red, white, and red.
EOH
}

prompt_magicmace_main() {
  RETVAL=${?}
  local mace_color=${1}
  local normal_color=${2}
  local error_color=${3}

  # Status: Was there an error? Are there background jobs? Ranger spawned shell?
  local symbols=''
  (( RETVAL )) && symbols+="${error_color}${RETVAL}${normal_color}" # ${?} for error.
  (( $(jobs -l | wc -l) )) && symbols+='b' # 'b' for background.
  (( RANGER_LEVEL )) && symbols+='r' # 'r' for... you guessed it!
  [[ -n ${symbols} ]] && print -n "─${normal_color}${symbols}${mace_color}─"

  # Pwd: current working directory.
  local current_dir="${PWD/#${HOME}/~}"
  if [[ ${current_dir} != '~' ]]; then
    current_dir="${${(@j:/:M)${(@s:/:)current_dir:h}#?}%/}/${current_dir:t}"
  fi
  print -n "[${normal_color}${current_dir}${mace_color}]"
}

prompt_magicmace_precmd() {
  (( ${+functions[git-info]} )) && git-info
}

prompt_magicmace_setup() {
  autoload -Uz add-zsh-hook && add-zsh-hook precmd prompt_magicmace_precmd

  prompt_opts=(cr percent sp subst)

  local mace_color
  if (( EUID )); then
    mace_color="%F{${1:-cyan}}"
  else
    mace_color="%F{${2:-red}}"
  fi
  local normal_color="%F{${3:-white}}"
  local error_color="%F{${4:-red}}"

  zstyle ':zim:git-info:branch' format '%b'
  zstyle ':zim:git-info:commit' format '%c...'
  zstyle ':zim:git-info:dirty' format '*'
  zstyle ':zim:git-info:ahead' format '↑'
  zstyle ':zim:git-info:behind' format '↓'
  zstyle ':zim:git-info:keys' format \
    'prompt' "─[${normal_color}%b%c%D%A%B${mace_color}]"

  PS1="${mace_color}\$(prompt_magicmace_main ${mace_color} ${normal_color} ${error_color})\${(e)git_info[prompt]}── ─%f "
  RPS1=''
}

prompt_magicmace_preview () {
  if (( # )); then
    prompt_preview_theme magicmace "${@}"
  else
    prompt_preview_theme magicmace
    print
    prompt_preview_theme magicmace 15 3 14
  fi
}

prompt_magicmace_setup "${@}"
