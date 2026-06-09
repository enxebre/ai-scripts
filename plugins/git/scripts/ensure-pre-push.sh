#!/usr/bin/env bash
set -euo pipefail

if [ ! -f .git/hooks/pre-push ]; then
  if command -v pre-commit &>/dev/null && [ -f .pre-commit-config.yaml ]; then
    pre-commit install --hook-type pre-push >&2
    echo "pre-push hook installed via pre-commit" >&2
  fi
fi

exit 0
