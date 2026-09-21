#!/usr/bin/env bash
# Single entry point for the project. Usage: bash run.sh <command>
set -euo pipefail

command="${1:-help}"

case "$command" in
  setup)
    # Create the environment and install pinned packages (writes uv.lock the first time)
    uv sync
    ;;
  data)
    echo "TODO: download or generate data into data/ (raw files are git-ignored)"
    ;;
  test)
    uv run pytest
    ;;
  report)
    echo "TODO: build figures and the written report"
    ;;
  all)
    bash run.sh data
    bash run.sh test
    bash run.sh report
    ;;
  help|*)
    echo "Usage: bash run.sh {setup|data|test|report|all}"
    ;;
esac
