if [[ "$use_java" != "1" ]] ; then
	return 1
fi
echo "Setting up JAVA"

which jenv > /dev/null
if [ $? != 0 ] ; then
	echo "!!!!! You must have jenv installed to configure java. !!!!"
else
	# See: https://developer.bring.com/blog/configuring-jenv-the-right-way/
	export PATH="$HOME/.jenv/bin:$PATH"
	eval "$(jenv init -)" 2>&1 > /dev/null
	#eval "$(jenv init -)" 2>&1 > /dev/null && jenv enable-plugin maven 2>&1 > /dev/null && jenv enable-plugin export 2>&1 > /dev/null &

	# JAVA_VERSION=`java -version 2>&1 | head -1 | cut -d'"' -f2`
	# JAVA_HOME="$(jenv prefix)"

	jenv enable-plugin maven 2>&1 > /dev/null &
	jenv enable-plugin export 2>&1 > /dev/null &

	echo "Java `jenv version` enabled."
fi
