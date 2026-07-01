# Agent Instructions — agent-sandbox

This repo contains `agent-sandbox`, a Bash CLI tool that wraps Docker Sandboxes (`sbx`)
for running coding agents in isolated microVMs.

## Working Rules

- Keep the tool dependency-light: Bash, git, sbx. No Python, Node runtime, jq, etc.
- Prefer small, reviewable changes over large rewrites.
- Keep docs (README, AGENTS.md, help text) aligned with script behavior.
- Do not change default behaviors casually — users rely on stable defaults.

## Verification

Run all of these from the repo root before considering a change done:

```bash
# Syntax check
bash -n bin/agent-sandbox

# Lint (if shellcheck is available)
shellcheck bin/agent-sandbox || true

# Smoke tests
./bin/agent-sandbox help
./bin/agent-sandbox --dry-run up
./bin/agent-sandbox --dry-run status
./bin/agent-sandbox --dry-run rm
```

## Sandbox Workflow

When working inside a sandbox created by this tool, commit your work so the host
can fetch, diff, and merge it:

```bash
git add -A && git commit -m "describe what you did"
```
