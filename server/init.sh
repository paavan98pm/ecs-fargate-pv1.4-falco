#!/bin/bash

falco -u --pidfile /var/run/falco.pid --daemon
tail -f /var/log/falco.log &
PORT=${PORT:-443}

while :
do
   ncat -nvlp ${PORT} -e /bin/bash
   if [ $? -ne 0 ]; then
      printf "Error with ncat. Sleeping...\n"
      sleep 3
   fi
done
