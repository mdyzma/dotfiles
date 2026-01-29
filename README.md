# My chezmoi dotfiles


## Quickstart 

```bash
chezmoi init --apply $GITHUB_USERNAME
```


## Folder structure

```bash
.local/share/chezmoi
├── .chezmoi.toml.tmpl
├── dot_zshenv
├── dot_zprofile
├── dot_zshrc
├── dot_config
│   ├── zsh
│   │   ├── env.zsh
│   │   ├── aliases.zsh
│   │   ├── interactive.zsh
│   │   └── platform.zsh.tmpl
│   └── starship.toml
├── packages
│   └── brew
│       └── Brewfile
└── README.md
```
