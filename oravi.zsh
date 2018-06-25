#
# Oravi ZSH
#
# Author: Arden Rasmussen
# Licens: MIT
#

export ORAVI_VERSION='1.0'

# CONFIGURATION {{{
if [ -z "$ORAVI_PROMPT_ORDER" ]; then
  ORAVI_PROMPT_ORDER=(
    # time
    # space
    user
    user_host
    host
    dir
    git
    pyenv
    swiftenv
    goenv
    rbenv
    exec_time
    jobs
    exit_code
    char
  )
fi

# Char {{{
ORAVI_CHAR_SYMBOL="${ORAVI_CHAR_SYMBOL:-""}"
ORAVI_CHAR_PREFIX="${ORAVI_CHAR_PREFIX:-""}"
ORAVI_CHAR_SUFFIX="${ORAVI_CHAR_SUFFIX:-" "}"
ORAVI_CHAR_COLOR_SUCCESS="${ORAVI_CHAR_COLOR_SUCCESS:-"blue"}"
ORAVI_CHAR_COLOR_FAILURE="${ORAVI_CHAR_COLOR_FAILURE:-"red"}"
# }}}
# Dir {{{
ORAVI_DIR_TRUNC="${ORAVI_DIR_TRUNC:-false}"
ORAVI_DIR_TRUNC_REPO="${ORAVI_DIR_TRUNC_REPO:-false}"
ORAVI_DIR_PREFIX="${ORAVI_DIR_PREFIX:-""}"
ORAVI_DIR_SUFFIX="${ORAVI_DIR_SUFFIX:-""}"
ORAVI_DIR_COLOR="${ORAVI_DIR_COLOR:-"cyan"}"
# }}}
# Exec Time {{{
ORAVI_EXEC_TIME_SYMBOL="${ORAVI_EXEC_TIME_SYMBOL:-""}"
ORAVI_EXEC_TIME_PREFIX="${ORAVI_EXEC_TIME_PREFIX:-" [$ORAVI_EXEC_TIME_SYMBOL "}"
ORAVI_EXEC_TIME_SUFFIX="${ORAVI_EXEC_TIME_SUFFIX:-"]"}"
ORAVI_EXEC_TIME_COLOR="${ORAVI_EXEC_TIME_COLOR="yellow"}"
ORAVI_EXEC_TIME_ELAPSED="${ORAVI_EXEC_TIME_ELAPSED=2}"
# }}}
# Exit Code {{{
ORAVI_EXIT_SYMBOL="${ORAVI_EXIT_SYMBOL:-""}"
ORAVI_EXIT_PREFIX="${ORAVI_EXIT_PREFIX:-" $ORAVI_EXIT_SYMBOL "}"
ORAVI_EXIT_SUFFIX="${ORAVI_EXIT_SUFFIX:-""}"
ORAVI_EXIT_COLOR="${ORAVI_EXIT_COLOR:-"red"}"
# }}}
# Git {{{
ORAVI_GIT_SYMBOL="${ORAVI_GIT_SYMBOL:-""}"
ORAVI_GIT_BRANCH_PREFIX="${ORAVI_GIT_BRANCH_PREFIX:-" $ORAVI_GIT_SYMBOL "}"
ORAVI_GIT_BRANCH_SUFFIX="${ORAVI_GIT_BRANCH_SUFFIX:-""}"
ORAVI_GIT_BRANCH_COLOR="${ORAVI_GIT_BRANCH_COLOR:-"magenta"}"
ORAVI_GIT_STATUS_PREFIX="${ORAVI_GIT_STATUS_PREFIX:-" "}"
ORAVI_GIT_STATUS_SUFFIX="${ORAVI_GIT_STATUS_SUFFIX:-""}"
ORAVI_GIT_STATUS_COLOR="${ORAVI_GIT_STATUS_COLOR:-"red"}"
ORAVI_GIT_STATUS_UNTRACKED_COLOR="${ORAVI_GIT_STATUS_UNTRACKED_COLOR:-"blue"}"
ORAVI_GIT_STATUS_UNTRACKED="${ORAVI_GIT_STATUS_UNTRACKED:-" "}"
ORAVI_GIT_STATUS_ADDED_COLOR="${ORAVI_GIT_STATUS_ADDED_COLOR:-"green"}"
ORAVI_GIT_STATUS_ADDED="${ORAVI_GIT_STATUS_ADDED:-" "}"
ORAVI_GIT_STATUS_MODIFIED_COLOR="${ORAVI_GIT_STATUS_MODIFIED_COLOR:-"yellow"}"
ORAVI_GIT_STATUS_MODIFIED="${ORAVI_GIT_STATUS_MODIFIED:-" "}"
ORAVI_GIT_STATUS_RENAMED_COLOR="${ORAVI_GIT_STATUS_RENAMED_COLOR:-"magenta"}"
ORAVI_GIT_STATUS_RENAMED="${ORAVI_GIT_STATUS_RENAMED:-" "}"
ORAVI_GIT_STATUS_DELETED_COLOR="${ORAVI_GIT_STATUS_DELETED_COLOR:-"red"}"
ORAVI_GIT_STATUS_DELETED="${ORAVI_GIT_STATUS_DELETED:-" "}"
ORAVI_GIT_STATUS_STASHED_COLOR="${ORAVI_GIT_STATUS_UNMERGED_COLOR="green"}"
ORAVI_GIT_STATUS_STASHED="${ORAVI_GIT_STATUS_STASHED="$ "}"
ORAVI_GIT_STATUS_UNMERGED_COLOR="${ORAVI_GIT_STATUS_UNMERGED_COLOR:-"cyan"}"
ORAVI_GIT_STATUS_UNMERGED="${ORAVI_GIT_STATUS_UNMERGED:-"= "}"
ORAVI_GIT_STATUS_AHEAD_COLOR="${ORAVI_GIT_STATUS_AHEAD_COLOR:-"cyan"}"
ORAVI_GIT_STATUS_AHEAD="${ORAVI_GIT_STATUS_AHEAD:-"⇡ "}"
ORAVI_GIT_STATUS_BEHIND_COLOR="${ORAVI_GIT_STATUS_BEHIND_COLOR:-"cyan"}"
ORAVI_GIT_STATUS_BEHIND="${ORAVI_GIT_STATUS_BEHIND:-"⇣ "}"
ORAVI_GIT_STATUS_DIVERGED_COLOR="${ORAVI_GIT_STATUS_DIVERGED_COLOR:-"cyan"}"
ORAVI_GIT_STATUS_DIVERGED="${ORAVI_GIT_STATUS_DIVERGED:-"⇕ "}"
# }}}
# Jobs {{{
ORAVI_JOBS_PREFIX="${ORAVI_JOBS_PREFIX:-""}"
ORAVI_JOBS_SUFFIX="${ORAVI_JOBS_SUFFIX:-""}"
ORAVI_JOBS_SYMBOL="${ORAVI_JOBS_SYMBOL:="✦"}"
ORAVI_JOBS_COLOR="${ORAVI_JOBS_COLOR:-"blue"}"
# }}}
# PyEnv {{{
ORAVI_PYENV_SYMBOL="${ORAVI_PYENV_SYMBOL:-""}"
ORAVI_PYENV_PREFIX="${ORAVI_PYENV_PREFIX:-" $ORAVI_PYENV_SYMBOL "}"
ORAVI_PYENV_SUFFIX="${ORAVI_PYENV_SUFFIX:-""}"
ORAVI_PYENV_COLOR="${ORAVI_PYENV_COLOR:-"yellow"}"
# }}}
# SwiftEnv {{{
ORAVI_SWIFTENV_SYMBOL="${ORAVI_SWIFTENV_SYMBOL:-""}"
ORAVI_SWIFTENV_PREFIX="${ORAVI_SWIFTENV_PREFIX:-" $ORAVI_SWIFTENV_SYMBOL "}"
ORAVI_SWIFTENV_SUFFIX="${ORAVI_SWIFTENV_SUFFIX:-""}"
ORAVI_SWIFTENV_COLOR="${ORAVI_SWIFTENV_COLOR:-"red"}"
# }}}
# GoEnv {{{
ORAVI_GOENV_SYMBOL="${ORAVI_GOENV_SYMBOL:-""}"
ORAVI_GOENV_PREFIX="${ORAVI_GOENV_PREFIX:-" $ORAVI_GOENV_SYMBOL "}"
ORAVI_GOENV_SUFFIX="${ORAVI_GOENV_SUFFIX:-""}"
ORAVI_GOENV_COLOR="${ORAVI_GOENV_COLOR:-"blue"}"
# }}}
# RbEnv {{{
ORAVI_RBENV_SYMBOL="${ORAVI_RBENV_SYMBOL:-""}"
ORAVI_RBENV_PREFIX="${ORAVI_RBENV_PREFIX:-" $ORAVI_RBENV_SYMBOL "}"
ORAVI_RBENV_SUFFIX="${ORAVI_RBENV_SUFFIX:-""}"
ORAVI_RBENV_COLOR="${ORAVI_RBENV_COLOR:-"red"}"
# }}}
# Time {{{
ORAVI_TIME_PREFIX="${ORAVI_TIME_PREFIX:-""}"
ORAVI_TIME_SUFFIX="${ORAVI_TIME_SUFFIX:-""}"
ORAVI_TIME_FORMAT="${ORAVI_TIME_FORMAT:-false}"
ORAVI_TIME_12HR="${ORAVI_TIME_12HR:-false}"
ORAVI_TIME_COLOR="${ORAVI_TIME_COLOR:-"yellow"}"
# }}}
# User {{{
ORAVI_USER_SHOW="${ORAVI_USER_SHOW:-true}"
ORAVI_USER_PREFIX="${ORAVI_USER_PREFIX:-""}"
ORAVI_USER_SUFFIX="${ORAVI_USER_SUFFIX:-""}"
ORAVI_USER_COLOR="${ORAVI_USER_COLOR:-"black"}"
ORAVI_USER_COLOR_ROOT="${ORAVI_USER_COLOR_ROOT:-"yellow"}"
# }}}
# UserHost Char {{{
ORAVI_USER_HOST_COLOR="${ORAVI_USER_HOST_COLOR:-"black"}"
ORAVI_USER_HOST_SYMBOL="${ORAVI_USER_HOST_SYMBOL:-"@"}"
# }}}
# Host {{{
ORAVI_HOST_SHOW="${ORAVI_HOST_SHOW:-true}"
ORAVI_HOST_SHOW_FULL="${ORAVI_HOST_SHOW_FULL:=false}"
ORAVI_HOST_PREFIX="${ORAVI_HOST_PREFIX:-""}"
ORAVI_HOST_SUFFIX="${ORAVI_HOST_SUFFIX:-""}"
ORAVI_HOST_COLOR="${ORAVI_HOST_COLOR:-"black"}"
ORAVI_HOST_COLOR_SSH="${ORAVI_HOST_COLOR:-"black"}"
# }}}

# }}}

# UTILITIES {{{
oravi::is_git() {
  command git rev-parse --is-inside-work-tree &>/dev/null
}

oravi::exists() {
  command -v $1 > /dev/null 2>&1
}

oravi::displaytime() {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd ' $D
  [[ $H > 0 ]] && printf '%dh ' $H
  [[ $M > 0 ]] && printf '%dm ' $M
  printf '%ds' $S
}

oravi::async() {
  local command_to_exec="$1"
  local reslove="$2"
  local reject="$3"
  [[ -z "$command_to_exec" ]] || [[ -z "$reject" ]] || [[ -z "$resolve" ]] && {
    printf "%s\n" "Insufficient number of arguments";
    return 1;
  }
  local __tmp=( "$command_to_exec" "$reject" "$resolve" )
  for _c in "${__tmp[@]}"; do
    read -d " " comm <<<"${_c}"
    type "${comm}" &>/dev/null
    local status=$?

    (( status != 0 )) && {
      printf "\"%s\" is neither a function nor a recognized command\n" "${_c}";
      unset _c
      return 1;
    }
  done
  unset __tmp; unset _c
  {
    __result=$($command_to_exec)
    status=$?
    (( status == 0 )) && {
      $reslve "${__result}"
    } || {
      $reject "${status}"
    }
    unset __result
  } &
  JOB_IDS+=( "${JOBS} ${command}" )
  read -d " " -a __kunk__ <<< "${JOB_IDS[$(( ${#JOB_IDS[@]} - 1 ))]}"
  echo ${__kunk__}
  : $(( JOBS++ ))
}

oravi_rgb() {
  echo -n $'%{\e[38;2;'$1';'$2';'$3'm%}'
}
# }}}

# HOOKS {{{
oravi_exec_time_preexec_hook() {
  [[ $ORAVI_EXEC_TIME_SHOW == false ]] && return
  ORAVI_EXEC_TIME_start=$(date +%s)
}

oravi_exec_time_precmd_hook() {
  [[ $ORAVI_EXEC_TIME_SHOW == false ]] && return
  [[ -n $ORAVI_EXEC_TIME_duration ]] && unset ORAVI_EXEC_TIME_duration
  [[ -z $ORAVI_EXEC_TIME_start ]] && return
  local ORAVI_EXEC_TIME_stop=$(date +%s)
  ORAVI_EXEC_TIME_duration=$(( $ORAVI_EXEC_TIME_stop - $ORAVI_EXEC_TIME_start ))
  unset ORAVI_EXEC_TIME_start
}
# }}}

# SECTIONS {{{

# Char {{{
oravi_char() {
  local color
  if [[ $RETVAL -eq 0 ]]; then
    color="$ORAVI_CHAR_COLOR_SUCCESS"
  else
    color="$ORAVI_CHAR_COLOR_FAILURE"
  fi
  echo -n "%F{$color}$ORAVI_CHAR_PREFIX$ORAVI_CHAR_SYMBOL$ORAVI_CHAR_SUFFIX%f"
}
# }}}
# Dir {{{
oravi_dir() {
  local dir
  if [[ $ORAVI_DIR_TRUNC == true ]]; then
    dir="%c"
  elif [[ $ORAVI_DIR_TRUNC_REPO == true ]] && oravi::is_git; then
    local git_root=$(git rev-parse --show-toplevel)
    dir="$git_root:t${$(expr $(pwd) : "$git_root\(.*\)")}"
  else
    dir="%~"
  fi
  echo -n "%F{$ORAVI_DIR_COLOR}%B$ORAVI_DIR_PREFIX$dir$ORAVI_DIR_SUFFIX%b%f"
}
# }}}
# Exec Time {{{
oravi_exec_time() {
  if [[ $ORAVI_EXEC_TIME_duration -ge $ORAVI_EXEC_TIME_ELAPSED ]]; then
    echo -n "%F{$ORAVI_EXEC_TIME_COLOR}%B$ORAVI_EXEC_TIME_PREFIX$(oravi::displaytime $ORAVI_EXEC_TIME_duration)$ORAVI_EXEC_TIME_SUFFIX%b%f"
  fi
}
# }}}
# Exit Code {{{
oravi_exit_code() {
  [[ $RETVAL == 0 ]]  && return
  echo -n "%F{$ORAVI_EXIT_COLOR}%B$ORAVI_EXIT_PREFIX$RETVAL$ORAVI_EXIT_SUFFIX%b%f"
}
# }}}
# Git {{{
oravi_git() {
  oravi::is_git || return

  local ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null) ret=$?
  if [[ $ret != 0 ]]; then
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  local git_current_branch=${ref#refs/heads/}
  echo -n "%F{$ORAVI_GIT_BRANCH_COLOR}%B$ORAVI_GIT_BRANCH_PREFIX${git_current_branch}$ORAVI_GIT_BRANCH_SUFFIX%b%f"

  local INDEX git_statu=""
  INDEX=$(command git status --porcelain -b 2> /dev/null)

  # Check for untracked files
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_UNTRACKED_COLOR}$ORAVI_GIT_STATUS_UNTRACKED$git_status"
  fi

  # Checked for staged files
  if $(echo "$INDEX" | command grep -E '^A[ MDAU] ' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_ADDED_COLOR}$ORAVI_GIT_STATUS_ADDED$git_status"
  elif $(echo "$INDEX" | command grep '^UA' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_ADDED_COLOR}$ORAVI_GIT_STATUS_ADDED$git_status"
  fi

  # Check for modified files
  if $(echo "$INDEX" | command grep '^M[ MD] ' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_MODIFIED_COLOR}$ORAVI_GIT_STATUS_MODIFIED$git_status"
  elif $(echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_MODIFIED_COLOR}$ORAVI_GIT_STATUS_MODIFIED$git_status"
  fi

  # Check for renamed files
  if $(echo "$INDEX" | command grep '^R[ MD] ' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_RENAMED_COLOR}$ORAVI_GIT_STATUS_RENAMED$git_status"
  fi

  # Check for deleted files
  if $(echo "$INDEX" | command grep '^[MARCDU ]D ' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_DELETED_COLOR}$ORAVI_GIT_STATUS_DELETED$git_status"
  elif $(echo "$INDEX" | command grep '^D[ UM] ' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_DELETED_COLOR}$ORAVI_GIT_STATUS_DELETED$git_status"
  fi

  # Check for stashes
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    git_status="%F{$ORAVI_GIT_STATUS_STASHED_COLOR}$ORAVI_GIT_STATUS_STASHED$git_status"
  fi

  # Check for unmerged files
  if $(echo "$INDEX" | command grep '^U[UDA] ' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_UNMERGED_COLOR}$ORAVI_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^AA ' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_UNMERGED_COLOR}$ORAVI_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^DD ' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_UNMERGED_COLOR}$ORAVI_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^[DA]U ' &> /dev/null); then
    git_status="%F{$ORAVI_GIT_STATUS_UNMERGED_COLOR}$ORAVI_GIT_STATUS_UNMERGED$git_status"
  fi

  # Check whether branch is ahead
  local is_ahead=false
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    is_ahead=true
  fi

  # Check whether branch is behind
  local is_behind=false
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*behind' &> /dev/null); then
    is_behind=true
  fi

  # Check wheather branch has diverged
  if [[ "$is_ahead" == true && "$is_behind" == true ]]; then
    git_status="%F{$ORAVI_GIT_STATUS_DIVERGED_COLOR}$ORAVI_GIT_STATUS_DIVERGED$git_status"
  else
    [[ "$is_ahead" == true ]] && git_status="%F{$ORAVI_GIT_STATUS_AHEAD_COLOR}$ORAVI_GIT_STATUS_AHEAD$git_status"
    [[ "$is_behind" == true ]] && git_status="%F{$ORAVI_GIT_STATUS_BEHIND_COLOR}$ORAVI_GIT_STATUS_BEHIND$git_status"
  fi

  if [[ -n $git_status ]]; then
    echo -n "%B$ORAVI_GIT_STATUS_PREFIX$git_status$ORAVI_GIT_STATUS_SUFFIX%b%f"
  fi
}
# }}}
# Jobs {{{
oravi_jobs() {
  local jobs_amount=$( (jobs) | wc -l)
  [[ $jobs_amount -gt 0 ]] || return
  [[ $jobs_amount -eq 1 ]] && jobs_amout=''
  echo -n "%F{$ORAVI_JOBS_COLOR}%B$ORAVI_JOBS_PREFIX$ORAVI_JOBS_SYMBOL$jobs_amount$ORAVI_JOBS_SUFFIX%b%f"
}
# }}}
# PyEnv {{{
oravi_pyenv() {
  oravi::exists pyenv || return
  local pyenv_status="$(pyenv version-name)"
  if [[ $pyenv_status != 'system' ]]; then
    echo -n "%F{$ORAVI_PYENV_COLOR}%B$ORAVI_PYENV_PREFIX$pyenv_status$ORAVI_PYENV_SUFFIX%b%f"
  fi
}
# }}}
# SwiftEnv {{{
oravi_swiftenv() {
  oravi::exists swiftenv || return
  local swiftenv_status="$(swiftenv version-name)"
  if [[ $swiftenv_status != 'system' ]]; then
    echo -n "%F{$ORAVI_SWIFTENV_COLOR}%B$ORAVI_SWIFTENV_PREFIX$swiftenv_status$ORAVI_SWIFTENV_SUFFIX%b%f"
  fi
}
# }}}
# GoEnv {{{
oravi_goenv() {
  oravi::exists goenv || return
  local goenv_status="$(goenv version-name)"
  if [[ $goenv_status != 'system' ]]; then
    echo -n "%F{$ORAVI_GOENV_COLOR}$ORAVI_GOENV_PREFIX$goenv_status$ORAVI_GOENV_SUFFIX%b%f"
  fi
}
# }}}
# RbEnv {{{
oravi_rbenv() {
  oravi::exists rbenv || return
  local rbenv_status="$(rbenv version-name)"
  if [[ $rbenv_status != 'system' ]]; then
    echo -n "%F{$ORAVI_RBENV_COLOR}$ORAVI_RBENV_PREFIX$rbenv_status$ORAVI_RBENV_SUFFIX%b%f"
  fi
}
# }}}
# Host {{{
oravi_host() {
  if [[ $ORAVI_HOST_SHOW == 'always' ]] || [[ -n $SSH_CONNECTION ]]; then
    local host_color host
    if [[ -n $SSH_CONNECTION ]]; then
      host_color="$ORAVI_HOST_COLOR_SSH"
    else
      host_color="$ORAVI_HOST_COLOR"
    fi
    if [[ $ORAVI_HOST_SHOW_FULL == true ]]; then
      host="%M"
    else
      host="%m"
    fi
    echo -n "%F{$host_color}%B$ORAVI_HOST_PREFIX$host$ORAVI_HOST_SUFFIX%b%f"
  fi
}
# }}}
# Space {{{
oravi_space() {
  echo -n " "
}
# }}}
# Time {{{
oravi_time() {
  local time_str
  if [[ $ORAVI_TIME_FORMAT != false ]]; then
    time_str="${ORAVI_TIME_FORMAT}"
  elif [[ $ORAVI_TIME_12HR == true ]]; then
    time_str="%D{%r}"
  else
    time_str="%D{%T}"
  fi
  echo -n "%F{$ORAVI_TIME_COLOR}$ORAVI_TIME_PREFIX$time_str$ORAVI_TIME_SUFFIX%f"
}
# }}}
# User {{{
oravi_user() {
  if [[ $ORAVI_USER_SHOW == 'always' ]] \
  || [[ $UID == 0 ]] \
  || [[ $ORAVI_USER_SHOW == true && -n $SSH_CONNECTION ]]; then
    local user_color
    if [[ $USER == 'root' ]]; then
      user_color="$ORAVI_USER_COLOR_ROOT"
    else
      user_color="$ORAVI_USER_COLOR"
    fi
    echo -n "%F{$user_color}%B$ORAVI_USER_PREFIX%n$ORAVI_USER_SUFFIX%b%f"
  fi
}
# }}}
# User/Host {{{
oravi_user_host() {
  if ([[ $ORAVI_USER_SHOW == 'always' ]] \
  || [[ $LONGNAME != $USER ]] \
  || [[ $UID == 0 ]] \
  || [[ $ORAVI_USER_SHOW == true && -n $SSH_CONNECTION ]]) \
  && ([[ $ORAVI_HOST_SHOW == 'always' ]] \
  || [[ -n $SSH_CONNECTION ]]); then
    echo -n "%F{$ORAVI_USER_HOST_COLOR}%B$ORAVI_USER_HOST_SYMBOL%b%f"
  fi
}
# }}}

# }}}

# PROMPT {{{
oravi_prompt() {
  RETVAL=$?

  for section in $ORAVI_PROMPT_ORDER; do
    oravi_$section
  done
}
# }}}

# SETUP {{{
prompt_oravi_setup() {
  autoload -Uz add-zsh-hook
  prompt_opts=(cr percent sp subst)
  setopt noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"

  add-zsh-hook preexec oravi_exec_time_preexec_hook
  add-zsh-hook precmd oravi_exec_time_precmd_hook

  VIRTUAL_ENV_DISABLE_PROMPT=true

  PROMPT='$(oravi_prompt)'
}
# }}}

prompt_oravi_setup "$@"
