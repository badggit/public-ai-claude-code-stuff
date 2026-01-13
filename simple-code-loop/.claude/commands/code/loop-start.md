# Code-Test-Review Loop Start, /code:loop-start [plan-file-path] (v.1.0.4)

Start an iterative development loop: code → test → backend-lint → review → fix → repeat until everything is perfect.

## Instructions

Execute the following cycle iteratively until all tests pass, backend linting is clean, and the review finds no issues:

### 0. Initial Plan Loading (Optional)
- If user provided a plan file path as parameter (e.g., `/code:loop-start docs/reports/2025-11-07-14-30_GS-472_loop2.md`):
  - Read the plan from the specified file
  - Use this plan as the starting point
  - Continue with the iteration number from the filename + 1
- If no plan file is provided:
  - Use the plan from agent's context, user's message or ask the user to provide a plan
  - Start from iteration #1

### 1. Coding Phase
- Follow the plan provided by agent's context, the user, loaded from a file, or created in the previous iteration
- Write clean, modular code following project guidelines (see CLAUDE.md)
- Use modern TypeScript patterns and avoid `any` type
- Make necessary changes to implementation

### 2. Testing Phase
- Run all tests EXCEPT E2E tests
- All commands should be run from the root of the project
- For backend (`backend_folder` directory): `yarn test` and `yarn lint`
- For frontend (`frontend_folder` directory): `yarn test` or run a specific test file `yarn test ComponentName`
- Collect test results and analyze failures
- **CRITICAL**: Run linting ONLY for backend
- **NEVER** run `yarn lint` or `yarn ts:check` from `frontend_folder` directory - these commands don't work correctly there
- Note: Backend linting should auto-fix most issues but check for any remaining errors

### 3. Test & Lint Analysis Phase
- If tests fail:
  - Analyze if the failing tests are correct for what we're implementing
  - If tests are correct: Fix the code to make them pass
  - If tests are incorrect/outdated for the current task: Ask the user "Should I update the tests to match the new implementation?"
  - Do NOT proceed until tests pass
- If backend linting fails:
  - Fix the linting issues in backend code
  - Re-run backend linting to verify fixes
- If all tests pass (backend + frontend) AND backend linting is clean: Proceed to review phase

### 4. Review Phase
- Run `/review` command
- Wait for review results

### 5. Review Analysis Phase
- If the review finds issues:
  - Create a plan to fix the issues found
  - Go back to Step 1 (Coding Phase) with the new plan
- If the review finds no issues (or only minor suggestions):
  - Proceed to Final Validation Phase

### 6. Final Validation Phase
- **IMPORTANT**: After all other checks pass, run final validation from the project root:
  - Backend tests: `cd backend_folder && yarn test`
  - Backend lint: `cd backend_folder && yarn lint`
  - Frontend tests: `cd frontend_folder && yarn test`
  - NEVER do Frontend lint like `cd frontend_folder && yarn lint`
  - NEVER do Frontend types check like `cd frontend_folder && yarn ts:check`
  - NEVER do Frontend lint from the root of the project like `yarn lint`
- This is the final gate before completion
- If ANY check fails:
  - Go back to Phase 1 and fix the issues
  - Do NOT proceed to completion
- Only proceed to the Completion Phase if all checks are completely clean

### 7. Completion Phase
- Report success with summary:
  - Tests passed (backend + frontend)
  - Backend linting is clean
  - Review is clean
- Ask the user if they want to continue with additional improvements or stop the loop

### 8. Plan Persistence
- If `docs/reports` directory exists:
  - Save all plans to file in format: `YYYY-MM-DD-hh-mm_<ticket-number>_loop<iteration-number>.md`
  - Extract ticket number from current branch name (e.g., `GS-472` from branch `GS-472-add-feature`)
  - Example: `2025-11-07-14-30-GS-472-loop1.md`, `2025-11-07-15-45-GS-472-loop2.md`
  - Each plan file should contain the implementation plan for that iteration

### 9. Context Management (/compact handling)
- **CRITICAL**: If context runs out and `/compact` is triggered:
  - MUST run `/compact` with parameter in English: "do not delete the plan from <plan-file-name>"
  - Example: `/compact do not delete the plan from docs/reports/2025-11-07-14-30_GS-472_loop2.md`
- **CRITICAL**: After `/compact` completes:
  - MUST execute in English: "Recall the plan from <plan-file-name>"
  - This ensures the loop can continue after context reset
  - Re-read the plan file and continue from the last iteration

### 10. Loop Control
- After each iteration, show:
  - Current iteration number
  - Test results summary (backend and frontend)
  - Backend linting status
  - Review status
  - Next action
  - Plan file location (if saved)
- Continue looping until all tests pass, backend linting is clean, AND the review is clean

## Usage

- `/code:loop-start` - Start the iterative development loop with new plan (iteration #1)
- `/code:loop-start docs/reports/2025-11-07-14-30_GS-472_loop2.md` - Continue from an existing plan file (iteration #3)

## Parameters

- `[plan-file-path]` (optional) — Path to an existing plan file to continue from
  - If provided: Load a plan from a file and continue with the next iteration number
  - If not provided: Use the plan from agent's context, user-provided plan

## Prerequisites

- There should be a clear plan/task to work on
- Project should have a test suite configured
- `/review` command should be available

## Output Format

Each iteration should show:
```
🔄 Iteration #N

📝 Coding: [what was done]
🧪 Tests (Backend): [X passed, Y failed]
🧪 Tests (Frontend): [X passed, Y failed]
✨ Lint (Backend): [pass/fail]
📋 Review: [status/findings]
➡️  Next: [action]
```

## Notes

- The loop is fully automated — it will keep iterating until success
- Tests must pass before processing (backend and frontend)
- Backend linting must be clean (auto-fixes will be applied)
- **CRITICAL**: Frontend linting and type checking are NOT part of this automated loop
- Review must be clean before stopping
- Final validation runs all checks one more time before completion
- User can interrupt at any time
- All plans are saved to `docs/reports/` if the directory exists
- Plan file naming: `YYYY-MM-DD-hh-mm-<ticket>-loop<N>.md` (extracted from branch name)
- **IMPORTANT**: If `/compact` occurs, the plan file MUST be preserved and recalled after compacting

## Testing Tips

### Backend Testing (backend_folder/)
- Run all tests: `cd backend_folder && yarn test`
- Run specific test file: `cd backend_folder && yarn test path/to/test.test.ts`
- Run with coverage: `cd backend_folder && yarn coverage`
- Lint: `cd backend_folder && yarn lint`

### Frontend Testing (frontend_folder/)
- Run all tests: `cd frontend_folder && yarn test`
- Run specific component test: `cd frontend_folder && yarn test ComponentName`
- Run with watch mode: `cd frontend_folder && yarn test --watch`
- **WARNING**: DO NOT run `yarn lint` or `yarn ts:check` from frontend_folder - it doesn't work correctly
- **WARNING**: DO NOT run `yarn lint` or `yarn ts:check` from project root - it's not part of the automated loop

### Important Notes
- Always run commands from the project root
- Use `cd` to navigate to backend_folder or frontend_folder before running their commands
- E2E tests are excluded from this loop (they take too long)
- **CRITICAL**: Frontend linting (`yarn lint`) and type checking (`yarn ts:check`) commands don't work when run from `frontend_folder` directory
- Only backend linting is part of the automated loop
