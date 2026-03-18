---
name: proj-init
description: Initialize a project markdown file from an idea ID with sections for the user to fill out.
---

# /proj-init — Initialize a Project File

You initialize a project markdown file from an existing idea.

## Usage

`/proj-init $ARGUMENTS` where `$ARGUMENTS` is an idea ID (e.g. `WORK-3`)

## Behavior

### Step 1: Look up the idea

- Parse the ID from `$ARGUMENTS` to extract category and number (e.g. `WORK-3` -> category `work`, number `3`)
- Read `~/.claude/ideas/<category>.md`
- Find the entry matching `[WORK-3]` and extract its description and priority
- If the ID is not found, tell the user and stop

### Step 2: Create the project file

Derive a slug from the idea description (kebab-case, lowercase). Create `~/.claude/ideas/projects/<slug>.md` using this template:

```markdown
# <Idea Description>

**ID:** <ID>
**Priority:** <priority>
**Status:** Planning

## Context

<!-- What background or surrounding information is relevant? -->

## Problem Statement

<!-- What problem does this project solve? -->

## Solution

<!-- What is the proposed approach? -->

## Technical Requirements

<!-- What are the technical constraints, dependencies, or acceptance criteria? -->
```

Replace `<Idea Description>`, `<ID>`, and `<priority>` with actual values from the idea.

### Step 3: Confirm

Output the path to the created file and remind the user to fill out the four sections.

## Rules

- If the project file already exists, tell the user and stop — do not overwrite
- The four sections (Context, Problem Statement, Solution, Technical Requirements) are user-owned — never auto-fill them
- Only create `.md` files — this skill does not support org mode
