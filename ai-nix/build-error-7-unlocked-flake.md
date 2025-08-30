# Build Error 7: Unlocked Flake Reference

## Error Message
```
error: cannot call 'getFlake' on unlocked flake reference 'github:numtide/nix-ai-tools', at «none»:0 (use --impure to override)
```

## Fix Applied
Need to check flake.nix and either lock the flake or use --impure flag in the build process.
