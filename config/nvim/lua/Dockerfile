# Builds a container to test bootstrapping my neovim config in a non-Nix env.

# build:    docker build -t nvim-bootstrap .
# run:      docker run -t nvim-bootstap sh
# attatch:  ssh -A ss2@privateHost

FROM alpine:latest

# use ssh-agent forwarding to avoid the hassle of needing to setup keys
RUN apk add --no-cache shadow
RUN apk add bash
RUN apk add git
RUN apk add --no-cache neovim
RUN apk add tmux

# add user
RUN useradd -ms /bin/bash ss2
USER ss2

# setup environment
COPY --chown=ss2 . /home/ss2/.config/nvim/lua
WORKDIR /home/ss2/.config/nvim/lua
RUN mv ss2-init.lua ../init.lua
