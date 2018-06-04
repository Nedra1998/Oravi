# Char {{{
set -q ORAVI_CHAR_SYMBOL; or set ORAVI_CHAR_SYMBOL "❯"
set -q ORAVI_CHAR_PREFIX; or set ORAVI_CHAR_PREFIX ""
set -q ORAVI_CHAR_SUFFIX; or set ORAVI_CHAR_SUFFIX " "
set -q ORAVI_CHAR_COLOR_SUCCESS; or set ORAVI_CHAR_COLOR_SUCCESS "blue"
set -q ORAVI_CHAR_COLOR_FAILURE; or set ORAVI_CHAR_COLOR_FAILURE "red"
# }}}
# Dir {{{
set -q ORAVI_DIR_TRUNK; or set ORAVI_DIR_TRUNK "true"
set -q ORAVI_DIR_TRUNK_REPO; or set ORAVI_DIR_TRUNK_REPO "true"
set -q ORAVI_DIR_PREFIX; or set ORAVI_DIR_PREFIX ""
set -q ORAVI_DIR_SUFIX; or set ORAVI_DIR_SUFIX ""
set -q ORAVI_DIR_COLOR; or set ORAVI_DIR_COLOR "cyan"
# }}}
# Exec Time {{{
set ORAVI_EXEC_TIME_SYMBOL; or set ORAVI_EXEC_TIME_SYMBOL ""
set ORAVI_EXEC_TIME_PREFIX; or set ORAVI_EXEC_TIME_PREFIX " [$ORAVI_EXEC_TIME_SYMBOL "
set ORAVI_EXEC_TIME_SUFFIX; or set ORAVI_EXEC_TIME_SUFFIX "]"
set ORAVI_EXEC_TIME_COLOR; or set ORAVI_EXEC_TIME_COLOR "yellow"
set ORAVI_EXEC_TIME_ELAPSED; or set ORAVI_EXEC_TIME_ELAPSED 2000
# }}}
# Exit Code {{{
set -q ORAVI_EXIT_SYMBOL; or set ORAVI_EXIT_SYMBOL ""
set -q ORAVI_EXIT_PREFIX; or set ORAVI_EXIT_PREFIX " $ORAVI_EXIT_SYMBOL "
set -q ORAVI_EXIT_SUFFIX; or set ORAVI_EXIT_SUFFIX ""
set -q ORAVI_EXIT_COLOR; or set ORAVI_EXIT_COLOR "red"
# }}}
# Git {{{
set -q ORAVI_GIT_SYMBOL; or set ORAVI_GIT_SYMBOL ""
set -q ORAVI_GIT_BRANCH_PREFIX; or set ORAVI_GIT_BRANCH_PREFIX " $ORAVI_GIT_SYMBOL "
set -q ORAVI_GIT_BRANCH_SUFFIX; or set ORAVI_GIT_BRANCH_SUFFIX ""
set -q ORAVI_GIT_BRANCH_COLOR; or set ORAVI_GIT_BRANCH_COLOR "magenta"
set -q ORAVI_GIT_STATUS_PREFIX; or set ORAVI_GIT_STATUS_PREFIX " "
set -q ORAVI_GIT_STATUS_SUFFIX; or set ORAVI_GIT_STATUS_SUFFIX ""
set -q ORAVI_GIT_STATUS_COLOR; or set ORAVI_GIT_STATUS_COLOR "red"
set -q ORAVI_GIT_STATUS_UNTRACKED_COLOR; or set ORAVI_GIT_STATUS_UNTRACKED_COLOR "blue"
set -q ORAVI_GIT_STATUS_UNTRACKED; or set ORAVI_GIT_STATUS_UNTRACKED " "
set -q ORAVI_GIT_STATUS_ADDED_COLOR; or set ORAVI_GIT_STATUS_ADDED_COLOR "green"
set -q ORAVI_GIT_STATUS_ADDED; or set ORAVI_GIT_STATUS_ADDED " "
set -q ORAVI_GIT_STATUS_MODIFIED_COLOR; or set ORAVI_GIT_STATUS_MODIFIED_COLOR "yellow"
set -q ORAVI_GIT_STATUS_MODIFIED; or set ORAVI_GIT_STATUS_MODIFIED " "
set -q ORAVI_GIT_STATUS_RENAMED_COLOR; or set ORAVI_GIT_STATUS_RENAMED_COLOR "magenta"
set -q ORAVI_GIT_STATUS_RENAMED; or set ORAVI_GIT_STATUS_RENAMED " "
set -q ORAVI_GIT_STATUS_DELETED_COLOR; or set ORAVI_GIT_STATUS_DELETED_COLOR "red"
set -q ORAVI_GIT_STATUS_DELETED; or set ORAVI_GIT_STATUS_DELETED " "
set -q ORAVI_GIT_STATUS_STASHED_COLOR; or set ORAVI_GIT_STATUS_STASHED_COLOR "green"
set -q ORAVI_GIT_STATUS_STASHED=; or set ORAVI_GIT_STATUS_STASHED "\$ "
set -q ORAVI_GIT_STATUS_UNMERGED_COLOR; or set ORAVI_GIT_STATUS_UNMERGED_COLOR "cyan"
set -q ORAVI_GIT_STATUS_UNMERGED; or set ORAVI_GIT_STATUS_UNMERGED "= "
set -q ORAVI_GIT_STATUS_AHEAD_COLOR; or set ORAVI_GIT_STATUS_AHEAD_COLOR "cyan"
set -q ORAVI_GIT_STATUS_AHEAD; or set ORAVI_GIT_STATUS_AHEAD "⇡ "
set -q ORAVI_GIT_STATUS_BEHIND_COLOR; or set ORAVI_GIT_STATUS_BEHIND_COLOR "cyan"
set -q ORAVI_GIT_STATUS_BEHIND; or set ORAVI_GIT_STATUS_BEHIND "⇣ "
set -q ORAVI_GIT_STATUS_DIVERGED_COLOR; or set ORAVI_GIT_STATUS_DIVERGED_COLOR "cyan"
set -q ORAVI_GIT_STATUS_DIVERGED; or set ORAVI_GIT_STATUS_DIVERGED "⇕ "
# }}}
# Jobs {{{
set -q ORAVI_JOBS_PREFIX; or set ORAVI_JOBS_PREFIX ""
set -q ORAVI_JOBS_SUFFIX; or set ORAVI_JOBS_SUFFIX ""
set -q ORAVI_JOBS_SYMBOL; or set ORAVI_JOBS_SYMBOL "✦"
set -q ORAVI_JOBS_COLOR; or set ORAVI_JOBS_COLOR "blue"
# }}}
# PyEnv {{{
set -q ORAVI_PYENV_SYMBOL; or set ORAVI_PYENV_SYMBOL ""
set -q ORAVI_PYENV_PREFIX; or set ORAVI_PYENV_PREFIX " $ORAVI_PYENV_SYMBOL "
set -q ORAVI_PYENV_SUFFIX; or set ORAVI_PYENV_SUFFIX ""
set -q ORAVI_PYENV_COLOR; or set ORAVI_PYENV_COLOR "yellow"
# }}}
# SwiftEnv {{{
set -q ORAVI_SWIFTENV_SYMBOL; or set ORAVI_SWIFTENV_SYMBOL ""
set -q ORAVI_SWIFTENV_PREFIX; or set ORAVI_SWIFTENV_PREFIX " $ORAVI_SWIFTENV_SYMBOL "
set -q ORAVI_SWIFTENV_SUFFIX; or set ORAVI_SWIFTENV_SUFFIX ""
set -q ORAVI_SWIFTENV_COLOR; or set ORAVI_SWIFTENV_COLOR "red"
# }}}
# GoEnv {{{
set -q ORAVI_GOENV_SYMBOL; or set ORAVI_GOENV_SYMBOL ""
set -q ORAVI_GOENV_PREFIX; or set ORAVI_GOENV_PREFIX " $ORAVI_GOENV_SYMBOL "
set -q ORAVI_GOENV_SUFFIX; or set ORAVI_GOENV_SUFFIX ""
set -q ORAVI_GOENV_COLOR; or set ORAVI_GOENV_COLOR "blue"
# }}}
# RbEnv {{{
set -q ORAVI_RBENV_SYMBOL; or set ORAVI_RBENV_SYMBOL ""
set -q ORAVI_RBENV_PREFIX; or set ORAVI_RBENV_PREFIX " $ORAVI_RBENV_SYMBOL "
set -q ORAVI_RBENV_SUFFIX; or set ORAVI_RBENV_SUFFIX ""
set -q ORAVI_RBENV_COLOR; or set ORAVI_RBENV_COLOR "red"
# }}}
# User {{{
set -q ORAVI_USER_SHOW; or set ORAVI_USER_SHOW "true"
set -q ORAVI_USER_PREFIX; or set ORAVI_USER_PREFIX ""
set -q ORAVI_USER_SUFFIX; or set ORAVI_USER_SUFFIX ""
set -q ORAVI_USER_COLOR; or set ORAVI_USER_COLOR "black"
set -q ORAVI_USER_COLOR_ROOT; or set ORAVI_USER_COLOR_ROOT "yellow"
# }}}
# UserHost Char {{{
set -q ORAVI_USER_HOST_COLOR; or set ORAVI_USER_HOST_COLOR "black"
set -q ORAVI_USER_HOST_SYMBOL; or set ORAVI_USER_HOST_SYMBOL "@"
# }}}
# Host {{{
set -q ORAVI_HOST_SHOW; or set ORAVI_HOST_SHOW "true"
set -q ORAVI_HOST_SHOW_FULL; or set ORAVI_HOST_SHOW_FULL "false"
set -q ORAVI_HOST_PREFIX; or set ORAVI_HOST_PREFIX ""
set -q ORAVI_HOST_SUFIX; or set ORAVI_HOST_SUFIX ""
set -q ORAVI_HOST_COLOR; or set ORAVI_HOST_COLOR "black"
set -q ORAVI_HOST_COLOR_SSH; or set ORAVI_HOST_COLOR_SSH "black"
# }}}


function __oravi_basename
  string replace -r '^.*/' '' -- $argv
end

function __oravi_dirname
  string replace -r '/[^/]+/?$' '' -- $argv
end

function __oravi_repo_dir -a root -a dir
  string replace -r "$root" (__oravi_basename "$root") $dir
end

function __oravi_is_git 
  if not command -sq git
    return 1
  end
  echo (command git rev-parse --is-inside-work-tree 2>/dev/null)
end

function __oravi_exists -a cmd
  if not command -sq $cmd
    return 1
  end
  return 0
end

# TODO
function __oravi_displaytime -a time
  set -l D (math "$time/1000/60/60/24")
  set -l H (math "$time/1000/60/60%24")
  set -l M (math "$time/1000/60%60")
  set -l S (math "$time/1000%60")
  set -l MS (math "$time%1000")
  if [ $D != 0 ]; printf "%dd " $D; end
  if [ $H != 0 ]; printf "%dh " $H; end
  if [ $M != 0 ]; printf "%dm " $M; end
  if [ $S != 0 ]; printf "%ds " $S; end
  printf "%dμ" $MS
end

function __oravi_user
  if [ "$ORAVI_USER_SHOW" = "always" -o "$USER" = "root" -o \( "$ORAVI_USER_SHOW" = "true" -a -n "$SSH_CONNECTION" \) ]
    if [ "$USER" = "root" ]
      set_color -o $ORAVI_USER_COLOR_ROOT
    else
      set_color -o $ORAVI_USER_COLOR
    end
    printf "%s%s%s" "$ORAVI_USER_PREFIX" (whoami) "$ORAVI_USER_SUFFIX"
    set_color normal
  end
end

function __oravi_user_host
  if [ \( "$ORAVI_USER_SHOW" = "always" -o "$LONGNAME" != "$USER" -o "$USER" = "root" -o \( "$ORAVI_USER_SHOW" = "true" -a -n "$SSH_CONNECTION" \) \) -a \( "$ORAVI_HOST_SHOW" = "always" -o -n "$SSH_CONNECTION" \) ]
    set_color -o $ORAVI_USER_HOST_COLOR
    printf "$ORAVI_USER_HOST_SYMBOL"
    set_color normal
  end
end

function __oravi_host
  if [ "$ORAVI_HOST_SHOW" = "always" -o -n "$SSH_CONNECTION" ]
    if [ -n "$SSH_CONNECTION" ]
      set_color -o $ORAVI_HOST_COLOR_SSH
    else
      set_color -o $ORAVI_HOST_COLOR
    end
    printf "%s%s%s" "$ORAVI_HOST_PREFIX" (prompt_hostname) "$ORAVI_HOST_SUFIX"
    set_color normal
  end
end

function __oravi_dir
  set dir "$PWD"
  if [ "$ORAVI_DIR_TRUNK_REPO" = "true" -a (__oravi_is_git) ]
    set dir (__oravi_repo_dir (git rev-parse --show-toplevel) "$dir")
  else if [ "$ORAVI_DIR_TRUNK" = "true" ]
    set -l directory
    set -l parent
    switch "$dir"
      case /
        set dir '/'
      case "$HOME"
        set dir '~'
      case '*'
        set dir (__oravi_basename "$dir")
    end
  end
  set_color -o $ORAVI_DIR_COLOR
  printf "%s" "$dir"
  set_color normal
end

function __oravi_git
  if [ -z (__oravi_is_git) ]; return; end
  set -l ref (command git symbolic-ref --quiet HEAD 2> /dev/null)
  set -l ret $status
  if [ $status != 0 ]
    set ref (command git rev-parse --short HEAD 2> /dev/null); or return
  end
  set -l branch (string replace -r "refs/heads/" '' "$ref")
  set -l index (command git status --porcelain -b 2> /dev/null)
  set -l spacer false
  set_color -o $ORAVI_GIT_BRANCH_COLOR
  echo -n "$ORAVI_GIT_BRANCH_PREFIX$branch$ORAVI_GIT_BRANCH_SUFFIX"
  set_color normal
  # echo -n "$ORAVI_GIT_STATUS_PREFIX"
  if [ (string match -r " \?\? " "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_UNTRACKED_COLOR
    echo -n "$ORAVI_GIT_STATUS_UNTRACKED"
  end

  if [ (string match -r " A[ MDAU] " "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_ADDED_COLOR
    echo -n "$ORAVI_GIT_STATUS_ADDED"
  else if [ (string match -r " UA" "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_ADDED_COLOR
    echo -n "$ORAVI_GIT_STATUS_ADDED"
  end

  if [ (string match -r " M[ MD] " "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_MODIFIED_COLOR
    echo -n "$ORAVI_GIT_STATUS_MODIFIED"
  else if [ (string match -r " [ MARC]M" "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_MODIFIED_COLOR
    echo -n "$ORAVI_GIT_STATUS_MODIFIED"
  end

  if [ (string match -r " R[ MD]" "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_RENAMED_COLOR
    echo -n "$ORAVI_GIT_STATUS_RENAMED"
  end

  if [ (string match -r " [MARCDU ]D" "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_DELETED_COLOR
    echo -n "$ORAVI_GIT_STATUS_DELETED"
  else if [ (string match -r " D[ UM]" "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_DELETED_COLOR
    echo -n "$ORAVI_GIT_STATUS_DELETED"
  end

  if [ (command dig rev-parse --verify refs/stash >/dev/null 2>&1) ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_STASHED_COLOR
    echo -n "$ORAVI_GIT_STATUS_STASHED"
  end

  if [ (string match -r " U[UDA] " "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_UNMERGED_COLOR
    echo -n "$ORAVI_GIT_STATUS_UNMERGED"
  else if [ (string match -r " AA " "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_UNMERGED_COLOR
    echo -n "$ORAVI_GIT_STATUS_UNMERGED"
  else if [ (string match -r " DD " "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_UNMERGED_COLOR
    echo -n "$ORAVI_GIT_STATUS_UNMERGED"
  else if [ (string match -r " [DA]U " "$index") ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_UNMERGED_COLOR
    echo -n "$ORAVI_GIT_STATUS_UNMERGED"
  end

  set -l is_ahead false
  if [ (string match -r "\[ahead ") ]
    set -l is_ahead true
  end

  set -l is_behind false
  if [ (string match -r "\[behind") ]
    set -l is_behind true
  end

  if [ $is_ahead = true -a $is_behind = true ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_DIVERGED_COLOR
    echo -n "$ORAVI_GIT_STATUS_DIVERGED"
  else if [ $is_ahead = true ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_AHEAD_COLOR
    echo -n "$ORAVI_GIT_STATUS_AHEAD"
  else if [ $is_behind = true ]
    if [ $spacer == false ]; echo -n "$ORAVI_GIT_STATUS_PREFIX"; set -l spacer true; end
    set_color -o $ORAVI_GIT_STATUS_BEHIND_COLOR
    echo -n "$ORAVI_GIT_STATUS_BEHIND"
  end
  echo -n "$ORAVI_GIT_STATUS_SUFFIX"
  set_color normal

end

function __oravi_exec_time
  if [ $CMD_DURATION -ge $ORAVI_EXEC_TIME_ELAPSED ]
    set_color -o $ORAVI_EXEC_TIME_COLOR
    echo -n "$ORAVI_EXEC_TIME_PREFIX" (__oravi_displaytime $CMD_DURATION) "$ORAVI_EXEC_TIME_SUFFIX"
    set_color normal
  end
end

function __oravi_jobs
  set -l job_count (jobs | wc -l)
  if [ $job_count -eq 0 ]; return; end
  if [ $job_count -eq 1 ]; set -l job_count 0; end
  set_color -o $ORAVI_JOBS_COLOR
  echo -n "$ORAVI_JOBS_PREFIX$ORAVI_JOBS_SYMBOL$job_count$ORAVI_JOBS_SUFFIX"
  set_color normal
end

function __oravi_exit_code -a ret_val
  if [ $ret_val != 0 ]
    set_color -o $ORAVI_EXIT_COLOR
    echo -n "$ORAVI_EXIT_PREFIX$ret_val$ORAVI_EXIT_SUFFIX"
    set_color normal
  end
end

function __oravi_char -a ret_val
  if [ "$ret_val" = "0" ]
    set_color $ORAVI_CHAR_COLOR_SUCCESS
  else
    set_color $ORAVI_CHAR_COLOR_FAILURE
  end
  echo "$ORAVI_CHAR_PREFIX$ORAVI_CHAR_SYMBOL$ORAVI_CHAR_SUFFIX"
end

function __oravi_pyenv
  __oravi_exists pyenv or return
  set -l version (pyenv version-name)
  if [ "$version" != "system" ]
    set_color -o $ORAVI_PYENV_COLOR
    echo -n "$ORAVI_PYENV_PREFIX$version$ORAVI_PYENV_SUFFIX"
    set_color normal
  end
end
function __oravi_swiftenv
  __oravi_exists swiftenv or return
  set -l version (swiftenv version-name)
  if [ "$version" != "system" ]
    set_color -o $ORAVI_SWIFTENV_COLOR
    echo -n "$ORAVI_SWIFTENV_PREFIX$version$ORAVI_SWIFTENV_SUFFIX"
    set_color normal
  end
end
function __oravi_goenv
  __oravi_exists goenv or return
  set -l version (goenv version-name)
  if [ "$version" != "system" ]
    set_color $ORAVI_GOENV_COLOR
    echo -n "$ORAVI_GOENV_PREFIX$version$ORAVI_GOENV_SUFFIX"
    set_color normal
  end
end
function __oravi_rbenv
  __oravi_exists rbenv or return
  set -l version (rbenv version-name)
  if [ "$version" != "system" ]
    set_color $ORAVI_RBENV_COLOR
    echo -n "$ORAVI_RBENV_PREFIX$version$ORAVI_RBENV_SUFFIX"
    set_color normal
  end
end

function fish_prompt
  set -l ret_val $status
  __oravi_user
  __oravi_user_host
  __oravi_host
  __oravi_dir
  __oravi_git
  __oravi_pyenv
  __oravi_swiftenv
  __oravi_goenv
  __oravi_rbenv
  __oravi_exec_time
  __oravi_jobs
  __oravi_exit_code $ret_val
  __oravi_char $ret_val
  # Customize fish prompt
end
