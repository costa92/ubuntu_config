#!/usr/bin/env bash
# 新机器一键安装：kitty + zsh + nvim + FiraCode Nerd Font 及配置依赖。
# 面向 Ubuntu 24.04 / amd64。
# 装完会调用 install.sh 建立配置软链。
# 重复执行安全（已安装的会跳过）。

set -euo pipefail

# 版本与当前主力机器保持一致，升级时改这里。
KITTY_VERSION="0.34.1"
NVIM_VERSION="v0.12.1"
NERD_FONT_VERSION="v3.4.0"

# kitty.conf 只用到 FiraCode，不装全套 Nerd Fonts。
NERD_FONT_NAME="FiraCode"

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FONT_DIR="$HOME/.local/share/fonts/NerdFonts"
# alias.zsh 与 .gitconfig 硬编码了此路径，勿改。
NVIM_PREFIX="/usr/local/nvim"

step() { echo; echo "==> $1"; }

step "系统依赖"
# ripgrep/fd 供 nvim 模糊查找，autojump/git-flow 供 zsh 插件，build-essential 供 treesitter 编译。
sudo apt-get update -qq
sudo apt-get install -y -qq \
    zsh git curl unzip fontconfig \
    ripgrep fd-find autojump git-flow build-essential

# Ubuntu 的 fd 二进制名为 fdfind，补一个 fd 别名。
if ! command -v fd >/dev/null 2>&1; then
    mkdir -p "$HOME/.local/bin"
    ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
    echo "已链接 fdfind -> ~/.local/bin/fd"
fi

step "zoxide（.zshrc 中 jz 命令依赖）"
if command -v zoxide >/dev/null 2>&1; then
    echo "已安装：$(zoxide --version)"
else
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

step "kitty $KITTY_VERSION"
if [ -x "$HOME/.local/kitty.app/bin/kitty" ]; then
    echo "已安装：$("$HOME/.local/kitty.app/bin/kitty" --version)"
else
    curl -sSfL https://sw.kovidgoyal.net/kitty/installer.sh \
        | sh /dev/stdin launch=n "installer=version-$KITTY_VERSION"
    mkdir -p "$HOME/.local/bin"
    ln -sf "$HOME/.local/kitty.app/bin/kitty" "$HOME/.local/bin/kitty"
    ln -sf "$HOME/.local/kitty.app/bin/kitten" "$HOME/.local/bin/kitten"
    # 桌面环境里能搜到 kitty 图标。
    mkdir -p "$HOME/.local/share/applications"
    sed "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g; \
         s|Exec=kitty|Exec=$HOME/.local/kitty.app/bin/kitty|g" \
        "$HOME/.local/kitty.app/share/applications/kitty.desktop" \
        > "$HOME/.local/share/applications/kitty.desktop"
fi

step "neovim $NVIM_VERSION"
if [ -x "$NVIM_PREFIX/bin/nvim" ]; then
    echo "已安装：$("$NVIM_PREFIX/bin/nvim" --version | head -1)"
else
    tmp="$(mktemp -d)"
    curl -sSfL "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-x86_64.tar.gz" \
        | tar -xz -C "$tmp"
    sudo rm -rf "$NVIM_PREFIX"
    sudo mv "$tmp/nvim-linux-x86_64" "$NVIM_PREFIX"
    rm -rf "$tmp"
    sudo ln -sf "$NVIM_PREFIX/bin/nvim" /usr/local/bin/nvim
    echo "已安装到 $NVIM_PREFIX"
fi

step "$NERD_FONT_NAME Nerd Font $NERD_FONT_VERSION"
if fc-list 2>/dev/null | grep -q "${NERD_FONT_NAME}NerdFont"; then
    echo "已安装"
else
    tmp="$(mktemp -d)"
    curl -sSfL -o "$tmp/font.zip" \
        "https://github.com/ryanoasis/nerd-fonts/releases/download/$NERD_FONT_VERSION/$NERD_FONT_NAME.zip"
    mkdir -p "$FONT_DIR"
    unzip -qo "$tmp/font.zip" -d "$FONT_DIR" -x '*.md' 'LICENSE*'
    rm -rf "$tmp"
    fc-cache -f "$FONT_DIR" >/dev/null
    echo "已安装到 $FONT_DIR"
fi

step "配置软链与 oh-my-zsh"
# install.sh 负责 oh-my-zsh 本体、custom 插件与全部配置软链。
"$REPO/install.sh"

step "设为默认 shell"
if [ "$SHELL" = "$(command -v zsh)" ]; then
    echo "已是 zsh"
else
    echo "执行 chsh -s $(command -v zsh) 后重新登录生效（需输入密码）"
fi

cat <<EOF

安装完成。后续手动步骤：
  1. 填写密钥：fish/secrets.fish 与 zsh/zsh.d/secrets.zsh（从同名 .example 生成）
  2. nvim 配置为 submodule，执行：git submodule update --init --recursive
  3. 重新登录以应用 shell 变更
EOF
