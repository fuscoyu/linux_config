# WSL2

- [WSL2](#wsl2)
  - [Windows](#windows)
    - [安装wsl2](#安装wsl2)
    - [常用软件](#常用软件)
  - [Ubuntu 20.04](#ubuntu-2004)
    - [安装snap](#安装snap)
  - [FAQ](#faq)
    - [clipboard: error invoking win32yank.exe](#clipboard-error-invoking-win32yankexe)
    - [chrome 解锁10080端口](#chrome-解锁10080端口)
    - [wsl占用内存](#wsl占用内存)

在换工作期间，通过学习PegasusWang 玩转vim。喜欢上了vim插件和快捷键。这里记录我在Windows+wsl2(windows subsystem for linux)开发环境的搭建过程，方便我重新构建环境。（主要是我怕忘）

## Windows

### 安装wsl2

[官方文档](https://docs.microsoft.com/en-us/windows/wsl/install)

以下是摘录出来的内容，在Windows终端上以管理员执行即可。

``bash
# install wsl
wsl --install
# enable wsl2
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# download wsl2 kernel update
https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
# setting wsl2 as default 
wsl --set-default-version 2
# subsystem list
wsl -l -v

``

可以通过Micorsoft store 搜索下载Ubuntu20.04

### 常用软件

1. [Ditto](https://ditto-cp.sourceforge.io/)

    ditto 是window剪贴板的拓展工具。你可以将一些内容复制到剪贴板中，方便日后查看。
2. [Wox](https://github.com/Wox-launcher/Wox/releases)

    快速搜索工具，应用于windows平台，alfred替代品。
3. Everything

4. [wsltty](https://github.com/mintty/wsltty)

    目前我认为最好用的终端。启动快，中文输入不卡顿。
5. [7zip](https://www.7-zip.org/download.html)

    解压和压缩工具
6. [notion](https://www.notion.so/desktop)

7. [postman](https://www.postman.com/downloads/)

## Ubuntu 20.04

打开wsltty 安装以下软件
- tmux
- neovim
- zsh
- commitizen
- mycli
- tldr
- unzip
- mlocate
- ctags
- python3-pip

``bash
# apt
sudo apt install -y tmux ctags neovim python3-neovim python3-pip unzip mlocate zsh

# coc.vim
curl -sL install-node.vercel.app/lts | sudo bash

# pip
pip install commitizen mycli tldr

# 下载MesloLGS字体
# https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
MesloLGS NF Regular.ttf
MesloLGS NF Bold.ttf
MesloLGS NF Italic.ttf
MesloLGS NF Bold Italic.ttf

# 安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zplug
$ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# p10k themer
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# nvim + tmux + wsl2 复制到系统剪贴板
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/

``

### 安装snap

[Using snapd in WSL2](https://discourse.ubuntu.com/t/using-snapd-in-wsl2/12113)

[Install shfmt on Ubuntu using the Snap Store | Snapcraft](https://snapcraft.io/install/shfmt/ubuntu#install)

``bash

sudo apt update
sudo apt install snapd
sudo apt-get update && sudo apt-get install -yqq daemonize dbus-user-session fontconfig 

sudo daemonize /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --system-unit=basic.target
exec sudo nsenter -t $(pidof systemd) -a su - $LOGNAME

$ snap version
snap    2.51.3
snapd   2.51.3
series  16
ubuntu  20.04
kernel  5.10.16.3-microsoft-standard-WSL2

# 安装shfmt
sudo snap install shfmt

``

## FAQ

### clipboard: error invoking win32yank.exe

Windows缺少运行库导致的(网上有很多)

### chrome 解锁10080端口

右键——属性——目标
`“C:\Program Files (x86)\Google\Chrome\Application\chrome.exe” –explicitly-allowed-ports=10080`

### wsl占用内存

原文出自: https://zhuanlan.zhihu.com/p/345645621

新建文件.wslconfig `C:\Users\xxx\.wslconfig`

``bash
[wsl2]
processors=8
memory=8GB
swap=8GB
localhostForwarding=true
``
