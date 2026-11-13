FROM ghcr.io/coetzeer/arch-base:main

# Install Node.js and oh-my-pi
USER root
RUN pacman -Syu --noconfirm nodejs npm && \
    npm install -g @oh-my-pi/pi-coding-agent

# Switch to the default user
USER agent
WORKDIR /home/agent

# Install omp plugins
RUN omp install pi-web-access pi-mcp-adapter

# Set a default command to run when the container starts
CMD ["/bin/bash"]
