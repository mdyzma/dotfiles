# My chezmoi dotfiles


## Quickstart 

```bash
chezmoi init --apply $GITHUB_USERNAME
```


## Folder structure

```bash
~/.local/share/chezmoi
├── run_once
│   ├── run_once_install_unix.sh.tmpl
│   ├── run_once_install_windows.ps1.tmpl
│   ├── run_once_install_fonts_unix.sh.tmpl
│   └── run_once_install_fonts_windows.ps1.tmpl
│
├── packages
│   ├── brew
│   │   └── Brewfile
│   ├── apt
│   │   └── packages.txt
│   └── dnf
│       └── packages.txt
│
├── fonts
│   └── IntelliJMonoNerdFont #(48 fonts)
│       ├── IntelliJMonoNerdFont-Regular.ttf
│       ├── IntelliJMonoNerdFont-Bold.ttf
│       ├── IntelliJMonoNerdFont-Italic.ttf
│       ├── IntelliJMonoNerdFont-BoldItalic.ttf
│       └── ...
│
├── dot_config
│   ├── zsh
│   │   ├── env.zsh
│   │   ├── aliases.zsh
│   │   ├── interactive.zsh
│   │   └── platform.zsh.tmpl
│   └── starship.toml
│
├── dot_zshenv
├── dot_zprofile
├── dot_zshrc
│
└── README.md
```
