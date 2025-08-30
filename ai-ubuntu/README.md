# CLI Tools Distrobox

A distrobox container with AI CLI tools: gemini-cli, qwen-cli, and Amazon Q CLI.

## Build

```bash
podman build  . -t db-ai-ubuntu
```

## Usage

Create distrobox:
```bash
distrobox create --name db-ai-ubuntu --image db-ai-ubuntu
```

Enter container:
```bash
distrobox enter db-ai-ubuntu
```

Export tools to host:
```bash
distrobox-export --bin /usr/local/bin/q
distrobox-export --bin /usr/local/bin/gemini-cli
distrobox-export --bin /usr/local/bin/qwen
```

## Available Tools

- `q` - Amazon Q CLI
- `gemini-cli` - Google Gemini CLI
- `qwen` - Qwen CLI
