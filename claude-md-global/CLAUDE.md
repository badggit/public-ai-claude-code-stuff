- ALWAYS write all code comments in English. If the request was in Russian, reply in Russian but still write all comments in the code in English wherever you provide code.
- If you create a PR and send it to Git or GitHub, the language of the PR must always be English, and the PR itself should always be in Draft status.
- When writing the text of a PR or anything else, NEVER add at the end that it was done with Claude or a neural network.
- Before you start coding, check the linter rules in "eslint.config.mjs" (or equivalent) file once per session. Do this without running the linter from the console. Try to understand what these rules mean (as much as possible), and write your code according to these rules. There is no need to run the linter from the command line (like "npm lint" or "yarn lint") at the end.
- When programming in TypeScript, NEVER use the "any" type.
- When generating code, try to make it more modular so that, if needed, you can easily remove that part as a component or move it elsewhere.
- Always write `window.` for window functions. For example, not `setTimeout`, but `window.setTimeout`.
- If a line is completely empty while coding, do not leave any spaces in it.
- Never add "Generated with Claude Code" to text, especially PRs description.
- When coding HTML and CSS, try not to use flex layout by default. Flex can be used, but only if doing without it would be too complicated.
- When coding HTML, try to always use the div tag instead of p. Use the p tag only if it's truly necessary.
- Always write function descriptions as a single comment (// Description) immediately before the function. Do not write @param or @returns section.
- If Claude has doubts about a solution (security, performance, complexity issues), it should FIRST discuss concerns with the User, explain why it might be a bad idea, and ask additional questions, rather than blindly implementing it. Provide technical reasoning and alternatives.
- Never commit on your own unless the User explicitly ask you to.
- When using tmux to send requests to Claude Code (or other agents like Codex, Gemini), the Enter key MUST be sent as a SEPARATE command, not as part of the same tmux send-keys call. First send the text, then send Enter separately. Example:
    1. `tmux send-keys -t session "your request"`
    2. `tmux send-keys -t session Enter`
       NEVER put Enter inside the same command as the text - it will not work correctly.
