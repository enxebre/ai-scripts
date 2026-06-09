# Git Plugin

Ensures pre-commit pre-push hooks are installed at session start. If the repo
has a `.pre-commit-config.yaml` but no `.git/hooks/pre-push`, the plugin runs
`pre-commit install --hook-type pre-push` automatically. After that, git-native
hooks gate every push (from Claude or terminal) at zero token cost.
