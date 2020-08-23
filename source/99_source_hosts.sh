source $DOTFILES/bin/dotfiles "source"

# Set machine-specific stuff
localConf=`hostname -s`.env
if [ ! -f $DOTFILES/source_hosts/$localConf ] ; then
	echo "No env settings at $DOTFILES/source_hosts/$localConf"
else
	echo Loading configurations from: $DOTFILES/source_hosts/$localConf
	. $DOTFILES/source_hosts/$localConf
fi
