FROM debian:latest

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Install vim, git, process tools, lsb-release
    && apt-get install -y \
    vim \
    git \
    wget \
    openssh-client \
    less \
    iproute2 \
    procps \
    lsb-release \
    gnupg2 \
    sudo \
    #
    # Install postgresql-client-12
    && export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
    && echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && apt-get update \
    && apt-get install -y \
    postgresql-client-12 \
    postgresql-server-dev-12 \
    #
    # Install ruby
    && apt-get install -y \
    ruby2.5 \
    ruby-dev \
    build-essential \
    libsqlite3-dev \
    zlib1g-dev \
    libxml2 \
    #
    # Install debug tools
    && gem install \
    rails:5.2.2.1 \
    webdrivers \
    #
    # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # [Optional] Add sudo support for the non-root user
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog