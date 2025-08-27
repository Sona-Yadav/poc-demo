#!/bin/bash
set -e
APP_DIR=/home/ec2-user/app
if [ -f "$APP_DIR/server.pid" ]; then
  PID=$(cat $APP_DIR/server.pid)
  if ps -p $PID > /dev/null 2>&1; then
    echo "Stopping server PID $PID"
    kill $PID || true
    sleep 2
  fi
  rm -f $APP_DIR/server.pid
fi
echo "[stop_server] done"
