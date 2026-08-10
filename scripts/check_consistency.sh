#!/bin/bash
# Consistency lint for the Honestly repo.
#
# The framework text is intentionally duplicated across multiple platform
# adapters (framework/platform-adapters/*.md, honestly.skill) with different
# wording per platform — that's deliberate, not a bug. What IS a bug is the
# specific failure mode this repo has already hit twice: a stale identifier
# (the old "arf" naming, an unfilled placeholder, a filename typo) surviving
# in one copy after being fixed in another.
#
# This script checks for that failure mode specifically. It does not enforce
# that the prose is identical across files — only that known-bad patterns
# aren't present anywhere.
#
# Run before publishing changes to any framework/adapter/citation file:
#   bash scripts/check_consistency.sh

set -uo pipefail
cd "$(dirname "$0")/.."

fail=0

echo "== Checking for stale ARF/ARB naming =="
hits=$(grep -rniw "arf\|arb-20\|arb20" \
  --include="*.md" --include="*.py" --include="*.mdc" --include="*.bib" . \
  2>/dev/null | grep -v "^\./scripts/check_consistency.sh")
if [ -n "$hits" ]; then
  echo "FAIL: found stale ARF/ARB references:"
  echo "$hits"
  fail=1
else
  echo "OK"
fi

echo ""
echo "== Checking for unfilled placeholders =="
hits=$(grep -rn "\[your-handle\]\|arXiv:[0-9]*\.XXXXX\|TODO\|FIXME" \
  --include="*.md" --include="*.py" --include="*.bib" . \
  2>/dev/null | grep -v "^\./scripts/check_consistency.sh" | grep -v "your-initials")
if [ -n "$hits" ]; then
  echo "FAIL: found unfilled placeholders:"
  echo "$hits"
  fail=1
else
  echo "OK"
fi

echo ""
echo "== Checking Cursor rule filename is consistent everywhere =="
mdc_names=$(grep -rohE '[a-zA-Z0-9_-]+\.mdc' --include="*.md" . 2>/dev/null | sort -u)
count=$(echo "$mdc_names" | grep -c .)
if [ "$count" -gt 1 ]; then
  echo "FAIL: multiple different .mdc filenames referenced:"
  echo "$mdc_names"
  fail=1
else
  echo "OK ($mdc_names)"
fi

echo ""
echo "== Checking self-citation URL matches across README and citations.bib =="
readme_url=$(grep -oE 'github\.com/[A-Za-z0-9_-]+/AI-Reasoning-Framework' README.md | sort -u)
bib_url=$(grep -oE 'github\.com/[A-Za-z0-9_-]+/AI-Reasoning-Framework' research/citations.bib | sort -u)
if [ "$readme_url" != "$bib_url" ]; then
  echo "FAIL: README cites '$readme_url', citations.bib cites '$bib_url'"
  fail=1
else
  echo "OK ($readme_url)"
fi

echo ""
echo "== Checking honestly.skill package for stale naming =="
if [ -f honestly.skill ]; then
  skill_hits=$(unzip -p honestly.skill honestly/SKILL.md 2>/dev/null | grep -ni "arf\b")
  if [ -n "$skill_hits" ]; then
    echo "FAIL: honestly.skill contains stale ARF references:"
    echo "$skill_hits"
    fail=1
  else
    echo "OK"
  fi
else
  echo "SKIP: honestly.skill not found"
fi

echo ""
if [ "$fail" -eq 0 ]; then
  echo "All checks passed."
else
  echo "One or more checks failed. Fix before publishing."
fi
exit $fail
