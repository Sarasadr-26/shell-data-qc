#!/usr/bin/env bash
# Downloads the UCI Heart Disease dataset into data/raw.
set -euo pipefail

URL="https://archive.ics.uci.edu/static/public/45/heart+disease.zip"
DEST_DIR="data/raw"
ZIP_PATH="$DEST_DIR/heart-disease.zip"

mkdir -p "$DEST_DIR"

echo "Downloading Heart Disease dataset..."
curl -L -o "$ZIP_PATH" "$URL"

echo "Extracting..."
uv run python -m zipfile -e "$ZIP_PATH" "$DEST_DIR"

echo "Done. Files in $DEST_DIR:"
ls "$DEST_DIR"