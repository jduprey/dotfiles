export MAVEN_HOME=/usr/local/opt/maven/libexec
export M2_HOME=$MAVEN_HOME
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx700m -XX:MaxPermSize=1024m"
export PATH=$M2:$PATH
