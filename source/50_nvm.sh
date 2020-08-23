if [[ "$use_nvm" != "1" ]] ; then
	return 1
fi
echo "Setting up NVM"

if [ -d ~/.nvm ] ; then
	# NodeJS env
	export PATH=./node_modules/.bin:$PATH
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
	[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
fi
