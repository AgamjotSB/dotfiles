# My dotfiles

This directory contains the dotfiles for my system

## Requirements

- git `pacman -S git`
- stow `pacman -S stow`

## Installation

1. checkout the dotfiles repo in you `$HOME` directory using git

```
git clone https://github.com/AgamjotSB/dotfiles.git
cd dotfiles
```

2. then use GNU stow to create symlinks

```
stow .
```
