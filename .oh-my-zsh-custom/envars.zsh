DEFAULT_USER=ryanclementshax
PROMPT_EOL_MARK=''
# java
JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::" | sed 's/\/$//')
# misc
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1
