# Git Plugin

Ensures pre-commit hooks are active at session start.

## What It Does

On `SessionStart`, the plugin checks for a `.pre-commit-config.yaml`. If found,
it runs `pre-commit install --hook-type pre-commit` and
`pre-commit install --hook-type pre-push` to activate all configured hooks.

If `pre-commit` is not installed, the session is blocked (exit code 2).

After activation, every commit and push (from Claude or terminal) is gated by
the hooks defined in the repo — at zero ongoing token cost.

## Installation

```bash
claude plugin marketplace add enxebre/ai-scripts
claude plugin install git@enxebre
```

## Prerequisites

- `pre-commit` must be installed (`pip install pre-commit` or `brew install pre-commit`)
- The repo needs a `.pre-commit-config.yaml`
