# Build Error 8: Hash Mismatch in Fixed-Output Derivation

## Error Message
```
error: hash mismatch in fixed-output derivation '/nix/store/4acyjpg5n33x4q2f734pr81s4m7gcv1q-metadata-linux-x64-stable.json.drv':
         specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
            got:    sha256-ZSwrwoltRz0j+QRq2coUJwacFiS8f96cQmo/Zy5qHdY=
```

## Fix Applied
The issue appears to be with VSCode metadata download having an empty hash. Will try building a minimal version first to isolate the problematic package.
