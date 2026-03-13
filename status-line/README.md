# Status Line

A custom status line for Claude Code that displays project name, remaining context percentage with color coding, and current model with effort level.

## What it shows

```
my-project  context: 73%  Claude Opus 4.6 (medium)
```

- **Project folder name** — in blue
- **Remaining context %** — color-coded:
  - Green: 50% or more
  - Yellow: 25–49%
  - Red: below 25%
- **Model name (effort)** — in cyan, shows the active model and effort level

## Installation

1. Copy `statusline-command.sh` to your Claude config directory:

```bash
cp .claude/statusline-command.sh ~/.claude/statusline-command.sh
```

2. Add the `statusLine` block to your `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "bash ~/.claude/statusline-command.sh"
  }
}
```

If `~/.claude/settings.json` already exists, merge the `statusLine` key into your existing config.

## How it works

The script receives a JSON payload on stdin from Claude Code containing session information. It parses the following fields without requiring `jq`:

- `cwd` — current working directory (extracts the last folder name)
- `remaining_percentage` — how much context window is left
- `display_name` — active model name
- `effort` — current effort level (e.g., `low`, `medium`, `high`)

The output is a single formatted line with ANSI color codes displayed at the bottom of the Claude Code interface.
