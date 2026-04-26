#!/bin/bash

# Proton 路径
PROTON_BIN="$HOME/.local/share/Steam/compatibilitytools.d/dwproton-10.0-14/proton"

# 游戏路径
GAME_EXE="$HOME/share/WutheringWaves/Wuthering Waves bilibili/Wuthering Waves Game/Client/Binaries/Win64/Client-Win64-Shipping.exe"

# steam 游戏目录路径
export STEAM_COMPAT_DATA_PATH="$HOME/.local/share/Steam/steamapps/compatdata/3139039821"
export STEAM_COMPAT_CLIENT_INSTALL_PATH="$HOME/.local/share/Steam"

export SteamAppId="3139039821"
export SteamGameId="3139039821"

# 环境变量
# export STEAMDECK=1
export MANGOHUD=1
export DXVK_ASYNC=1

# FSR 缩放设置
export WINE_FULLSCREEN_FSR=1
# 加入锐化强度控制(0最锐-5最柔)
export WINE_FULLSCREEN_FSR_STRENGTH=2
export WINE_FULLSCREEN_FSR_CUSTOM_MODE="1600x1000"

# 定义 Steam 内部自带的 Runtime 脚本路径
STEAM_RUNTIME_SCRIPT="$HOME/.local/share/Steam/ubuntu12_32/steam-runtime/run.sh"

GAME_ARGS="-ResX=1600 -ResY=1000 -fullscreen"

echo "正在启动鸣潮..."

# 检查脚本是否存在，并将 GAME_ARGS 传递给游戏进程
if [ -f "$STEAM_RUNTIME_SCRIPT" ]; then
  echo "已找到 Steam Runtime，正在启动..."
  "$STEAM_RUNTIME_SCRIPT" gamemoderun "$PROTON_BIN" run "$GAME_EXE" $GAME_ARGS
else
  echo "警告：未找到 Steam Runtime，过场动画可能黑屏"
  gamemoderun "$PROTON_BIN" run "$GAME_EXE" $GAME_ARGS
fi
