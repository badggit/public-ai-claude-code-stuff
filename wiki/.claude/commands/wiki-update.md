# Automatic Wiki Update

Analyze the current conversation session to identify new features, architectural patterns, debugging techniques, and other project knowledge discovered during development work. Automatically create or update documentation files in the `/docs/wiki` directory.

## Analysis Tasks

1. **Check existing documentation first**:
   - Read `/docs/wiki/README.md` to see what documentation already exists
   - For each discovery, check if there's already a relevant documentation file
   - If documentation exists, determine if we learned something substantially new in this session
   - Only create new files or update existing ones if there's meaningful new information
   - Avoid creating duplicate documentation for already covered topics

2. **Review the entire current conversation** to identify technical discoveries including:
   - New console commands or functions discovered
   - Project structure insights and file organization patterns
   - Development workflows and build processes
   - Configuration details and environment setup
   - Debugging tools and troubleshooting techniques
   - API endpoints, integrations, or data flows
   - Code patterns and architectural decisions

3. **Categorize discoveries** using these prefixes:
   - **feature-** - Specific features, functions, console commands, UI components
   - **architecture-** - Project structure, design patterns, code organization, technology stack
   - **debug-** - Debugging tools, diagnostic commands, troubleshooting techniques
   - **config-** - Configuration files, environment setup, deployment procedures
   - **workflow-** - Development processes, build systems, testing approaches
   - **integration-** - External APIs, third-party services, data connections

4. **For each significant discovery**, create a detailed documentation file:
   - Use appropriate prefix and descriptive filename (e.g., `feature-console-commands.md`)
   - Include comprehensive overview with specific implementation details
   - Add file locations, line numbers, and code examples where applicable
   - Document usage instructions, parameters, and expected behavior
   - Note any constraints, limitations, or security considerations
   - Include cross-references to related functionality

5. **Update `/docs/wiki/README.md`** by adding new entries in the "Documentation Files" section:
   - Add link to the new documentation file
   - Include bold title describing the content
   - Write 1-2 sentence description of what's covered in the document
   - Maintain alphabetical or logical ordering
   - Update the "Last updated" timestamp

## Quality Standards

- Write all documentation in English
- Use clear, specific titles that accurately describe the content
- Include practical examples and usage instructions
- Reference specific file paths and line numbers when applicable
- Maintain consistent formatting and structure
- Focus on actionable information rather than general descriptions
- Ensure each document is self-contained and complete

## File Organization

Create files in `/docs/wiki/` directory using this structure:
```
docs/wiki/
├── README.md                    # Updated with new entries
├── feature-*.md                 # Feature documentation
├── architecture-*.md            # Architectural patterns
├── debug-*.md                   # Debugging tools
├── config-*.md                  # Configuration guides
├── workflow-*.md                # Development workflows
└── integration-*.md             # External integrations
```

Only create documentation for discoveries that provide substantial value for future development work. Skip trivial or already well-documented items.

After completing the documentation update, provide a brief summary of what new documentation was created and why it's valuable for the project.