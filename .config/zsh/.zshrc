# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Directory for storing zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if not present
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Load extra completions before running compinit
zinit light zsh-users/zsh-completions

[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"
[[ -d "$XDG_STATE_HOME/zsh" ]] || mkdir -p "$XDG_STATE_HOME/zsh"

# Load completions
local zcompdump_file="$XDG_CACHE_HOME/zsh/zcompdump"
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
# Compile zcompdump in the background for faster startup
if [[ ! -f "${zcompdump_file}.zwc" || "$zcompdump_file" -nt "${zcompdump_file}.zwc" ]]; then
    zcompile "$zcompdump_file" &!
fi
unset zcompdump_file

# zinit docs, use after calling compinit for performance boost
# zinit cdreplay -q
# not required now as no compdef is added before compinit

# fzf-tab MUST be loaded after compinit, but before syntax-highlighting/autosuggestions

# async plugins (turbo mode), 'wait' to load in background, 'lucid' to not print 'Loaded plugin'
zinit wait lucid for \
    Aloxaf/fzf-tab \
    OMZP::git \
    OMZP::sudo \
    OMZP::archlinux \
    OMZP::command-not-found \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-syntax-highlighting \
    atload'if (( $+commands[aws_completer] )); then autoload -Uz bashcompinit && bashcompinit && complete -C ${commands[aws_completer]} aws; fi' \
    zdharma-continuum/null


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Keybindings
# bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no # for fzf-tab
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-dirs-first true
zstyle ':fzf-tab:complete:(cd|z|lsd):*' fzf-preview 'lsd -1 --color=always --icon=always $realpath'

# Source aliases
source "${ZDOTDIR}/aliases.zsh"

# options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Shell integrations

# Smart-cache FZF
local fzf_cache="$XDG_CACHE_HOME/zsh/fzf.zsh"
if [[ ! -f "$fzf_cache" || ${commands[fzf]} -nt "$fzf_cache" ]]; then
    fzf --zsh >! "$fzf_cache"
fi
source "$fzf_cache"

# Smart-cache Zoxide
local zoxide_cache="$XDG_CACHE_HOME/zsh/zoxide.zsh"
if [[ ! -f "$zoxide_cache" || ${commands[zoxide]} -nt "$zoxide_cache" ]]; then
    zoxide init zsh >! "$zoxide_cache"
fi
source "$zoxide_cache"

# eval "$(fzf --zsh)"
# eval "$(zoxide init zsh)"
