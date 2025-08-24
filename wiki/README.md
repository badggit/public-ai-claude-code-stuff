# Wiki Documentation System for Claude Code

This project provides a documentation management system for Claude Code that enables automated documentation updates and maintenance.

## Overview

The wiki system allows you to:
- Maintain project documentation in a structured format
- Use the `/wiki-update` command to automatically update documentation
- Keep documentation organized and easily accessible to Claude Code

## Setup

To integrate this wiki system into your project:

1. **Update the CLAUDE.md configuration**  
   Add the contents of `/wiki/CLAUDE.md` to your project's `/CLAUDE.md` file

2. **Copy files from the `wiki` directory**  
   Copy `/wiki/.claude` and `/wiki/docs` to your project's root directory, e.g. `/.claude` and `/docs`

3. **Use the `/wiki-update` command**  
   Run `/wiki-update` in Claude Code to manage your documentation

## Features

- **Automated Documentation Management**: The `/wiki-update` command helps maintain and organize documentation
- **Session Initialization**: Automatically loads and references existing documentation
- **Structured Documentation Index**: Maintains an organized index of all documentation files

## Documentation Structure

The system uses a `docs/wiki/` directory structure with:
- `README.md` - Documentation index and overview
- Individual documentation files for specific topics
- Automatic cross-referencing and organization

## Usage

Once configured, Claude Code will automatically:
1. Read the documentation index at the session start
2. Reference existing documentation when relevant topics arise
3. Maintain documentation consistency across sessions

This ensures efficient knowledge reuse and prevents rediscovering already documented information.