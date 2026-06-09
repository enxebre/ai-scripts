# Git Plugin

Pre-push verification hook that runs `make verify` before allowing `git push`.

## What It Does

When Claude Code attempts a `git push`, this plugin intercepts the command via
a `PreToolUse` hook and runs `make verify` first. If verification fails, the
push is blocked.

## Installation

Add the marketplace to your project:

```bash
claude plugin marketplace add enxebre/ai-scripts
claude plugin install git@ai-scripts
```

## How It Works

1. A `PreToolUse` hook watches all `Bash` tool calls
2. When it detects a `git push` command, it runs `make verify`
3. If `make verify` exits non-zero, the hook exits non-zero, blocking the push
4. All other commands pass through unaffected
