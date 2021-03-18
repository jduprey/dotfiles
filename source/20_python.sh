if [[ "$use_python" != "1" || "$PYTHON_INITIALIZED" -ne "" ]] ; then
	return 1
fi
echo "Setting up Python"

### Install
## curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

if [ ! -d ~/.pyenv ] ; then
	echo "!! Install pyenv: curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash"
fi

# TODO: migrate these shared configs to 50_shared_conf.sh?
if [ ! -d ~/.ipython/ ] ; then
	ln -s ~/Documents/Python/Notebooks/etc/ipython ~/.ipython
fi

if [ ! -d ~/.jupyter ] ; then
	ln -s ~/Documents/Python/Notebooks/etc/jupyter ~/.jupyter
fi

# These are now set by HOMEBREW config
# export AR=/usr/bin/ar
# export CFLAGS="-O2 -I$BREW_OPENSSL_PATH/include  -I$BREW_READLINE_PATH/include -I$(xcrun --show-sdk-path)/usr/include -I$BREW_ZLIB_PATH/include"
# export LDFLAGS="-L$BREW_OPENSSL_PATH/lib -L$BREW_READLINE_PATH/lib -L$BRWE_ZLIB_PATH/lib"
export PATH="$HOME/.pyenv/bin:$PATH"
if [ -x "$(command -v pyenv)" ] && [ -z "$PYENV_INITIALIZED" ]; then
    echo "Initializing pyenv..."

    # MUCH FASTER LOAD
    eval "$(pyenv init - $SHELL)"
    # eval "$(pyenv init - --no-rehash)"
    # eval "$(pyenv init - $SHELL --no-rehash)"

    # eval "$(pyenv virtualenv-init - $SHELL --no-rehash)"
    eval "$(pyenv virtualenv-init - $SHELL)"

    PYTHON_VERSION=`python --version 2>&1`
    PYVENV=`pyenv version | cut -d' ' -f1`
    export PYENV_INITIALIZED=1
    echo "Setting python env to $PYTHON_VERSION ($PYVENV)."
fi


# Pipx
# Created by `userpath` on 2019-11-25 18:33:31
export PATH="$PATH:$HOME/.local/bin"
eval "$(register-python-argcomplete pipx)"

export PYTHON_INITIALIZED=1
