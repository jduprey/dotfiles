export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# brew --prefix slows down terminal startup, just set these paths
export BREW_PATH=/usr/local # $(brew --prefix)
export BREW_COREUTILS_PATH=/usr/local/opt/coreutils # $(brew --prefix coreutils)
export BREW_GNUSED_PATH=/usr/local/opt/gnu-sed # $(brew --prefix gnu-sed)
export BREW_BINUTILS_PATH=/usr/local/opt/binutils # $(brew --prefix binutils)
export BREW_RUBY_PATH=/usr/local/opt/ruby # $(brew --prefix ruby)
export BREW_OPENSSL_PATH=/usr/local/opt/openssl@1.1 # "$(brew --prefix openssl)"
export BREW_READLINE_PATH=/usr/local/opt/readline # "$(brew --prefix readline)"
export BREW_ZLIB_PATH=/usr/local/opt/zlib # "$(brew --prefix zlib)"



if [ -d $BREW_COREUTILS_PATH/libexec/gnubin ] ; then
	export PATH=$BREW_COREUTILS_PATH/libexec/gnubin:$PATH
	export PATH=$BREW_BINUTILS_PATH/bin:$PATH
	export MANPATH=$BREW_COREUTILS_PATH/libexec/gnuman:$BREW_COREUTILS_PATH/share/man:$MANPATH
	export CPPFLAGS="-O2 -I$BREW_OPENSSL_PATH/include  -I$BREW_READLINE_PATH/include -I$(xcrun --show-sdk-path)/usr/include -I$BREW_ZLIB_PATH/include $CPPFLAGS"
	export CFLAGS="-O2 -I$BREW_OPENSSL_PATH/include  -I$BREW_READLINE_PATH/include -I$(xcrun --show-sdk-path)/usr/include -I$BREW_ZLIB_PATH/include $CFLAGS"
	export LDFLAGS="-L/usr/local/opt/binutils/lib -L$BREW_OPENSSL_PATH/lib -L$BREW_READLINE_PATH/lib -L$BRWE_ZLIB_PATH/lib"	
	export AR=/usr/bin/ar
else
	echo "!! No gnu core utils installed?"
fi

if [ -d $BREW_GNUSED_PATH/libexec/gnubin ] ; then
	export PATH=$BREW_GNUSED_PATH/libexec/gnubin:$PATH
else
	echo "!! No gnu sed installed?"
fi

if [ -d $BREW_RUBY_PATH/bin ] ; then
	export PATH=$BREW_RUBY_PATH/bin:$PATH
	export MANPATH=$BREW_RUBY_PATH/share/man:$MANPATH
else
	echo "No brew ruby installed?"
fi

if [ -d $BREW_PATH/sbin ] ; then
	export PATH=$BREW_PATH/sbin:$PATH
fi

export PATH=$BREW_PATH/bin:$PATH

