#!/usr/bin/env bash
# Checks a Heart Disease data file for common quality problems
# before it is used in analysis. Usage: bash src/qc_checks.sh <path-to-file>
set -euo pipefail

FILE="${1:?Usage: bash src/qc_checks.sh <path-to-file>}"
EXPECTED_COLUMNS=14

echo "Quality report for: $FILE"
echo "----------------------------------------"

if [ ! -s "$FILE" ]; then
  echo "FAIL: file is missing or empty."
  exit 1
fi

ROW_COUNT=$(wc -l < "$FILE")
echo "Rows: $ROW_COUNT"

BAD_ROWS=$(awk -F, -v n="$EXPECTED_COLUMNS" 'NF != n {count++} END {print count+0}' "$FILE")
if [ "$BAD_ROWS" -gt 0 ]; then
  echo "FAIL: $BAD_ROWS row(s) do not have $EXPECTED_COLUMNS columns."
else
  echo "PASS: every row has $EXPECTED_COLUMNS columns."
fi

MISSING_COUNT=$(grep -o '?' "$FILE" | wc -l)
echo "Missing values ('?'): $MISSING_COUNT"
if [ "$MISSING_COUNT" -gt 0 ]; then
  echo "Missing values by column position:"
  awk -F, '{for (i=1; i<=NF; i++) if ($i == "?") counts[i]++} END {for (c in counts) print "  column " c ": " counts[c]}' "$FILE" | sort
fi

DUPLICATE_COUNT=$(sort "$FILE" | uniq -d | wc -l)
echo "Duplicate rows: $DUPLICATE_COUNT"

echo "----------------------------------------"
echo "Done."