# AI CLI Tools Nix Container

A Nix-based distrobox container with AI CLI tools: gemini-cli, qwen-cli, and Amazon Q CLI.

## Build

```bash
podman build . -t ai-nix
```

## Usage

Create distrobox:
```bash
distrobox create --name db-ai-nix --image ai-nix
```

Enter container:
```bash
distrobox enter ai-nix
```

Export tools to host:
```bash
distrobox-export --bin ~/.local/bin/q
distrobox-export --bin ~/.local/bin/gemini-cli
distrobox-export --bin ~/.local/bin/qwen
```

## Available Tools

- `q` - Amazon Q CLI
- `gemini-cli` - Google Gemini CLI  
- `qwen` - Qwen CLI

## Nix Development

Use with flakes:
```bash
nix develop
```
