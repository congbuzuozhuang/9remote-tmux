# 9remote-tmux

配合 [9Remote](https://9remote.cc) 使用的 tmux 配置，手机端友好，小屏幕一键切换窗口。

## 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/congbuzuozhuang/9remote-tmux/main/tmux-setup.sh | bash
```

## 使用方式

```bash
# 电脑桌面终端：创建持久会话
tmux new -s work

# 手机 9Remote 终端：接入同一个会话
tmux attach -t work

# 在 tmux 里创建新窗口
Ctrl+B  C

# 手机切换窗口：直接点击屏幕底部窗口标签
```

## 特性

- 鼠标模式：手机端触屏点击切换窗口、分屏、滚动
- 状态栏精简：底部只显示窗口编号和名称，不占用小屏空间
- 256 色支持
- 50000 行回滚历史

## 状态栏截图

```
 1:bash | 2:server | 3:vim
```
