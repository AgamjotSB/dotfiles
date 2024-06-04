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

## Notes

- The `stow .` command places the symlinks in the parent directory of where you run it.
  - for eg `.bashrc` lives in the top level of my $HOME directory, so it needs to live in the top level of `~/dotfiles/`.
- Stow has a list of files and directories it ignores by default [here](https://www.gnu.org/software/stow/manual/stow.html#Types-And-Syntax-Of-Ignore-Lists)
  - Can create a local stow ignore file `.stow-local-ignore` (I didn't as of now)
- `stow .` will throw an error if the file already exists where stow is trying to create a symlink
  - Can move/delete the files **OR** use `stow --adopt .` however, the files in `dotfiles/` will be overwritten by the conflicting ones.
- [Documentation for GNU stow](https://www.gnu.org/software/stow/manual/stow.html#Types-And-Syntax-Of-Ignore-Lists)
