#!/bin/sh
set -e

DEFAULT_ARGS="--rc-serve --rc-web-gui-no-open-browser --rc-addr :8000 --rc-files /data/rclone"
CUSTOM_ARGS=""

if [ -n "$USERNAME" ]; then
  CUSTOM_ARGS="--rc-user ${USERNAME}"
else
  CUSTOM_ARGS="--rc-user admin"
fi
if [ -n "$PASSWORD" ]; then
  CUSTOM_ARGS="${CUSTOM_ARGS} --rc-pass ${PASSWORD}"
else
  CUSTOM_ARGS="${CUSTOM_ARGS} --rc-pass admin"
fi

COMMAND="rclone rcd ${DEFAULT_ARGS} ${CUSTOM_ARGS}"

echo "$COMMAND"
# shellcheck disable=SC2086
exec $COMMAND
