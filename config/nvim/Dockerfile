# Builds a container to test bootstrapping my neovim config in a non-Nix env.

# build:    docker build -t nvim-bootstrap .
# run:      docker run -it -v "$HOME"/.ssh:/home/ss2/.ssh nvim-bootstrap bash

FROM alpine:latest

# use ssh-agent forwarding to avoid the hassle of needing to setup keys
RUN apk add --no-cache shadow
RUN apk add --no-cache bash
RUN apk add --no-cache openssh
RUN apk add --no-cache git
RUN apk add --no-cache neovim
RUN apk add --no-cache neovim-doc
RUN apk add --no-cache tmux

RUN apk add --no-cache clang

# add user
RUN useradd -ms /bin/bash ss2
USER ss2
WORKDIR /home/ss2/.config/nvim

# give me my alias
RUN echo 'alias vim="nvim"' >> /home/ss2/.bashrc
