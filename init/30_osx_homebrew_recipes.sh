# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

# Homebrew recipes
recipes=(
  ack
  # ansible
  awscli
  bash
  bartender
  bash-completion2
  bfg
  binutils
  # cmatrix
  coreutils
  # cowsay
  findutils
  git
  git-extras
  github
  gnu-sed
  htop
  hub
  imagemagick
  iterm2
  # id3tool
  jenv
  jq
  # lesspipe
  maven
  man2html
  moreutils
  # mercurial
  nmap
  pipx
  # postgresql
  # powerline-go
  pre-commit
  readline
  ruby
  # reattach-to-user-namespace
  # sl
  # smartmontools
  speedtest_cli
  ssh-copy-id
  starship
  sqlite
  # telnet
  terminal-notifier
  # the_silver_searcher
  # thefuck
  tmux
  tmux-xpanes
  tree
  # vim --with-override-system-vi
  visual-studio-code
  wget
  webkit2png
)

brew_install_recipes

# Misc cleanup!

# This is where brew stores its binary symlinks
local binroot="$(brew --config | awk '/HOMEBREW_PREFIX/ {print $2}')"/bin

# htop
if [[ "$(type -P $binroot/htop)" ]] && [[ "$(stat -L -f "%Su:%Sg" "$binroot/htop")" != "root:wheel" ]]; then
  e_header "Updating htop permissions"
  sudo chown root:wheel "$binroot/htop"
  sudo chmod u+s "$binroot/htop"
fi

# bash
if [[ "$(type -P $binroot/bash)" && "$(cat /etc/shells | grep -q "$binroot/bash")" ]]; then
  e_header "Adding $binroot/bash to the list of acceptable shells"
  echo "$binroot/bash" | sudo tee -a /etc/shells >/dev/null
fi
# if [[ "$(dscl . -read ~ UserShell | awk '{print $2}')" != "$binroot/bash" ]]; then
#   e_header "Making $binroot/bash your default shell"
#   sudo chsh -s "$binroot/bash" "$USER" >/dev/null 2>&1
#   e_arrow "Please exit and restart all your shells."
# fi
