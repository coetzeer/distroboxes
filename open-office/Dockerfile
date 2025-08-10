# Start with a base Arch Linux image.
FROM docker.io/archlinux:latest

# Set up the Arch Linux keyring and sync repositories
RUN pacman-key --init && pacman-key --populate archlinux && pacman -Syu --noconfirm

# Install base-devel and git, which are required to build AUR packages
RUN pacman -S --noconfirm base-devel git sudo

# Set up a dedicated build user for security
ARG USER=archuser
ARG UID=1000

# Create the user and add them to the 'wheel' group for sudo access
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
RUN git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm

# Clean up the build directory to keep the image size small
RUN rm -rf yay

# Now, install any other packages you want using yay.
# This assumes the user `archuser` is configured to use yay.
# The `sudo` is required because `yay` often needs elevated privileges for `pacman` operations.
# You can use `yay --noconfirm -S` for automated installations.
RUN yay --noconfirm -S \
    openoffice-bin apr-util java-environment gstreamer0.10-base mesa mime-types nss

# Clean up package cache to keep the image small.
# This needs to be run with root privileges.
USER root
RUN pacman -Scc --noconfirm

# Return to the non-root user for the final image
USER $USER

# Set a default command to run when the container starts
CMD ["/bin/bash"]
