#!/bin/sh -l
set -euo pipefail

SERVICE_ALIAS=${SERVICE_ALIAS}
SERVICE_URL=${SERVICE_URL}
MIRROR_SOURCE=${MIRROR_SOURCE:="."}

# Set mc configuration
mc config host add "$SERVICE_ALIAS" "$SERVICE_URL" "$ACCESS_KEY_ID" "$SECRET_ACCESS_KEY"

# Remove all files
mc rm --recursive --force "$SERVICE_ALIAS/$MIRROR_TARGET"

# Execute mc mirror
mc mirror $* "$MIRROR_SOURCE" "$SERVICE_ALIAS/$MIRROR_TARGET"
