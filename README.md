# ubuntu config

Ubuntu 开发环境配置，通过软链托管在本仓库：改 `~/.config/xxx` 就是改仓库文件。

当前主力环境：**kitty + zsh(oh-my-zsh) + neovim + FiraCode Nerd Font**，Ubuntu 24.04 / amd64。

## 快速开始

新机器：

```shell
$ git clone --recursive git@github.com:costa92/ubuntu_config.git
$ cd ubuntu_config
$ ./bootstrap.sh
```

`bootstrap.sh` 装软件，装完自动调用 `install.sh` 建立配置软链。两个脚本都幂等，可重复执行。

已有环境只想重建软链：

```shell
$ ./install.sh
```

已存在的真实配置会先备份到 `~/.config-backup-<时间戳>/`。

## 装完后的手动步骤

1. **填写密钥**（见下节）
2. **切换默认 shell**：`chsh -s $(which zsh)`，重新登录生效
3. **nvim 插件**：首次启动 `nvim` 会自动安装

## 密钥

密钥不入库。仓库只存模板，`install.sh` 会自动从模板生成骨架，填入真实值即可：

| 文件 | 说明 |
|---|---|
| `zsh/zsh.d/secrets.zsh` | zsh 密钥，由 `.zshrc` 自动加载 |
| `fish/secrets.fish` | fish 密钥，由 `config.fish` 显式 source |

两者均被 `.gitignore` 排除。对应的 `*.example` 是入库的模板。

> 提交前留意不要把密钥写回 `env.zsh` / `config.fish`。

## 修改 nvim 配置

`nvim/` 是 submodule，改动要在子仓库里提交，再回父仓库更新引用：

```shell
$ cd nvim              # 或 ~/.config/nvim，同一目录
$ git add . && git commit -m "..." && git push
$ cd .. && git add nvim && git commit -m "chore: 更新 nvim 引用"
```

submodule 已固定跟踪 `main` 分支，`git submodule update --remote nvim` 可拉取最新。

## 目录结构

| 目录 | 说明 | 软链目标 |
|---|---|---|
| `zsh/` | zsh + oh-my-zsh 配置 | `~/.zshrc`、`~/.zsh.d` |
| `kitty/` | kitty 终端 | `~/.config/kitty` |
| `nvim/` | neovim（submodule → [lazy-vim](https://github.com/costa92/lazy-vim)） | `~/.config/nvim` |
| `fish/` | fish shell | `~/.config/fish` |
| `starship.toml` | starship 提示符 | `~/.config/starship.toml` |
| `.gitconfig` | git 全局配置 | `~/.gitconfig` |
| `alacritty/`、`tmux/` | 未启用，`install.sh` 中已注释 | — |

## 组件版本

版本固定在 `bootstrap.sh` 顶部，升级时改那里：

| 组件 | 版本 | 安装位置 |
|---|---|---|
| kitty | 0.34.1 | `~/.local/kitty.app` |
| neovim | v0.12.1 | `/usr/local/nvim` |
| FiraCode Nerd Font | v3.4.0 | `~/.local/share/fonts/NerdFonts` |

> `/usr/local/nvim` 被 `zsh/zsh.d/alias.zsh` 和 `.gitconfig` 硬编码引用，改路径需同步改这两处。

`bootstrap.sh` 另会安装配置依赖的 CLI：ripgrep、fd、autojump、git-flow、zoxide、build-essential。

## 相关链接

- [starship](https://starship.rs/)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
- [fish functions](https://github.com/razzius/fish-functions)
