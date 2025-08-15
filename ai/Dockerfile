# Start with a base Arch Linux image.
FROM ghcr.io/coetzeer/arch-base:main

# Now, install any other packages you want using yay.
# This assumes the user `archuser` is configured to use yay.
# The `sudo` is required because `yay` often needs elevated privileges for `pacman` operations.
# You can use `yay --noconfirm -S` for automated installations.
RUN yay --removemake --needed --noprogressbar --noconfirm -S \
    neovim \
    tmux \
    zsh \
    gemini-cli \
    opencode-bin \
    crush-bin \
    amazon-q-bin \
    nano \
    codename-goose \
    claude-code \
    qwen-code \
    openai-codex \
    cursor-cli \
    zellij \
    nvim-lazy \
    tmux-plugin-manager \
    nvim-packger-git \
    && rm -fr /home/archuser/.cache

# Clean up package cache to keep the image small.
# This needs to be run with root privileges.
USER root
RUN pacman -Scc --noconfirm

COPY export-installed-bins.sh /usr/local/bin/export-installed-bins.sh

# Set a default command to run when the container starts
CMD ["/bin/bash"]
