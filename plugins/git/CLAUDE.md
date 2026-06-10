# Git Plugin

Ensures pre-commit hooks are active at session start. If the repo has a
`.pre-commit-config.yaml`, the plugin runs `pre-commit install --hook-type pre-commit`
and `pre-commit install --hook-type pre-push`. Fails if pre-commit is not
installed. After activation, git-native hooks gate every commit and push
(from Claude or terminal) at zero token cost.
