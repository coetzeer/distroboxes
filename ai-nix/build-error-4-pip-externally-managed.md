# Build Error 4: Pip Externally Managed Environment

## Problem
Build failed with error:
```
error: externally-managed-environment
× This environment is externally managed
╰─> This command has been disabled as it tries to modify the immutable `/nix/store` filesystem.
```

## Root Cause
Nix manages Python packages and prevents pip from installing packages globally to maintain system integrity.

## Steps Taken
1. Identified that pip install qwen-cli fails in Nix environment
2. Need to either:
   - Remove pip install from shellHook
   - Use Nix package for qwen-cli if available
   - Use virtual environment approach

## Resolution
Remove pip install from shellHook or find Nix alternative for qwen-cli package.
