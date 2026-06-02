#!/usr/bin/env bash
set -e

export UPSET_INSTALL_DIR="${UPSET_INSTALL_DIR:-/opt/upset/INSTALL}"
LOCAL_UID="${LOCAL_UID:-1000}"
LOCAL_GID="${LOCAL_GID:-1000}"
LOCAL_USER="upset"

if [ ! -f "$UPSET_INSTALL_DIR/UPSET" ]; then
    echo "ERROR: UPSET executable not found at $UPSET_INSTALL_DIR/UPSET"
    echo "Check that .upset is mounted correctly."
    exit 1
fi

# Create group/user matching the host UID/GID.
if ! getent group "$LOCAL_GID" >/dev/null; then
    groupadd -g "$LOCAL_GID" "$LOCAL_USER"
fi

if ! id -u "$LOCAL_USER" >/dev/null 2>&1; then
    useradd -m -u "$LOCAL_UID" -g "$LOCAL_GID" -s /bin/bash "$LOCAL_USER"
fi

mkdir -p /workspace

# Safe UPSET wrapper.
# Do not LD_PRELOAD freetype globally.
cat > /usr/local/bin/UPSET <<'EOF'
#!/usr/bin/env bash
set -e

export UPSET_INSTALL_DIR="${UPSET_INSTALL_DIR:-/opt/upset/INSTALL}"

# Keep UPSET local libs available, but do not preload bundled freetype.
if [ -d "$UPSET_INSTALL_DIR/lib" ]; then
    if [ -n "${LD_LIBRARY_PATH:-}" ]; then
        export LD_LIBRARY_PATH="$UPSET_INSTALL_DIR/lib:$LD_LIBRARY_PATH"
    else
        export LD_LIBRARY_PATH="$UPSET_INSTALL_DIR/lib"
    fi
fi

cd "$UPSET_INSTALL_DIR"
exec ./UPSET "$@"
EOF

chmod +x /usr/local/bin/UPSET

# Optional convenience symlink. If it fails, don't break startup.
ln -sf /usr/local/bin/UPSET /workspace/UPSET 2>/dev/null || true

# Load project variables for the launched process.
if [ -f /workspace/setvars.sh ]; then
    set -a
    # shellcheck disable=SC1091
    source /workspace/setvars.sh
    set +a
else
    echo "WARNING: /workspace/setvars.sh not found. Project env vars not loaded."
fi

export HOME=/workspace

exec gosu "$LOCAL_UID:$LOCAL_GID" "$@"
