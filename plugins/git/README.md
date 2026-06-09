# Git Plugin

Ensures pre-commit pre-push hooks are installed at session start.

## What It Does

On `SessionStart`, the plugin checks if `.git/hooks/pre-push` exists. If the
repo has a `.pre-commit-config.yaml` but the hook isn't installed, it runs
`pre-commit install --hook-type pre-push` automatically.

After that, every `git push` (from Claude or terminal) is gated by the
pre-commit hooks defined in the repo — at zero ongoing token cost.

## Installation

```bash
claude plugin marketplace add enxebre/ai-scripts
claude plugin install git@enxebre
```

## Prerequisites

- `pre-commit` must be installed (`pip install pre-commit` or `brew install pre-commit`)
- The repo needs a `.pre-commit-config.yaml` with pre-push stage hooks
