#!/usr/bin/env bash
set -e

export UPSET_INSTALL_DIR="${UPSET_INSTALL_DIR:-/opt/upset/INSTALL}"

if [ ! -f "$UPSET_INSTALL_DIR/UPSET-setup.sh" ]; then
    echo "ERROR: UPSET-setup.sh not found at $UPSET_INSTALL_DIR"
    echo "Check that .upset is mounted correctly."
    exit 1
fi

# shellcheck disable=SC1091
source "$UPSET_INSTALL_DIR/UPSET-setup.sh"

mkdir -p /workspace

if [ -x "$UPSET_INSTALL_DIR/UPSET" ]; then
    ln -sf "$UPSET_INSTALL_DIR/UPSET" /workspace/UPSET
fi

if [ -f "$UPSET_INSTALL_DIR/UPSET.sh" ]; then
    ln -sf "$UPSET_INSTALL_DIR/UPSET.sh" /workspace/UPSET.sh
fi

exec "$@"
