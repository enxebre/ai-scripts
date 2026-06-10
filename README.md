# enxebre — Claude Code Plugin Marketplace

A collection of reusable Claude Code plugins for development workflows.

## Installation

Add the marketplace to your project:

```bash
claude plugin marketplace add enxebre/ai-scripts
```

Then install individual plugins:

```bash
claude plugin install git@enxebre
```

Run `/reload-plugins` in an active session to apply changes.

## Available Plugins

| Plugin | Description |
|--------|-------------|
| [git](plugins/git/) | Ensures pre-commit hooks (pre-commit + pre-push) are active at session start |

## Plugin Structure

Each plugin lives under `plugins/<name>/` and follows the Claude Code plugin format:

```
plugins/<name>/
├── .claude-plugin/
│   └── plugin.json       # Plugin metadata (name, version, keywords)
├── hooks/
│   └── hooks.json        # Hook definitions (SessionStart, PreToolUse, etc.)
├── scripts/              # Scripts referenced by hooks
├── CLAUDE.md             # Instructions injected into Claude context
└── README.md
```

## Manual Installation

If you prefer to configure the marketplace directly in your project settings,
add this to `.claude/settings.json`:

```json
{
  "plugins": {
    "marketplaces": ["enxebre/ai-scripts"],
    "enabled": ["git@enxebre"]
  }
}
```
