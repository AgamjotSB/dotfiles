# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state" 

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
export HISTDUP=erase

# Editors
export EDITOR="nvim"
export VISUAL="nvim"

# Rust / Cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH="$CARGO_HOME/bin:$PATH"

# Go
export GOPATH="$XDG_DATA_HOME/go"
export GOCACHE="$XDG_CACHE_HOME/go-build" 
export PATH="$GOPATH/bin:$PATH"

# Python
export PYTHONHISTFILE="$XDG_DATA_HOME/python/.python_history"

# node and pnpm
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node/.node_repl_history"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"
# export npm_config_prefix="$HOME/.local"
# export NPM_CONFIG_CACHE="$XDG_DATA_HOME/npm"
# export PATH=$PATH:$npm_config_prefix/bin/

# yarn
export YARN_RC_FILENAME="$XDG_CONFIG_HOME/yarn/yarnrc"

# wget
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# Android SDK
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export ANDROID_HOME="$XDG_DATA_HOME/android/sdk"
export ANDROID_AVD_HOME="$XDG_DATA_HOME/android/avd"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Dart / Flutter
export PUB_CACHE="$XDG_CACHE_HOME/pub-cache"

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# Flutter Web
export CHROME_EXECUTABLE="/usr/bin/chromium"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Qt (Wayland/X11 fallback)
export QT_QPA_PLATFORM="wayland;xcb"


