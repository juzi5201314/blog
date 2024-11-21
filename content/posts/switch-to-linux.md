+++
date = '2024-11-21T18:46:31+08:00'
title = "开始使用Linux桌面"
description = "最近在windows下写代码的时候遇到了在win11 derive(ReFS)下rustc随机导致蓝屏重启的问题, 于是受不了想换linux写代码..."
tags = ["linux", "开发"]
+++

![img](/342834244b15aab7e34a4c3a0cb60d9e.webp)

首先,得先找个硬盘装linux, 我在之前坏掉的轻薄本上拆下来一根512G的金士顿的nvme, 然后用m.2 to pcie卡. 所幸之前换pc的时候考虑到了以后拓展, 买了张二手x470,
有足足3个x16, 1个x1插槽(当然不全是满速, 2,3槽好像只是x8速度).

### Archlinux
发行版的选择上, 我倾向于用上最新的东西, 于是选择了archlinux, 不过是第一次装arch, 免不得折腾.

掏出了古董8g usb2 u盘, 写入, 重启. 由于一开始不知道使用archlinuxcn仓库, 傻乎乎的在tty里跟gfw拉扯, 那天我直接把arch清华源的地址背了下来(哭

### 桌面环境
> 1天后

作为一个萌新, 我当然是选择一套现成的de来用. 一开始试了试hyprland+某套dotfiles, 但是实在是用不惯平铺布局, 平铺布局大概适合喜欢用双手操作键盘的人,
我的习惯是不敲代码的时候右手长期控制鼠标, 左手放wasd位置, 这意味着我对只能按到键盘1/3的键, 而平铺布局我的感觉是非常非常依赖快捷键的.
而且我习惯快速alt+tab切窗口, 已经完全是堆叠布局的形状了(x

### Gnome & KDE
ok, 那么我反手就是一个`paru -S gnome`. 字体配置就不多说了,linux的中文字体渲染都发虚.

但是在linuxqq上我遇到了输入法问题, 那就是因为gnome wayland不支持text-input-v1, 导致在chromium里没法使用输入法, 而chromium其实是支持text-input-v3的,
但是(又!), 由于不知道什么神奇原因, 同样的参数我到第二天再开机, 突然又用不了输入法了, 忍无可忍, 只好换kde了. (Kwin和hyprland都支持text-input-v3)

`paru -Rcs gnome`!

在使用体验上, 我认为kde要比gnome更舒服点, 甚至支持hdr, 但是我把显卡驱动从beta的xe驱动切换到老的i915驱动之后, hdr功能就消失了.
但是6.12内核intel好像是把xe驱动设置成默认了, 也不急这一个星期, 我就老老实实等arch更新吧.

kde还有一个"黑科技", 就是有默认的小部件来设置屏幕亮度(外接屏幕), 而且并不是通过硬件驱动来设置屏幕亮度, 因为我屏幕的亮度设置没有变.

而这个功能我已经很久没在linux上见过了, 不管是fedora,ubuntu还是直接装gnome,hyprland, 都没有办法设置屏幕亮度.
而我记得在16, 17年那会我装过ubuntu,deepin,manjaro等等都是可以设置屏幕亮度的, 到底是我记忆出现错误了, linux一直都没这个功能还是怎么样, 我就bzd了. (我在win上是开autohdr然后改sdr亮度滑条的)

总之, 如果没有更改亮度的功能, 我就必须用更改屏幕驱动的亮度, 这样就造成我切换回windows系统还得重新慢慢按物理按键, 这是完全不可接受的.(屏幕菜单键: 我光速去世)

> tips:
>
> 在linux可以使用`ddcutil setvcp 10 <num>`来更改屏幕驱动亮度, 需要在内核中启用i2c-dev模块. (正常内核中已自带)

### 终端
终端我一开始使用的是[foot](https://codeberg.org/dnkl/foot), 后面换成了[alacritty](https://github.com/alacritty/alacritty).

其实两款大差不差, 但是我感觉alacritty稍微更流畅, 配置文件改起来也舒服, 而且还是Rust写的, 狠狠的使用.

### 编辑器
我尝试了[zed](https://github.com/zed-industries/zed), 很快, 好看, 配置方便, 轻量级. 但是---我习惯功能更强的vsc, 所以我干脆使用zed来当文本编辑器用,
用来编辑配置文件, shell脚本, 博客等等写代码以外的用途, 使用vsc来写代码.

# 期望Cosmic-epoch
[Cosmic](https://github.com/pop-os/cosmic-epoch)是一个DE(desktop environment), 它是为`Pop!_OS`做的, 但是也能单独在其他发行版中使用,
是用Rust开发的, iced做ui. (你的pc里爬满了螃蟹)

它的界面非常好看(符合我的口味), 应用开发也简单, 可以切换堆叠/平铺布局, 但是还在开发, 很难日常使用. (包括有不少bug, 功能不够多, 出问题了也很难跟其他成熟的de一样找到支持).

如果能保持开发, 过几年或许就是一个非常好看的也勉强能用的东西了!

目前cosmic包含一些小组件, 托盘, 通知守护进程, 终端仿真器, 文件管理器, 文本编辑器, 和一个基于flathub的应用商店.

![img](/34762b3c41ef3fd332383fe5462fc9e5.webp)
![img](/bade0469e5a5b58764eefacd1b194ebf.webp)
