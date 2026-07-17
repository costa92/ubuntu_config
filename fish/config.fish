

starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Async prompt
set -g async_prompt_functions _pure_prompt_git

# Basic environments
set -x SHELL fish
set -x TERM screen-256color
set -x EDITOR nvim
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8



# Config files directory.
set -x XDG_CONFIG_HOME $HOME/.config


# https://github.com/nvm-sh/nvm?tab=readme-ov-file#fish

# set -gx NVM_DIR $HOME/.nvm
# ~/.config/fish/config.fish
# You must call it on initialization or listening to directory switching won't work
load_nvm >/dev/stderr


# https://github.com/junegunn/fzf
set -x FZF_DEFAULT_COMMAND 'fd --type f --exclude .git'

# $PATH environment variables
set -e fish_user_paths
set -gx fish_user_paths \
    $HOME/.pyenv/shims \
    $GOPATH/bin \
    $HOME/.cargo/bin \
    $HOME/.dotnet/tools \
    $N_PREFIX/bin \
    $VCPKG_ROOT \
    $HOME/dev/src/flutter/bin \
    /usr/local/lib/ruby/gems/3.4.2/bin \
    /usr/local/opt/ruby/bin \
    /usr/local/opt/llvm/bin \
    /usr/local/sbin \
    /usr/local/nvim/bin \
    /usr/local/bin \
    /usr/sbin \
    /usr/bin \
    /sbin \
    /bin \
    $HOME/.fzf/bin \
    $fish_user_paths

# 检查文件是否存在
if test -e ~/.gvm/environments/default
    bass source ~/.gvm/environments/default
end

set -x GOPATH $HOME/code/go
set -x GOBIN $GOPATH/bin
set -x PATH $PATH $GOPATH/bin
set -x GOPRIVATE code.hellotalk.com
set -x GO111MODULE on
# set -x GOPROXY https://goproxy.cn
# set -gx GOPROXY https://goproxy.cn,direct
set -gx GOPROXY https://proxy.golang.org,direct

#set -x GOPROXY direct

# pyhone env variables
set -x _OLD_VIRTUAL_PATH $PATH
set -gx PATH $PATH $HOME/anaconda3/bin

set -x CUDA_VISIBLE_DEVICES 0

# krew env variables 
# https://krew.sigs.k8s.io/docs/user-guide/setup/install/
set -gx PATH $PATH $HOME/.krew/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/hellotalk/anaconda3/bin/conda "shell.fish" hook $argv | source
# <<< conda initialize <<<

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

# 密钥统一放在 secrets.fish（不入库）
test -s $HOME/.config/fish/secrets.fish; and source $HOME/.config/fish/secrets.fish

# set -gx CUDA_VISIBLE_DEVICES 0,1,2,3

set -gx LANGCHAIN_ENDPOINT https://api.smith.langchain.com
set -gx LANGCHAIN_TRACING_V2 true
set -gx LANGCHAIN_PROJECT ai_test

set -gx deepseek_api_url https://api.deepseek.com

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/hellotalk/.cache/lm-studio/bin
# Added by pnpm 
set -gx PATH $PATH /home/hellotalk/.nvm/versions/node/v22.2.0/bin

# 前三行是安装 CUDA 时需要设置的
set -x PATH /usr/local/cuda/bin $PATH
set -x LD_LIBRARY_PATH /usr/local/cuda/lib64 $LD_LIBRARY_PATH
set -x CUDA_HOME /usr/local/cuda/bin

set -x CUDA_VISIBLE_DEVICES 0

set -x DEERAPI_URL https://api.deerapi.com/v1

#set -x PYTHONHOME /tmp/.mount_cursorEFeUoH/usr/lib/python3.12 python3
set -e PYTHONHOME
set -e PYTHONPATH



string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)


# Added by Antigravity CLI installer
set -gx PATH "/home/hellotalk/.local/bin" $PATH
