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
    bash src/fetch_data.sh
    ;;
  test)
    uv run pytest
    ;;
  report)
    mkdir -p reports
    bash src/qc_checks.sh data/raw/processed.cleveland.data | tee reports/qc_report.txt
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
