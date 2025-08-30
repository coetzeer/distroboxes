# Build Error 6: Pacman Database Locked

## Problem
Installation of podman failed with error:
```
error: failed to init transaction (unable to lock database)
error: could not lock database: File exists
```

## Root Cause
Pacman database is locked, likely by another package manager process.

## Steps Taken
1. Identified that pacman is the available package manager
2. Attempted to install podman but database is locked
3. Need to remove lock file or wait for other process to complete

## Resolution
Will remove the lock file and retry installation.
