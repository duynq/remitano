#!/bin/sh -eu

rm -f /opt/videosharing/tmp/pids/server.pid

exec "$@"
