#!/usr/bin/env bash
set -euo pipefail

# PreToolUse hook: run make verify before git push.
# Only invoked on git push commands (filtered by "if" in hooks.json).
# Exits non-zero to block the push if verify fails.

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
COMMIT=$(echo "$COMMAND" | grep -oE '[a-f0-9]{12}' | head -1 || true)

echo "Running make verify for commit ${COMMIT:-HEAD}..."

if ! make verify; then
  echo "make verify failed — fix issues before pushing"
  exit 2
fi

echo "make verify passed"
exit 0
