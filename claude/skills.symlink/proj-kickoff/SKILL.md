---
name: proj-kickoff
description: Start a project from an idea. Looks up an idea by ID, asks for format preference, and spawns project-lead to create a full work breakdown.
---

# /proj-kickoff — Start a Project from an Idea

You kick off a project from an existing idea in `~/.claude/ideas/`.

## Usage

`/proj-kickoff $ARGUMENTS` where `$ARGUMENTS` is an idea ID (e.g. `WORK-3`)

## Behavior

### Step 1: Look up the idea

- Parse the ID from `$ARGUMENTS` to extract category and number (e.g. `WORK-3` → category `work`, number `3`)
- Read `~/.claude/ideas/<category>.md`
- Find the entry matching `[WORK-3]` and extract its description and priority
- If the ID is not found, tell the user and stop

### Step 2: Ask the user for format preference

Ask: "Do you want this project in **markdown** or **org mode**?"

Wait for their answer before proceeding.

### Step 3: Ask for problem statement and solution

Ask the user:
- "What's the **problem statement** for this project?"
- "What's the **proposed solution**?"

These are user-owned fields — the project-lead cannot modify them later. If the user says the description is sufficient, use it as the problem statement and leave solution blank for now.

### Step 4: Determine the target repo

Ask: "What repo should this project target?" or infer from context if obvious. Get the absolute path to the repo.

### Step 5: Spawn project-lead

Use the Agent tool to spawn the `project-lead` agent (subagent_type: "project-lead") with all gathered context:

```
Project: <idea description>
ID: <idea ID>
Priority: <priority>
Format: <md or org>
Problem Statement: <user's problem statement>
Proposed Solution: <user's proposed solution>
Target Repo: <repo path>

Your task: Research the target repo codebase and create a full work breakdown in ~/.claude/ideas/projects/<slug>.<format>.

Create small, focused tasks with dependencies and priorities. Each task should have enough detail for a worker agent to execute independently.

CRITICAL: All worktrees MUST be created under ~/.claude/worktrees/ — NEVER under the project's .claude/ directory or anywhere else. Branch names MUST be prefixed with bryan/.
Example: git worktree add ~/.claude/worktrees/<task-slug> -b bryan/<task-slug> <base-branch>

Return the project file path and a summary when done.
```

### Step 6: Present for review

When project-lead returns:
- Show the user the project file content
- Ask: "Does this work breakdown look good? Any changes needed?"
- Apply feedback if given (re-spawn project-lead with edits if needed)

### Step 7: Begin implementation

On user approval, tell the project-lead to begin implementation phase:

```
The user has approved the work breakdown. Begin implementation:
- Spawn worker agents per task, respecting dependency order
- CRITICAL: Each worker MUST create its worktree under ~/.claude/worktrees/ — NEVER under the project's .claude/ directory
  Example: git worktree add ~/.claude/worktrees/<task-slug> -b bryan/<task-slug> <base-branch>
- Workers do test-first development in plan mode
- Update the project file as tasks complete
- Report back when all tasks are done
```

## Rules

- Never skip the user review step — always get explicit approval before implementation
- Problem statement and solution are user-owned, never auto-generated without user input
- If the user wants to iterate on the plan, keep looping until they approve
