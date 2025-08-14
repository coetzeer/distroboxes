FROM quay.io/toolbx/arch-toolbox

RUN pacman-key --init && pacman-key --populate archlinux && pacman -Syu --noconfirm

RUN pacman -S --noconfirm base-devel git sudo

ARG USER=archuser
ARG UID=1000

RUN useradd -m -u $UID -G wheel $USER

# Configure sudoers to allow the wheel group to run commands without a password,
# which is useful for automation in a Docker context.
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel-group

# Switch to the new user and set the working directory
USER $USER
WORKDIR /home/$USER

# Install yay from the AUR
# We use a temporary directory for the build process.
# We also use `su -c` to run the command as the new user.
RUN set -e; \
    max_attempts=5; \
    attempt=1; \
    until git clone https://aur.archlinux.org/yay.git; do \
      if [ $attempt -ge $max_attempts ]; then \
        echo "git clone failed after $attempt attempts."; exit 1; \
      fi; \
      sleep_time=$((2 ** attempt)); \
      echo "git clone failed. Retrying in $sleep_time seconds..."; \
      sleep $sleep_time; \
      attempt=$((attempt + 1)); \
    done && \
    cd yay && \
    makepkg -si --noconfirm

# Clean up the build directory to keep the image size small
RUN rm -rf yay

# Clean up package cache to keep the image small.
# This needs to be run with root privileges.
USER root
RUN pacman -Scc --noconfirm

# Return to the non-root user for the final image
USER $USER

# Set a default command to run when the container starts
CMD ["/bin/bash"]
