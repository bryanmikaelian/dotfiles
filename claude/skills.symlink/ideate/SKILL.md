---
name: ideate
description: Manage ideas in ~/.claude/ideas/. Add new ideas with auto-assigned IDs or list all ideas sorted by priority.
---

# /ideate — Idea Management Skill

You manage ideas stored in `~/.claude/ideas/`.

## Parsing the command

The user's input is in `$ARGUMENTS`. It will be one of:

1. **`list`** — list all ideas
2. **`<category> <priority>: <description>`** — add a new idea (e.g. `work P0: Print money`)

Parse accordingly. Category and priority are case-insensitive; normalize category to lowercase for filenames and uppercase for IDs/display, priority to uppercase (P0-P4).

---

## Add behavior (`/ideate <category> <priority>: <description>`)

1. **Determine the file:** `~/.claude/ideas/<category>.md` (lowercase category)
2. **Create file if it doesn't exist** with this template:
   ```markdown
   # P0

   # P1

   # P2

   # P3

   # P4
   ```
3. **Assign the next ID:**
   - Read the file and find all existing IDs matching `CATEGORY-N` (uppercase category)
   - Find the max N, increment by 1. If none exist, start at 1.
   - ID format: `CATEGORY-N` (e.g. `WORK-1`, `WORK-2`, `PERSONAL-1`)
4. **Append entry under the matching priority heading:**
   - Format: `- [WORK-1] Print money`
   - Keep entries alpha-sorted by description within each priority section
   - Insert the new entry in the correct alphabetical position
5. **Confirm:** Output `Added WORK-1 under P0 in work.md`

---

## List behavior (`/ideate list`)

1. Read all `~/.claude/ideas/*.md` files using Glob
2. Parse all entries from all files
3. Display grouped by priority (P0 first, then P1, P2, P3, P4)
4. Within each priority, sort alphabetically by description
5. Show ID and description for each entry
6. Skip empty priority sections for cleanliness

**Output format:**
```
## P0
- [WORK-1] Print money
- [PERSONAL-2] Fix roof

## P1
- [WORK-3] Refactor auth
```

---

## Rules

- Never modify entries that already exist (only append new ones)
- IDs are permanent — never reassign or renumber
- Category in the filename is always lowercase; in the ID always uppercase
- If the user gives an invalid priority (not P0-P4), tell them and do nothing
