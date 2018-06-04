# Char {{{
set -q ORAVI_CHAR_SYMBOL; or set ORAVI_CHAR_SYMBOL "❯"
set -q ORAVI_CHAR_PREFIX; or set ORAVI_CHAR_PREFIX ""
set -q ORAVI_CHAR_SUFFIX; or set ORAVI_CHAR_SUFFIX " "
set -q ORAVI_CHAR_COLOR_SUCCESS; or set ORAVI_CHAR_COLOR_SUCCESS "blue"
set -q ORAVI_CHAR_COLOR_FAILURE; or set ORAVI_CHAR_COLOR_FAILURE "red"
# }}}
# Dir {{{
set -q ORAVI_DIR_TRUNK; or set ORAVI_DIR_TRUNK "false"
set -q ORAVI_DIR_TRUNK_REPO; or set ORAVI_DIR_TRUNK_REPO "false"
set -q ORAVI_DIR_PREFIX; or set ORAVI_DIR_PREFIX ""
set -q ORAVI_DIR_SUFIX; or set ORAVI_DIR_SUFIX ""
set -q ORAVI_DIR_COLOR; or set ORAVI_DIR_COLOR "cyan"
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

# TODO
function __oravi_dir
  set dir "$PWD"
  if [ "$ORAVI_DIR_TRUNK" = "true" ]
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

function __oravi_char
  echo "$ORAVI_CHAR_PREFIX$ORAVI_CHAR_SYMBOL$ORAVI_CHAR_SUFFIX"
end

function fish_prompt
  __oravi_user
  __oravi_user_host
  __oravi_host
  __oravi_dir
  # __oravi_git
  __oravi_char
  # Customize fish prompt
end
