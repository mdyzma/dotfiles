# Dotfiles automation

## Summary
Software development landscape has undergone a fundamental shift from manual, curated workstation management to automated, reproducible infrastructure. As of 2026, the convergence of high-performance tooling—often written in system-level languages like Rust—and sophisticated configuration management utilities has enabled developers to treat their local machines with the same rigor as production servers. This report presents a comprehensive project plan and technical implementation guide for automating the setup of a high-efficiency development environment across the three dominant operating systems: macOS Tahoe, Windows 11, and Ubuntu LTS 24.

In this repo I try to contain analysis of my experience and current trends in terminal emulation, editor latency, as well as containerization efficiency usefull currently in development process. I have put extra effort to gain measurable improvements in startup time, input latency, and memory overhead compared to the predecessors of described here tools (Electron based applications). Furthermore, I focused on integration of local Large Language Models (LLMs) via Ollama, which represents a new standard in developer privacy and capability, moving AI assistance from cloud APIs to local system services.

This document details the architectural philosophy, bootstrapping logic, and granular configuration required to achieve a "single-command" provision. It utilizes Chezmoi for stateful dotfile management, Homebrew/Winget for binary package orchestration, and custom scripting for browser and AI tool automation. The resulting framework ensures that a developer can transition between a MacBook Pro, a Windows workstation, and a Linux cloud instance with zero friction, maintaining a unified interface and workflow.

## Philosophy of Ephemeral Workstations

I remember when developer machines were like "pets" — unique, handcrafted environmentsfull of custom solutions. They also became increasingly fragile over time due to configuration drift. Now I treat my workstation as  ephemeral resources that can be wiped and rebuilt in minutes. 

The core requirement for this project is reproducibility. A script executed on a fresh Ubuntu install must yield an environment functionally identical to one on macOS or Windows.

## Selected tools

1. Terminal Emulation: **WezTerm**
2. The Editor: **Zed & VS Code**
3. Containerization: **OrbStack**
4. Orchestration: **Chezmoi**


## Directory Structure

The proposed repository structure for the project is as follows:


```bash
~/dotfiles/
├──.chezmoi.toml.tmpl # Global configuration/variables
├──.chezmoiignore # Files to ignore per OS
├── run_once_before_bootstrap.sh.tmpl # Package installation script
├── dot_config/
│ ├── wezterm/
│ │ └── wezterm.lua # Terminal config
│ ├── starship.toml # Shell prompt config
│ ├── zed/
│ │ └── settings.json # Zed Editor config
│ └── brew/
│ └── Brewfile # macOS/Linux packages
└── AppData/
      └── Roaming/
        └── Zed/
          └── settings.json # Windows specific path mapping
```
* _bootstrap.sh_: macOS and Ubuntu Bootstrapper. This script must detect the OS, install the package manager (Homebrew), and then install Chezmoi to take over the rest of the process.
* _bootstrap.ps1_ : Windows Bootstrapper, allows winget and WSL2 forbasic tools installation
