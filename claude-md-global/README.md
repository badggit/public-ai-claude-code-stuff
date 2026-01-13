# Global CLAUDE.md Rules

This gist provides a template for global user-scope CLAUDE.md rules that apply across all Claude Code projects.

## Overview

The `CLAUDE.md` file contains universal coding and project management rules that should be followed consistently across all projects. These rules override default Claude Code behavior and ensure consistent code quality and workflow patterns.

## Installation

1. Copy the contents of `CLAUDE.md` to your user's global CLAUDE.md file located at `~/.claude/CLAUDE.md`
2. These rules will then apply to all Claude Code sessions globally

## Rules Included

### Code Quality
- **English Comments**: All code comments must be written in English regardless of the request language
- **TypeScript Safety**: Never use the `any` type in TypeScript
- **Modular Design**: Write modular code that can be easily extracted or moved
- **Window Functions**: Always prefix window functions with `window.` (e.g., `window.setTimeout`)
- **Clean Lines**: Empty lines should contain no spaces

### Git & PR Management
- **English PRs**: All pull requests must be in English and created in Draft status
- **No AI Attribution**: Never add "Generated with Claude Code" or similar AI attribution to PRs or text

### Development Workflow
- **Linter Rules**: Check and understand linter rules before coding (without running from console)
- **No Auto-Linting**: Don't run linter commands at the end of sessions

## Usage

Once installed globally, these rules will automatically apply to all Claude Code sessions. The rules are designed to maintain consistent code quality and professional development practices across all projects.

## File Contents

The main configuration is stored in `CLAUDE.md` which contains the complete set of rules that should be copied to your global CLAUDE.md file.