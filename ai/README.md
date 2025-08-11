use this to force distrobox to look for docker images:

```
export DBX_CONTAINER_MANAGER="docker"
```

to build:

```
docker build -t db-ai .

```

to create distrobox:

```
distrobox create --name db-ai --image db-ai

```

then enter the dragon:

```
distrobox enter db-ai

```

Or Podman (don't set the environment variable)

to build:

```
podman build --no-cache -t db-ai .

```

to create distrobox:

```
distrobox create --name db-ai --image db-ai

```

then enter the dragon:

```
distrobox enter db-ai

```
