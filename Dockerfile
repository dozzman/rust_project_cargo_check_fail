from ubuntu:20.04

WORKDIR /root

# install nvim + deps
RUN apt-get update && \
    apt-get install -y curl git && \
    curl -L https://github.com/neovim/neovim/releases/download/v0.5.0/nvim-linux64.tar.gz | tar -zx && \
    ln -rs nvim-linux64/bin/nvim /usr/local/bin && \
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
              https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -sSf | sh -s -- -y

# install rust-analyzer
RUN curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz \
        | gunzip -c - > /usr/local/bin/rust-analyzer && \
    chmod +x /usr/local/bin/rust-analyzer

# copy project + config files
COPY init.vim /root/.config/nvim/init.vim
COPY Cargo.toml Cargo.toml
COPY src/ src/
COPY rust-project.json.old rust-project.json.old
