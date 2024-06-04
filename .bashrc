#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export EDITOR=/usr/bin/nvim
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias ll='ls -la'
alias la='ls -a'
alias uninstall='yay -Rcsu'
alias javavim='NVIM_APPNAME=nvim-javavim nvim'
PS1='[\u@\h \W]\$ '

# Keep at end of config (zoxide)
eval "$(zoxide init bash)"
