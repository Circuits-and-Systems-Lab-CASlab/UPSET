#!/usr/bin/env bash
set -euo pipefail

VERSION="${UPSET_VERSION:-v2.0.1}"
ASSET_NAME="${UPSET_ASSET_NAME:-UPSET.zip}"
INSTALL_DIR="${UPSET_INSTALL_DIR_HOST:-.upset}"
FORCE_FETCH="${FORCE_FETCH:-0}"

URL="https://github.com/Circuits-and-Systems-Lab-CASlab/UPSET/releases/download/${VERSION}/${ASSET_NAME}"

if [ "${FORCE_FETCH}" != "1" ] && [ -f "${INSTALL_DIR}/INSTALL/config.UPSET" ]; then
  echo "UPSET already appears to be extracted in ${INSTALL_DIR}"
  echo "Set FORCE_FETCH=1 to re-download and re-extract."
  exit 0
fi

tmp_zip="$(mktemp --suffix=.zip)"
trap 'rm -f "${tmp_zip}"' EXIT

echo "Downloading ${URL}"
curl -fL "${URL}" -o "${tmp_zip}"

echo "Extracting to ${INSTALL_DIR}"
mkdir -p "${INSTALL_DIR}"
find "${INSTALL_DIR}" -mindepth 1 -maxdepth 1 -exec rm -rf {} +

unzip -q "${tmp_zip}" -d "${INSTALL_DIR}"

echo "Done."