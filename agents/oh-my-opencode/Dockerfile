FROM ghcr.io/coetzeer/arch-base:main

# Install opencode
RUN brew install opencode 2>/dev/null || true

# Install Node.js and oh-my-opencode
USER root
RUN pacman -Syu --noconfirm nodejs npm && \
    npm install -g oh-my-opencode

# Switch to the default user
USER agent
WORKDIR /home/agent

# Register the oh-my-opencode plugin with opencode
RUN mkdir -p ~/.config/opencode && \
    printf '{\n  "plugin": ["oh-my-opencode"]\n}\n' > ~/.config/opencode/opencode.json

# Set a default command to run when the container starts
CMD ["/bin/bash"]
