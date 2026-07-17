# nvim 
alias vim='/usr/local/nvim/bin/nvim'

# Git 快捷命令
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'

# K8s
alias k="/usr/local/bin/kubectl"
complete -F __start_kubectl k

# onedrive-log
alias onedrive-log='journalctl --user -u onedrive -n 50'

# Claude Code + OTel 遥测 → 本地 OTel Collector :4318 → Prometheus / Loki / Grafana
# 用函数而非 alias: $$ 与 $(pwd) 在「调用时」求值,保证 process.pid=当前终端 shell、cwd=实际启动目录
# (alias 双引号会在 source 时就把 $$/$(pwd) 冻结,导致 CWD 永远是 $HOME)
yolo() {
  export CLAUDE_CODE_ENABLE_TELEMETRY=1
  export OTEL_METRICS_EXPORTER=otlp
  export OTEL_LOGS_EXPORTER=otlp
  export OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf
  export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4318
  export OTEL_EXPORTER_OTLP_METRICS_TEMPORALITY_PREFERENCE=cumulative
  export OTEL_METRICS_INCLUDE_SESSION_ID=true   # resume id (session.id);collector 已把它从 metrics 剥离防基数爆炸
  export OTEL_RESOURCE_ATTRIBUTES="process.pid=$$,host.name=$(hostname -s),process.executable.path=$(pwd)"
  export OTEL_LOG_USER_PROMPTS=1
  export OTEL_LOG_TOOL_CONTENT=1
  export OTEL_LOG_TOOL_DETAILS=1   # 捕获工具执行参数(Bash full_command 等),供 trace 的 Params 列;含命令内容,介意可去掉
  claude --dangerously-skip-permissions "$@"
}


alias claude-otel='\
  CLAUDE_CODE_ENABLE_TELEMETRY=1 \
  CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 \
  OTEL_EXPORTER_OTLP_METRICS_TEMPORALITY_PREFERENCE=delta \
  OTEL_METRICS_EXPORTER=otlp \
  OTEL_LOGS_EXPORTER=otlp \
  OTEL_EXPORTER_OTLP_PROTOCOL=grpc \
  OTEL_EXPORTER_OTLP_ENDPOINT=http://172.16.6.27:5317 \
  OTEL_RESOURCE_ATTRIBUTES="hellotalk.email=costa@hellotalk.cn" \
  OTEL_LOG_USER_PROMPTS=0 \
  OTEL_LOG_TOOL_CONTENT=0 \
  OTEL_LOG_TOOL_DETAILS=0 \
  claude --dangerously-skip-permissions'

alias icat='kitty +kitten icat'

