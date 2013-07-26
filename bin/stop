#!/bin/sh
f=./tmp/pids/server.pid
[[ -f $f ]] && _pid=$(cat ./tmp/pids/server.pid 2>&1 /dev/null)

if [ $_pid ]; then
  echo "Shutting down..."
  kill $_pid
  exit 0
else
  echo "No server running."
  exit 1
fi
