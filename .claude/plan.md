# Dotfiles Housekeeping Plan

## Overview
Comprehensive cleanup to remove unused files, consolidate duplicates, and improve maintainability of dotfiles configuration.

## Key Findings

### Critical Issues
1. **Empty placeholder files** - 3 files with no content
2. **Duplicate configurations** - SSH, PATH, Git, Tmux settings repeated across files
3. **Large unused Emacs directory** - 8.1 MB not actively used
4. **ZSH aliases that should be functions** - Better flexibility and maintainability

### Organization Opportunities
- Consolidate PATH exports into single location
- Convert complex aliases to functions for better error handling
- Standardize quoting conventions across configs
- Remove legacy commented-out code

## Proposed Changes (Priority Order)

### Priority 1: Remove Dead Code (Low Risk)

**Files to Delete:**
- `zsh/db.zsh` - Empty file
- `zsh/ruby.zsh` - Empty file
- `.gitmodules` - Empty file

**Legacy Code to Remove:**
- `home/tmux.conf.symlink` lines 66-72, 90-93 - Commented legacy color configs (replaced by Catppuccin)
- `home/zshrc.symlink` line 36 - Commented `freload()` function

**Impact:** Zero - these are unused/commented code
**Risk:** None

---

### Priority 2: Fix Duplicates (Medium Risk)

#### 2.1 Git GPG Signing Configuration
**Issue:** GPG signing program defined in both main config AND OS-specific config

**Change:**
- Remove GPG program setting from `home/gitconfig.symlink` (line 51)
- Keep only in `home/gitconfig-macos.symlink` and `home/gitconfig-linux.symlink`
- Standardize quoting: use quotes in all OS-specific configs

**Impact:** Cleaner separation of OS-specific settings
**Risk:** Low - OS-specific configs already override

#### 2.2 Duplicate Tmux Status Setting
**Issue:** `status-left` set twice in tmux.conf

**Change:**
- Remove `home/tmux.conf.symlink` line 95: `set -g status-left ""`
- Keep line 83 (same setting)

**Impact:** Remove redundancy
**Risk:** None - identical settings

#### 2.3 SSH_AUTH_SOCK Consolidation
**Issue:** SSH agent socket configured in 3 places with inconsistent quoting

**Change:**
- Keep SSH_AUTH_SOCK export in `home/zshrc.symlink` (lines 13-19)
- Remove from `zsh/work.zsh` line 19 (has incorrect escaping)
- Keep `ssha()` function in work.zsh (provides dynamic switching)
- Update `ssha()` to reference main zshrc value instead of duplicating

**Impact:** Single source of truth for SSH config
**Risk:** Low - maintains current behavior, just removes duplication

---

### Priority 3: Consolidate PATH Exports (Medium Risk)

**Issue:** PATH additions scattered across 8+ files with duplication

**Duplicate entries (already in main zshrc):**
- `zsh/rust.zsh` - `$HOME/.cargo/bin` (duplicates zshrc line 1)
- `zsh/go.zsh` - `$GOPATH/bin` (duplicates zshrc line 1)

**Options:**
1. **Conservative:** Just remove duplicate rust.zsh and go.zsh PATH exports
2. **Aggressive:** Consolidate ALL PATH exports into zshrc.symlink

**Recommendation:** Conservative approach
- Remove duplicate PATH from `rust.zsh` and `go.zsh`
- Keep other tool-specific PATH additions in their respective files
- Maintain current organizational structure

**Impact:** Cleaner PATH management without duplication
**Risk:** Low - removes only confirmed duplicates

---

### Priority 4: Convert Aliases to Functions (Low-Medium Risk)

#### 4.1 Work Repo Shortcuts (High Value)
**Current:** 3 separate aliases
```zsh
alias eds="ed ~/Code/github.com/aptible/sweetness"
alias edda="ed ~/Code/github.com/aptible/deploy-api"
alias edau="ed ~/Code/github.com/aptible/app-ui"
```

**Proposed:** Single parameterized function
```zsh
function ed_repo() {
  ed ~/Code/github.com/aptible/$1
}
alias eds="ed_repo sweetness"
alias edda="ed_repo deploy-api"
alias edau="ed_repo app-ui"
```

**Impact:** More flexible, easier to extend
**Risk:** Low - maintains existing aliases as wrappers

#### 4.2 Complex Git Aliases (Readability)
**Current aliases to convert:**
- `grm` - Complex pipeline with awk
- `changelog` - Multi-command with backticks

**Proposed:** Convert to functions with error handling

**Impact:** Better readability and error handling
**Risk:** Low - same behavior, clearer code

#### 4.3 Remove Alias Dependency Chain
**Current:** `aui="cda && cd app-ui"` depends on `cda` alias

**Proposed:** Make `aui` independent
```zsh
alias aui="cd ~/Code/github.com/aptible/app-ui"
```

**Impact:** Simpler dependency chain
**Risk:** None - identical behavior

---

### Priority 5: Archive Large Unused Directory (Reversible)

**Issue:** Emacs directory is 8.1 MB, acknowledged as unused

**Options:**
1. Delete entirely (with git, easily recoverable)
2. Archive to separate branch
3. Keep as-is (status quo)

**Recommendation:** Delete (user confirmed not using)
- Remove `emacs/emacs.d.symlink/` directory
- Remove `config/doom.symlink/` directory

**Impact:** 8+ MB space savings, cleaner repo
**Risk:** Low - git history preserves if needed later

---

### Priority 6: Minor Cleanups (Optional)

#### 6.1 Remove Placeholder Environment Variables
In `zsh/work.zsh` lines 20-22:
```zsh
export OPENAI_API_KEY="abc"
export OPENAI_BASE_URL=http://localhost:11434/v1
export OPENAI_MODEL=qwen3-coder:30b
```

**Action:** Remove if unused, or document purpose

#### 6.2 Clean Zed Copilot Settings
Remove null Copilot settings from `config/zed.symlink/settings.json` (lines 5-9)

#### 6.3 Consolidate Single-Line Configs (Optional)
Files like `fzf.zsh`, `gpg.zsh`, `mise.zsh` are 1 line each. Could consolidate into `config.zsh` or keep separate for clarity.

**Recommendation:** Keep separate - current organization is clear

---

## Implementation Approach

### Phase 1: Safe Removals (All Priority 1)
1. Delete empty files (db.zsh, ruby.zsh, .gitmodules)
2. Remove commented legacy code from tmux.conf and zshrc

### Phase 2: Deduplication (Priority 2)
1. Fix Git GPG config duplication
2. Remove duplicate tmux status setting
3. Consolidate SSH_AUTH_SOCK configuration

### Phase 3: PATH Cleanup (Priority 3)
1. Remove duplicate PATH exports from rust.zsh and go.zsh

### Phase 4: Alias Refactoring (Priority 4 - Optional)
1. Convert work repo shortcuts to parameterized function
2. Convert complex git aliases to functions
3. Remove alias dependency chain (aui → cda)

### Phase 5: Archive Unused (Priority 5 - User Decision Required)
1. Remove emacs and doom directories (requires confirmation)

### Phase 6: Minor Cleanups (Priority 6 - Optional)
1. Remove placeholder env vars from work.zsh
2. Clean Zed copilot settings

## Files to Modify

### Will Delete:
- `zsh/db.zsh`
- `zsh/ruby.zsh`
- `.gitmodules`
- `emacs/emacs.d.symlink/` (if approved)
- `config/doom.symlink/` (if approved)

### Will Edit:
- `home/gitconfig.symlink` - Remove duplicate GPG setting
- `home/tmux.conf.symlink` - Remove duplicate status + legacy comments
- `home/zshrc.symlink` - Remove commented freload function
- `zsh/work.zsh` - Consolidate SSH config, optionally refactor aliases
- `zsh/rust.zsh` - Remove duplicate PATH
- `zsh/go.zsh` - Remove duplicate PATH (just GOPATH export remains)
- `zsh/git.zsh` - Optionally convert aliases to functions
- `config/zed.symlink/settings.json` - Remove null copilot settings

## Testing Plan

After each phase:
1. Source updated zshrc: `source ~/.zshrc`
2. Verify aliases work: `type <alias>` for each modified alias
3. Verify functions work: Test work aliases (eds, edda, etc.)
4. Check git config: `git config --list | grep gpg`
5. Test SSH: `echo $SSH_AUTH_SOCK`
6. Verify PATH: `echo $PATH | tr ':' '\n' | grep -E '(cargo|go)'`

## Rollback Strategy

All changes tracked in git:
- Each phase committed separately
- Easy to revert: `git revert <commit>`
- Deleted files recoverable from git history

## Questions for User

1. **Emacs removal:** Confirm deletion of 8+ MB emacs/doom directories?
2. **Alias refactoring:** Proceed with Priority 4 (converting aliases to functions)?
3. **Aggressiveness:** Stop after Priority 3 (safe cleanups) or continue through all priorities?

## Estimated Impact

- **Files deleted:** 3-5 (or 3 + emacs directory)
- **Files modified:** 8-10
- **Lines removed:** ~50-100
- **Disk space saved:** 8+ MB if emacs removed
- **Maintenance improvement:** Significant - fewer duplicates, clearer organization
