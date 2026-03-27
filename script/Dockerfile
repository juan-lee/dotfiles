FROM ubuntu:24.04

ARG USERNAME=testuser
ARG USER_UID=1000
ARG USER_GID=1000

# Minimal prereqs — bootstrap installs everything else
RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo curl git ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Remove default ubuntu user (UID/GID 1000 conflict), then create test user
RUN userdel -r ubuntu 2>/dev/null || true \
    && groupadd --force --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m -s /bin/bash ${USERNAME} \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

USER ${USERNAME}
WORKDIR /home/${USERNAME}

ENV DOTFILES_REPO_URL=https://github.com/juan-lee/dotfiles.git

CMD ["sleep", "infinity"]
