# 9remote-tmux

手机端 tmux 一键部署脚本，配合 9Remote 使用。

## 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/congbuzuozhuang/9remote-tmux/main/tmux-setup.sh | bash
```

## 使用

```bash
# 电脑端：创建 tmux 会话
tmux new -s work

# 手机 9Remote：接入同一会话
tmux attach -t work

# 创建更多窗口：Ctrl+B 然后 C
# 手机切换窗口：直接点屏幕底部状态栏
```
