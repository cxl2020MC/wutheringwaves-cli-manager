
<div align="center"><h1>WutheringWaves CLI Manager</h1><h3>鸣潮命令行管理器</h3><div align="center">
  <a href="https://python.org"><img src="https://img.shields.io/badge/Python-3.9%2B-blue.svg" alt="Python 3.9+"></a>&nbsp;<a href="https://github.com/astral-sh/uv"><img src="https://img.shields.io/badge/Tool-uv-purple.svg" alt="uv"></a>&nbsp;<img src="https://img.shields.io/badge/Version-2.0-brightgreen.svg" alt="version 2.0">
</div>
</div>

<div align="center" style="width: 80%;">
    <div style="display: flex; justify-content: space-between; align-items: flex-start; width: 80%;">
        <img src="https://cdn.jsdelivr.net/gh/timetetng/Pic-Bed@main/ww-example1.png" alt="徽章" style="width: 40%; height: auto;">
        <img src="https://cdn.jsdelivr.net/gh/timetetng/Pic-Bed@main/ww-example2.png" alt="命令行预览" style="width: 40%; height: auto;">
    </div>
</div>




专为 Linux 用户打造的《鸣潮》客户端命令行管理工具。
结合了 **完整的下载/校验功能** 与 **秒级服务器切换** 技术。一旦完成“烘焙”，即可在官服 (CN)、B服 (Bilibili) 之间瞬时切换，无需重新下载庞大的游戏文件。

> **国际服因为包体差异不支持快速切换**。
>
> 最新版本经过测试，兼容 Windows11。


## 🔥 预下载

🚧 正在测试中

`feat/predownload` 分支为待验证的分支，提供全量预下载功能，使用前请确保您了解自己在做什么；

增量更新因技术有限未能实现，欢迎PR🙏！


## ✨ 核心功能

* **🚀 秒级切换 (`checkout`)**：利用 MD5 快速校验，仅替换差异文件，在不同服务器间瞬间切换。
* **🛠️ 智能修复 (`sync`)**：校验全量文件 MD5，自动修复损坏文件，下载缺失资源。
* **📦 完整下载 (`download`)**：从零开始下载任一服务器的纯净客户端。
* **💾 自动记忆**：自动记录游戏路径，一次设置，永久生效。
* **⚡️ 现代化 CLI**：基于 `Typer` 构建，支持自动补全和帮助信息。
* **👯 并行下载**: 使用多线程并行下载，避免 CDN 节点降速，支持断点续传。

## 🔧 安装指南

本工具推荐使用 [uv](https://github.com/astral-sh/uv) 进行安装和管理。

### 1. 安装 uv (如果尚未安装)

- Linux
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
````

- Windows
```pwsh
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

> 安装完需要**重启终端**应用环境变量。


### 2\. 安装本工具

- **方式一: 从本地源码构建**

  克隆仓库代码到本地
  ```shell
  git clone https://github.com/timetetng/wutheringwaves-cli-manager.git
  cd wutheringwaves-cli-manager
  ```

  在源码目录下执行：

  ```bash
  uv tool install .
  ```

- **方式二: 从远程构建**

  终端直接输入:

  ```bash
  uv tool install git+https://github.com/timetetng/wutheringwaves-cli-manager
  ```

- **方式三: 从 PyPI 源安装**

  ```bash
  uv tool install ww-manager
  ```

安装完成后，你就可以在终端的任意位置直接使用 **`ww`** 命令了！

### 3\. 更新/卸载

- **更新工具**

  - 从本地源码构建安装:
    ```bash
    # 从本地源码构建，更新时需拉取最新源码
    git pull
    # 在源码目录下执行，重新构建工具
    uv tool install . --force
    ```

  - 远程或 PyPI 安装:

    ```bash
    uv tool upgrade ww-manager
    ```

- **卸载工具**

  ```bash
  uv tool uninstall ww-manager
  ```


## 📖 使用说明

### 首次运行

第一次运行时，你需要指定游戏路径（只需指定一次，后续会自动记忆）：

```bash
# 创建安装目录(如果你还没有创建游戏目录)
mkdir -p "$HOME/Games/WutheringWaves"
# 初始化路径
ww -p "$HOME/Games/WutheringWaves" status
```

> `-p`、`--path` 参数用于指定安装路径。

### 常用命令

#### 1\. 查看状态 (`status`)

检查当前游戏目录属于哪个服务器，以及版本号。

```bash
ww status
```

#### 2\. 快速切换服务器 (`checkout`)

这是最常用的功能。**秒级**切换服务器（仅限官/b服）。

```bash
# 切换到 Bilibili 服
ww checkout bilibili

# 切换到 官服
ww checkout cn

# 切换到 国际服（需要完整下载）
ww checkout global
```

> **注意**：如果切换后提示“文件缺失”，请运行 `ww sync` 进行下载修复。
>
> v2.0 开始，将会自动校验并补全文件, `--force-sync` 仅用于需要时，手动强制同步。

#### 3\. 同步与修复 (`sync`)

**每次游戏版本更新后**，或者切换服务器后发现文件缺失时使用。它会联网校验所有文件并下载更新。

```bash
ww sync
```

#### 4\. 下载完整客户端 (`download`)

如果你还没有游戏，可以使用此命令从零开始下载。

```bash
# 下载完整的官服客户端到当前目录（或配置的默认目录）
ww download cn
```

#### 5\. 获取抽卡记录链接 (`log`)

可以一键获取抽卡链接，用于导入小程序或者鸣潮机器人。

```bash
# 使用前需点开 唤取-唤取记录 以更新日志文件
ww log
```

> `-o`、`--open`: 获取链接并跳转打开。

## 💡 最佳实践：如何打造“全家桶”

要实现完美的秒级切换，你需要下载共用的游戏本体到一个目录中。

1. **下载基础客户端**：
    如果你还没有游戏，先下载一个完整的（例如官服）：

    ```bash
    ww --path "/path/to/Game" download cn
    ```

2. **“烘焙”其他服务器**：
    现在切换到 B 服，并强制执行同步来下载 B 服独有的文件：

    ```bash
    ww checkout bilibili
    ```

3. **享受切换**：
    现在你已经拥有了“全家桶”。

      * 想玩官服 -> `ww checkout cn`
      * 想玩B服 -> `ww checkout bilibili`
      * 版本更新 -> `ww sync`

## 🎮 启动游戏 (Linux)

本工具仅负责文件管理。启动游戏推荐使用 Steam + Proton。

如果你熟悉 Linux，你可以参考项目中的 `run_ww.sh` 脚本并添加 .desktop 文件绕过 Steam 启动，或者按照以下步骤通过 Steam 启动：

1. **Steam 设置**：

      * 添加“非 Steam 游戏”，指向 `安装目录/Client/Binaries/Win64/Client-Win64-Shipping.exe`。
      * 在兼容性中强制使用 `GE-Proton` 或 `dwproton` (如果 ACE 警告频繁请尝试切换 proton)

2. **启动参数**：
    在 Steam 启动选项中添加：

    ```bash
    steamdeck=1
    ```

## 常见问题

以下是已知常见问题和社区提供的解决方案，由于 Linux 用户环境各异，仅供参考：

Q1: 被 ACE 反作弊警告下线如何解决？
A: 使用 `dwprton` 或添加环境变量 `steamdeck=1`，能有效减少被检测次数，但是无法完全杜绝。另有社区提到使用卡拉彼丘 ACE 替换原本的 ACE，此方法未验证，可自行研究。

Q2: 上线 10 分钟就被踢下线，需要重新登录，怎么办？
A: 依旧是环境问题，通过部分方式启动游戏的会出现此问题，可以尝试换另一种方式启动。官服可以尝试 bilibili 用户 @神麤詭末 提到的方案: 
把`安装目录/Client/Binaries/Win64/ThirdParty/KrPcSdk_Mainland/KRSDKRes/KRSDKConfig.json`, 把字段 `KR_ChannelId`从官服的 19 改成 steam 的 205 就不会被踢，启动时会弹出网络错误，点击重试即可，此方法 bilibili 服无法使用。
**修改前最好备份以免出错无法修复！**

Q3: 出现剧情文本错误或素材缺失如何解决？
A: 优先执行 `ww sync`，若仍有问题则不在游戏本体，可能是启动方式或系统环境问题，请多尝试不同启动方式和桌面环境等。

Q4: 执行 `ww sync`/`ww download`/`ww checkout` 等需要联网下载的命令时，卡在请求界面一直不动怎么办？
A: 本项目使用的所有下载源均为官方启动器的国内 CDN 源，无需代理。如果无法访问则可能是本地网络异常或代理环境变量未清理干净。高峰期或网络不佳偶尔卡顿正常，请耐心等待 3-5 分钟，若进度条不出现，则确定网络异常，需要更换网络环境重试。

如遇到其他问题，请**提交 issue**，同时欢迎 **PR** 一些问题及解决方案。

## 致谢

感谢以下优秀项目：

* [WutheringWavesTool](https://github.com/leck995/WutheringWavesTool)
* [LutheringLaves](https://github.com/last-live/LutheringLaves)
* [Wuthering-Waves-Official-Bilibili](https://github.com/Hurry1027/Wuthering-Waves-Official-Bilibili)
* [GE-Proton](https://github.com/GloriousEggroll/proton-ge-custom/releases/): 下载最新版本的 `GE-Proton` 并解压到 `~/.local/share/Steam/steamapps/common/` 目录下，启动 Steam，在**属性-兼容性**中能找到下载的 `GE-Proton` 即说明配置成功。
* [dwproton](https://dawn.wine/dawn-winery/dwproton/releases): 安装方式同上

<!-- end list -->

### 接下来该做什么？

如果有任何报错或者建议，随时通过 **issue** 告诉我！
