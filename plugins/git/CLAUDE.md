# Git Plugin

Pre-push verification hook for Claude Code. Intercepts `git push` commands and
runs `make verify` before allowing the push to proceed. If verification fails,
the push is blocked.
