#!/bin/sh
set -e

DEFAULT_ARGS="--rc-web-gui --rc-web-gui-no-open-browser --rc-addr :8000"
CUSTOM_ARGS=""

if [ -n "$USERNAME" ]; then
  CUSTOM_ARGS="--rc-user ${USERNAME}"
fi
if [ -n "$PASSWORD" ]; then
  CUSTOM_ARGS="${CUSTOM_ARGS} --rc-pass ${PASSWORD}"
fi

COMMAND="rclone rcd ${DEFAULT_ARGS} ${CUSTOM_ARGS}"

echo "$COMMAND"
# shellcheck disable=SC2086
exec $COMMAND
