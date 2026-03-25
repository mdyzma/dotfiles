# Project Context: BEAST (High-Performance ML & Dev)

## Environment Hardware
- **OS:** Pop!_OS 24.04 (Ubuntu-based, GNOME/COSMIC)
- **GPU:** NVIDIA GeForce RTX 5090 (24GB+ VRAM)
- **Motherboard:** ASUS B650E MAX GAMING WIFI
- **Architecture:** x86_64, Linux Kernel 6.x+

## Software Stack (XDG Compliant)
- **Shell:** Zsh + Starship Prompt
- **Python:** Managed via `pyenv` (Current: 3.12/3.14)
- **Node/NPM:** Managed via `fnm` (Fast Node Manager)
- **Package Manager:** `poetry` (Global envs in `~/.local/share/pypoetry`)
- **AI Tools:** Gemini CLI with `context-mode` MCP hooks

## Critical Instructions for Gemini
1. **GPU Awareness:** When suggesting code or tools, always optimize for NVIDIA CUDA/Tensor cores. Assume the 5090 is the primary compute device.
2. **Path Respect:** Always use XDG Base Directory paths.
   - Configs: `~/.config`
   - Data/Local bins: `~/.local/share` and `~/.local/bin`
3. **No Sudo:** Do not suggest `sudo` for `npm` or `python` tasks; use the managers (`fnm`, `pyenv`, `poetry`) already configured.
4. **Tooling:** Prefer `bat` over `cat`, and `poetry run` for executing Python scripts.
