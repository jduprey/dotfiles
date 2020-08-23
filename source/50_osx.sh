# OSX-only stuff. Abort if not OSX.
is_osx || return 1

export OSX_VERSION=`sw_vers -productVersion`
export OSX_MAJOR_VERSION=`echo $OSX_VERSION | sed -e's/.[0-9]*$//'`

# APPLE, Y U PUT /usr/bin B4 /usr/local/bin?!
PATH="/usr/local/bin:$(path_remove /usr/local/bin)"
export PATH

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Make 'less' more.
[[ "$(type -P lesspipe.sh)" ]] && eval "$(lesspipe.sh)"

# Start ScreenSaver. This will lock the screen if locking is enabled.
alias ss="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

# Iterm 2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

alias p4merge=/Applications/p4merge.app/Contents/MacOS/p4merge

alias POSTXML='POST -c "application/xml"'
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

alias ls='ls -F --color=auto'
# alias ls="command ls ${colorflag} -F"
