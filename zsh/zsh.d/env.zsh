# 环境变量。密钥不放这里，见 secrets.zsh（不入库）。

export HF_HOME=/mnt/data/cache/huggingface
export PIP_CACHE_DIR=/mnt/data/cache/pip
export GOCACHE=/mnt/data/cache/go
export npm_config_cache=/mnt/data/cache/node

# huggingface
export HUGGINGFACE_HUB_CACHE=/mnt/data/huggingface/hub
export HF_DATASETS_CACHE=/mnt/data/huggingface/datasets
export TRANSFORMERS_CACHE=/mnt/data/huggingface/transformers

if [[ "$ARGV0" == "/home/hellotalk/soft/idea/cursor/cursor.AppImage" ]]; then
  unset ARGV0
fi

# GVM
export GVM_ROOT="$HOME/.gvm"
[[ -s "$GVM_ROOT/scripts/gvm" ]] && source "$GVM_ROOT/scripts/gvm"

export PYTHON=/usr/bin/python3

# k8s
export PATH="$HOME/.krew/bin:$PATH"

# fzf
export PATH="$HOME/.fzf/bin:$PATH"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# cuda
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"


# claude-code
export PATH="$HOME/.claude/local/bin:$PATH"

# go
export GO111MODULE="on"
export GOPRIVATE="code.hellotalk.com"
export GOPATH="$HOME/code/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOPATH/bin:$PATH"
export GOPROXY="https://proxy.golang.org,direct"
export ENVIRONMENT="test"

export NODE_NO_WARNINGS=1

# yapi
export YAPI_MERGE_TYPE="mergin"
export LAST_COMMIT_AUTHOR="costa"
export YAPI_HOST="https://yapi.hellotalk8.com/"

export LANGCHAIN_ENDPOINT="https://api.smith.langchain.com"

# Goproxy
export GO_DOWNLOAD_MIRROR="https://mirrors.aliyun.com/golang/"

export OPENIA_BASE_URL="https://api.gptsapi.net"

# Milvus 向量数据库配置
# 主机地址（默认：localhost:19530）
MILVUS_ADDRESS=localhost:19530
# 数据库名（默认：default）
MILVUS_DATABASE=default
# 用户名（如果 Milvus 启用了认证，则必需）
MILVUS_USER=
# 密码（如果 Milvus 启用了认证，则必需）
MILVUS_PASSWORD=

NVIDIA_VISIBLE_DEVICES=0,1
