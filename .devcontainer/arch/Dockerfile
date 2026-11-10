FROM archlinux:latest

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN pacman -Syu --noconfirm --needed \
        base-devel \
        git \
        librsvg \
        shadow \
    && pacman -Scc --noconfirm

RUN groupadd --gid "${USER_GID}" "${USERNAME}" \
    && useradd --uid "${USER_UID}" --gid "${USER_GID}" \
        --create-home --shell /bin/bash "${USERNAME}"

USER ${USERNAME}
WORKDIR /workspaces/flatpak-command-exporter
