#!/bin/sh
# A Smashing dashboard
###
# chkconfig: 235 98 55
# description: Controls a Smashing dashboard.
###
set -ue

CMD=${1:-'run'}

# the working directory, you must modify if you start from init.d
cd /vagrant/smashboard

if [ "$(gem list|grep smashing)" = "" ]; then
    gem install smashing
fi

PID=$(lsof -i :3030 | awk '{print $2}' | tail -n1)

case $CMD in
    run)
        $0 stop
        bundle install
        smashing start
        ;;
    start)
        $0 stop
        bundle install
        nohup smashing start &
        ;;
    stop)
        if [ "$PID" != "" ]; then
            kill $PID
        fi
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    status)
        if [ "$PID" != "" ]; then
            echo "running with pid $PID at http://$(hostname):3030/"
        else
            echo "not running"
        fi
        ;;
    *)
        echo "$0 run|start|stop|restart|status">&2
        exit 1
esac
