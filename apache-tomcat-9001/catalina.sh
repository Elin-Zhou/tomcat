# resolve links - $0 may be a softlink
PRG="$0"

while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

# Get standard environment variables
PRGDIR=`dirname "$PRG"`
export CATALINA_BASE=`cd "$PRGDIR">/dev/null;pwd`
export CATALINA_PID=$CATALINA_BASE/9001
EXECUTABLE=`cd "$PRGDIR/..">/dev/null;pwd`/bin/catalina.sh
exec "$EXECUTABLE"  "$@"