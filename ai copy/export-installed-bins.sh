#!/bin/bash
# Export installed command-line applications using distrobox-export

# List of binaries to export (add more as needed)
BINARIES=(
    qwen
    claude
    gemini
    opencode
    crush
    goose
    q
    codex
    cursor-agent
)

for bin in "${BINARIES[@]}"; do
    if [ -x "/usr/bin/$bin" ]; then
        distrobox-export --bin "/usr/bin/$bin"
    fi
done
