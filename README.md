# agent-sandbox-cli

Run coding agents (Claude Code, Codex, OpenCode, etc.) in isolated Docker Sandbox microVMs.
Review their work as git commits — fetch, diff, merge — without giving agents direct access to your repo.

## Install

### npm (recommended)

```bash
npm install -g agent-sandbox-cli
```

This installs the `agent-sandbox` command.

### Shell installer

```bash
git clone https://github.com/ymekuria/agent-sandbox-cli.git
cd agent-sandbox-cli
./install.sh
```

### Manual

```bash
git clone https://github.com/ymekuria/agent-sandbox-cli.git
ln -s "$PWD/agent-sandbox-cli/bin/agent-sandbox" ~/.local/bin/agent-sandbox
```

## Quick Start

```bash
cd your-project
agent-sandbox up                         # launch Claude in a sandbox
agent-sandbox up --agent codex           # or use a different agent
agent-sandbox up -- -p "fix the tests"   # pass args to the agent
agent-sandbox shell                      # open a shell inside the sandbox
agent-sandbox fetch                      # fetch the agent's commits
agent-sandbox diff                       # see what changed
agent-sandbox merge                      # merge into your branch
agent-sandbox rm                         # tear down the sandbox
```

## Commands

| Command | Description |
|---|---|
| `up [-- agent-args]` | Create/start sandbox (idempotent: reuses running, recreates stopped) |
| `shell` | Open bash shell inside the running sandbox |
| `fetch` | `git fetch` the agent's commits from the sandbox remote |
| `diff [base]` | Fetch + show diff between base and sandbox branch |
| `merge [base]` | Fetch + merge the sandbox branch into base |
| `rm` | Remove the sandbox (offers to fetch first) |
| `status` | Show sandbox state: running / stopped / not found |
| `help` | Show usage information |

## Options

| Flag | Description |
|---|---|
| `--dry-run` | Print commands without running them |
| `--force` / `--yes` / `-y` | Skip confirmation prompts |
| `--agent <name>` | Agent to use (default: claude) |
| `--repo <path>` | Target repo (default: current directory) |
| `--name <name>` | Override sandbox name |

## Configuration

Copy `conf/sandbox.conf.example` to `sandbox.conf` in your repo root:

```bash
cp "$(dirname "$(which agent-sandbox)")/../conf/sandbox.conf.example" sandbox.conf
```

## Requirements

- [Docker Sandboxes](https://docs.docker.com/sandbox/) (`sbx` CLI)
- `git`
- macOS (Apple Silicon) or Linux (KVM)
