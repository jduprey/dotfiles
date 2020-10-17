# Where the magic happens.
export DOTFILES=~/.dotfiles

alias shopt=$DOTFILES/bin/shopt # not exactly an exact match

# OS detection
function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}
function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}
function is_ubuntu_desktop() {
  dpkg -l ubuntu-desktop >/dev/null 2>&1 || return 1
}
function get_os() {
  for os in osx ubuntu ubuntu_desktop; do
    is_$os; [[ $? == ${1:-0} ]] && echo $os
  done
}


# Remove an entry from $PATH
# Based on http://stackoverflow.com/a/2108540/142339
function path_remove() {
  local arg path
  path=":$PATH:"
  for arg in "$@"; do path="${path//:$arg:/:}"; done
  path="${path%:}"
  path="${path#:}"
  echo "$path"
}
