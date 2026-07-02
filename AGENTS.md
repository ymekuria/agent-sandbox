# Agent Instructions — agent-sandbox-cli

This repo contains `agent-sandbox-cli`, a Bash CLI tool that wraps Docker Sandboxes (`sbx`)
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

## Pull Request Workflow

When creating a PR, request a Copilot code review:

```bash
gh pr edit <PR_NUMBER> --add-reviewer @copilot
```

Check for review comments:

```bash
gh api repos/ymekuria/agent-sandbox-cli/pulls/<PR_NUMBER>/reviews
gh api repos/ymekuria/agent-sandbox-cli/pulls/<PR_NUMBER>/comments
```

## Sandbox Workflow

When working inside a sandbox created by this tool, commit your work so the host
can fetch, diff, and merge it:

```bash
git add -A && git commit -m "describe what you did"
```
