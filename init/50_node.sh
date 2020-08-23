# Install volta if necessary
if [[ ! "$VOLTA_HOME" ]]; then
  curl https://get.volta.sh | bash -s -- --skip-setup
  export VOLTA_HOME=~/.volta
  grep --silent "$VOLTA_HOME/bin" <<< $PATH || export PATH="$VOLTA_HOME/bin:$PATH"
  volta install node
  volta install yarn
  volta install tsc
fi

# TODO decide what to do with NVM - or use volta
if [ ! -d ~/.nvm ] ; then
	echo "!! Install nvm at https://github.com/creationix/nvm"
fi
