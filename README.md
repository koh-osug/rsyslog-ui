# Summary

Docker version of [rsyslog](https://www.rsyslog.com) using a MariaDB instance and the [rsyslog-webui](https://github.com/tinylama/rsyslog-webui).

# Run

~~~shell
./start.sh
~~~

# Test

Execute all on the host system.

Add to `/etc/rsyslog.conf`:

~~~
*.*  action(type="omfwd" target="localhost" port="10514" protocol="tcp"
            action.resumeRetryCount="100"
            queue.type="linkedList" queue.size="10000")
~~~

Start service:

~~~shell
sudo service rsyslog restart
~~~

~~~shell
logger Test1
~~~