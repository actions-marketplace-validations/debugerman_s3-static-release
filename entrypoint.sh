#!/bin/sh -l
set -euo pipefail

SERVICE_URL=${SERVICE_URL}
MIRROR_SOURCE=${MIRROR_SOURCE:="."}

# Set mc configuration
mc config host add "s3" "$SERVICE_URL" "$ACCESS_KEY_ID" "$SECRET_ACCESS_KEY"

# Remove all files
mc rm --recursive --force "s3/$MIRROR_TARGET"

# Execute mc mirror
mc mirror $* "$MIRROR_SOURCE" "s3/$MIRROR_TARGET"
 