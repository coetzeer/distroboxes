use this to force distrobox to look for docker images:

```
export DBX_CONTAINER_MANAGER="docker"
```

to build:

```
docker build -t open-office .

```

to create distrobox:

```
distrobox create --name open-office --image open-office

```

then enter the dragon:

```
distrobox enter open-office

```

Or Podman (don't set the environment variable)

to build:

```
podman build --no-cache -t open-office .

```

to create distrobox:

```
distrobox create --name open-office --image open-office

```

then enter the dragon:

```
distrobox enter open-office

```
