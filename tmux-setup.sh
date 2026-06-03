#!/bin/bash
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

# 写入 tmux 配置
cat > ~/.tmux.conf << 'TMUXCONF'
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",*256col*:Tc"
set -g mouse on
set -g history-limit 50000
set -g base-index 1
setw -g pane-base-index 1

# 手机友好状态栏
set -g status-style bg=colour235,fg=white
set -g status-left ""
set -g status-right ""
set -g window-status-format " #I:#W "
set -g window-status-current-format " #I:#W "
set -g window-status-separator "|"
set -g status-position bottom
TMUXCONF

# 写入快捷命令
if ! grep -q 'alias tn=' ~/.zshrc 2>/dev/null; then
    cat >> ~/.zshrc << 'ALIASES'

# tmux 快捷命令
alias tn='tmux new -s work'
alias ta='tmux attach -t work'
alias tl='tmux ls'
alias tk='tmux kill-session -t work'
ALIASES
fi

echo "✅ 完成。以后用 tn 创建，ta 接入，tl 查看，tk 关闭"
