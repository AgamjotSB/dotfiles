# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

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
export PATH="$(go env GOPATH)/bin:$PATH"

# node and npm
export npm_config_prefix="$HOME/.local"
export NPM_CONFIG_CACHE="$XDG_DATA_HOME/npm"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node/.node_repl_history"
export PATH=$PATH:$npm_config_prefix/bin/

# yarn
export YARN_RC_FILENAME="$XDG_CONFIG_HOME/yarn/yarnrc"

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_AVD_HOME="$HOME/.android/avd"

# Python
export PYTHONHISTFILE="$XDG_DATA_HOME/python/.python_history"

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# Flutter Web
export CHROME_EXECUTABLE="/usr/bin/chromium"

# Qt (Wayland/X11 fallback)
export QT_QPA_PLATFORM="wayland;xcb"


