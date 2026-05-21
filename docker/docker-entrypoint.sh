#!/usr/bin/env bash
set -e

export UPSET_INSTALL_DIR="${UPSET_INSTALL_DIR:-/opt/upset/INSTALL}"

if [ ! -f "$UPSET_INSTALL_DIR/UPSET" ]; then
    echo "ERROR: UPSET executable not found at $UPSET_INSTALL_DIR/UPSET"
    echo "Check that .upset is mounted correctly."
    exit 1
fi

mkdir -p /workspace

# Source project variables
if [ -f /workspace/setvars.sh ]; then
    # shellcheck disable=SC1091
    source /workspace/setvars.sh
else
    echo "WARNING: /workspace/setvars.sh not found. Project env vars not loaded."
fi

# Create safe UPSET wrapper.
# Do NOT use LD_PRELOAD here; it breaks libcairo/freetype compatibility.
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
ln -sf /usr/local/bin/UPSET /workspace/UPSET

exec "$@"
