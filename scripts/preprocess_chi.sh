#!/usr/bin/env bash
set -euo pipefail

DATA_DIR="${1:-data_examples}"

if [ ! -d "$DATA_DIR" ]; then
  echo "Error: folder '$DATA_DIR' not found." >&2
  exit 1
fi

cha_count=$(find "$DATA_DIR" -type f -name "*.cha" | wc -l)
chi_count=$(grep -rh "^\*CHI:" "$DATA_DIR" | wc -l || true)
mor_count=$(grep -rh "^%mor:" "$DATA_DIR" | wc -l || true)
pattern_matches=$(grep -rh "^\*CHI:" "$DATA_DIR" | grep -E "\[\*|\[:|s:3sg|ed" | wc -l || true)

echo "Total .cha files : $cha_count"
echo "Total *CHI: lines: $chi_count"
echo "Total %mor: lines: $mor_count"
echo "Initial pattern matches: $pattern_matches"

echo "--- Sample matching *CHI: lines ---"
grep -rh "^\*CHI:" "$DATA_DIR" | grep -E "\[\*|\[:|s:3sg|ed" | head -n 5 || true
