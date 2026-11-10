FROM fedora:45

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN dnf install -y \
        git \
        make \
        rpm-build \
        rpmdevtools \
        rpmlint \
        librsvg2-tools \
        shadow-utils \
    && dnf clean all

RUN groupadd --gid "${USER_GID}" "${USERNAME}" \
    && useradd --uid "${USER_UID}" --gid "${USER_GID}" \
        --create-home --shell /bin/bash "${USERNAME}"

USER ${USERNAME}
WORKDIR /workspaces/flatpak-command-exporter
