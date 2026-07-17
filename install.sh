#!/usr/bin/env bash
# 把本仓库的配置软链到 ~/.config 下。
# 已存在的真实文件/目录会先备份到 ~/.config-backup-<时间戳>/。
# 重复执行安全（幂等）。

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"

link() {
    local src="$REPO/$1" dst="$2"

    if [ ! -e "$src" ]; then
        echo "跳过 $1：仓库中不存在"
        return
    fi

    # 已经是指向本仓库的软链，无需处理。
    if [ -L "$dst" ] && [ "$(readlink -f "$dst")" = "$(readlink -f "$src")" ]; then
        echo "已链接 $dst"
        return
    fi

    if [ -e "$dst" ] || [ -L "$dst" ]; then
        mkdir -p "$BACKUP"
        mv "$dst" "$BACKUP/"
        echo "备份 $dst -> $BACKUP/"
    fi

    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
    echo "链接 $dst -> $src"
}

link fish           "$HOME/.config/fish"
link kitty          "$HOME/.config/kitty"
link starship.toml  "$HOME/.config/starship.toml"
link .gitconfig     "$HOME/.gitconfig"
link zsh/.zshrc     "$HOME/.zshrc"
link zsh/zsh.d      "$HOME/.zsh.d"

# 密钥文件不入库，新机器需从模板生成后手动填值。
seed_secrets() {
    local example="$REPO/$1" target="$REPO/${1%.example}"
    if [ ! -e "$target" ]; then
        cp "$example" "$target"
        echo "生成 $target —— 请填入真实密钥"
    fi
}

seed_secrets fish/secrets.fish.example
seed_secrets zsh/zsh.d/secrets.zsh.example

# oh-my-zsh 本体与第三方插件，均为外部仓库，不纳入本仓库。
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "安装 oh-my-zsh..."
    git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
fi

clone_plugin() {
    local url="$1" dst="$HOME/.oh-my-zsh/custom/plugins/$2"
    if [ -d "$dst" ]; then
        echo "已存在插件 $2"
    else
        git clone --depth=1 "$url" "$dst"
    fi
}

# 对应 .zshrc 中 plugins=(...) 里的非内置插件。
clone_plugin https://github.com/zsh-users/zsh-autosuggestions.git      zsh-autosuggestions
clone_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git  zsh-syntax-highlighting
clone_plugin https://github.com/tom-doerr/zsh_codex.git                zsh_codex
clone_plugin https://github.com/bobthecow/git-flow-completion.git      git-flow-completion

# 以下配置当前机器未启用，需要时手动放开：
# tmux.conf 会改变 tmux 行为（prefix 改为 C-a、vi 模式等）。
# link tmux/tmux.conf "$HOME/.tmux.conf"
# link alacritty      "$HOME/.config/alacritty"

# nvim 是独立仓库（costa92/lazy-vim），自行管理，不在此处链接。

echo
echo "完成。"
[ -d "$BACKUP" ] && echo "原配置已备份至 $BACKUP"
