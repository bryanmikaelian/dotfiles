---
name: terminus
description: Use when the user asks to create, inspect, or manage Terminus tasks; hand work to Terminus/Demerzeld; use the Terminus MCP server or headless agent API; or says to get a task/process rolling after design discussion.
---

# Terminus

Terminus is the task/RFC control plane for exe.dev work.

## Endpoints

- REST capture API over Tailscale nginx: `http://terminus-1.crocodile-vector.ts.net:8000/api/agent`
- MCP over Tailscale nginx: `http://terminus-1.crocodile-vector.ts.net:8000/mcp`
- REST token env var: `TERMINUS_AGENT_TOKEN`
- MCP token env var: `TERMINUS_MCP_TOKEN`

Server-side token env vars are plural: `TERMINUS_AGENT_TOKENS`, `TERMINUSMCP_AGENT_TOKENS`.

## Capture

Use REST for simple list/get/create:

```sh
curl -sS -H "Authorization: Bearer $TERMINUS_AGENT_TOKEN" \
  http://terminus-1.crocodile-vector.ts.net:8000/api/agent/tasks
```

Use MCP when available:

```sh
terminusmcpclient -url http://terminus-1.crocodile-vector.ts.net:8000/mcp list-tools
```

The headless MCP toolset is capture-only: `list_tasks`, `get_task`, `create_task`.

## Full Guide

For workflow transitions, Demerzeld handoffs, artifact shapes, retries, and merge/test rules, read:

`/Users/bryanmikaelian/.claude/AGENTS/work/terminus.md`

Core rule: Demerzeld owns workflow transitions and long-running CI/merge work. Do not directly edit task fields to advance workflow state.
