# AI Claude Code Gists

This project is a collection of useful Gists for AI and Claude Code in particular.

## Available Gists

### [/wiki](./wiki)
A documentation management system that:
- Provides automated documentation updates via `/wiki-update` command
- Maintains structured documentation in `docs/wiki/` directory
- Automatically loads and references existing documentation at session start
- Maintains organized documentation index with cross-referencing
- Ensures efficient knowledge reuse across sessions

### [claude-md-global](./claude-md-global)
A global configuration template that provides:
- Consistent coding standards across all projects
- English-only code comments and PR requirements
- TypeScript safety rules and modular design patterns
- Git workflow and PR management guidelines
- Clean development practices and linter integration

### [simple-code-loop](./simple-code-loop)
An iterative development loop command that:
- Provides `/code:loop-start` command for automated code-test-review cycles
- Executes: code → test → lint → review → fix → repeat until success
- Saves iteration plans to `docs/reports/` for context persistence
- Handles `/compact` gracefully by preserving and recalling plans
- Supports resuming from saved plan files

### [status-line](./status-line)
A custom status line for Claude Code that:
- Displays the current project folder name in blue
- Shows remaining context percentage with color coding (green/yellow/red)
- Shows the active model name and effort level in cyan
- Works without `jq` — pure bash with grep/sed parsing
