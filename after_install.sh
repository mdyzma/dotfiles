# =====================
# # ssh
# =====================
# ssh-keygen -t ed25519 -C "your_email@example.com"
# or
# copy .ssh from baskup

chmod 700 .ssh
chmod 600 .ssh/authorized_keys
chmod 600 .ssh/config
chmod 600 .ssh/id_ed25519
chmod 644 .ssh/id_ed25519.pub
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# =====================
# # apt
# =====================
# #  installpackages from apt
sudo apt install mc htop bat ffmpeg fzf wget tree jq ncdu dfc yt-dlp gh csvkit pandoc ripgrep just eza zoxide
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install fastfetch
sudo apt update
sudo apt install nvidia-cuda-toolkit

sudo apt update && sudo apt install -y \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  curl \
  git \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev
  sudo apt update
  sudo apt install texlive-full

# =====================
# # zsh
# =====================
#
sudo apt install zsh
chsh -s $(which zsh)
sudo apt install zsh-autosuggestions

# # Nerd Fonts in /usr/share/fonts
mkdir -p ~/.local/share/fonts
# Download, unzip, and register the font
wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip \
&& unzip /tmp/JetBrainsMono.zip -d ~/.local/share/fonts \
&& rm /tmp/JetBrainsMono.zip \
&& fc-cache -fv
# # starship
curl -sS https://starship.rs/install.sh | sh
# atuin
curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | sh

sudo hostnamectl set-hostname beast
sudo nano /etc/hosts # 127.0.0.1 localhost to beast
sudo systemctl restart systemd-hostnamed
# copy zsh folder from dotfiles to ~/.config copy .zshrc to home
source ~/.zshrc
# =====================
# # NPM
# =====================
#
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$XDG_DATA_HOME/fnm" --skip-shell
source ~/.zshrc
fnm install --lts
fnm use v24.14.1
fnm default v24.14.1

# =====================
# # pyenv & poetry
# =====================
#
curl https://pyenv.run | bash
mkdir -p "$HOME/.cache/pyenv"
pyenv install 3
pyenv install 3.11
pyenv install 3.12
pyenv install 3.13

export POETRY_HOME="$XDG_DATA_HOME/pypoetry"
curl -sSL https://install.python-poetry.org | python3 -
poetry config virtualenvs.in-project false
poetry config virtualenvs.path "$XDG_DATA_HOME/pypoetry/virtualenvs"
poetry config --list
# =====================
# # bun & tsx
# =====================
#
curl -fsSL https://bun.sh/install | bash
exec /usr/bin/zsh
bun --version
npm install -g tsx
# =====================
# # AI TUI tools
# =====================
#
npm install -g context-mode
# gemnini
npm install -g @google/gemini-cli
# claude
curl -fsSL https://claude.ai/install.sh | bash
# codex
npm install -g @openai/codex
# opencode
npm install -g opencode-ai

# Antigravity
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | sudo gpg --dearmor --yes -o /etc/apt/keyrings/antigravity-repo-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null
sudo apt update
sudo apt install antigravity


# =====================
# # Flatpack & games
# =====================
#
flatpak update
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.heroicgameslauncher.hgl # rockstar
flatpak install flathub net.lutris.Lutris # starcraft 2
flatpak install flathub net.davidotek.pupgui2
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub org.upscayl.Upscayl
