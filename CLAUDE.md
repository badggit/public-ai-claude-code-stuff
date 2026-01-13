# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a collection of AI and Claude Code Gists - specifically utility commands and tools designed to improve Claude Code workflows. Each gist is isolated in its own folder for easy copying to other projects.

## Architecture

### Core Structure
- `wiki/` - Documentation management system gist
  - `.claude/commands/wiki-update.md` - The main command
  - `docs/` - Documentation structure
  - `CLAUDE.md` - Session initialization instructions
  - `README.md` - Installation and usage guide
- `claude-md-global/` - Global CLAUDE.md rules template gist
  - `CLAUDE.md` - Global rules template for user-scope configuration
  - `README.md` - Installation and usage guide
- `simple-code-loop/` - Iterative development loop gist
  - `.claude/commands/code/loop-start.md` - The main command
  - `docs/reports/` - Directory for iteration plan files

### Available Gists

#### wiki
A documentation management system that:
- Provides automated documentation updates via `/wiki-update` command
- Maintains structured documentation in `docs/wiki/` directory
- Automatically loads and references existing documentation at session start
- Maintains organized documentation index with cross-referencing
- Ensures efficient knowledge reuse across sessions

#### claude-md-global
A global configuration template that provides:
- Consistent coding standards across all Claude Code projects
- English-only code comments and documentation requirements
- TypeScript safety rules and modular design patterns
- Git workflow and PR management guidelines (English, Draft status)
- Clean development practices and linter integration rules
- Window function prefixing and code formatting standards

#### simple-code-loop
An iterative development loop command that:
- Provides `/code:loop-start` command for automated code-test-review cycles
- Executes iterative cycle: code → test → lint → review → fix → repeat
- Saves iteration plans to `docs/reports/` directory for context persistence
- Handles `/compact` gracefully by preserving and recalling plans
- Supports resuming loops from previously saved plan files

### Documentation Strategy

Each gist implements reusable patterns:
1. Isolated folder structure for easy copying
2. Complete installation instructions
3. Self-contained functionality
4. Integration guidelines for existing projects

## Usage Patterns

When working with this repository:
- Each gist folder contains its own README.md with specific instructions
- Copy entire gist folders to integrate into other projects
- Follow installation steps in each gist's documentation
- Maintain the established patterns when creating new gists