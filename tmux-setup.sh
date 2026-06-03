#!/bin/bash
# tmux 一键部署脚本 — 手机友好配置
# 用法: bash <(curl -fsSL https://你的地址/tmux-setup.sh)
# 或者: scp 到目标机器直接 bash tmux-setup.sh

set -e

# 安装 tmux
if command -v apt &>/dev/null; then
    sudo apt install -y tmux
elif command -v yum &>/dev/null; then
    sudo yum install -y tmux
elif command -v dnf &>/dev/null; then
    sudo dnf install -y tmux
elif command -v brew &>/dev/null; then
    brew install tmux
fi

# 写入配置
cat > ~/.tmux.conf << 'EOF'
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",*256col*:Tc"
set -g mouse on
set -g history-limit 50000
set -g base-index 1
setw -g pane-base-index 1

# 手机友好状态栏 — 只有窗口号，点击切换
set -g status-style bg=colour235,fg=white
set -g status-left ""
set -g status-right ""
set -g window-status-format " #I:#W "
set -g window-status-current-format " #I:#W "
set -g window-status-separator "|"
set -g status-position bottom
EOF

echo "✅ tmux 已部署，运行 tmux new -s work 开始使用"
