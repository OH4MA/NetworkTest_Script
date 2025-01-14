#!/bin/bash

# 檢查 Python 是否安裝
if ! command -v python3 &>/dev/null; then
    echo "Python3未安裝，可依照作業系統使用以下指令安裝:"
    echo "1. Debian/Ubuntu: sudo apt update && sudo apt install python3"
    echo "2. CentOS/Red Hat: sudo yum install python3"
    echo "3. macOS (使用HomeBrew): brew install python3"
    exit 1
fi

echo "Python3已安裝"

# 檢查 pip 是否安裝
if ! command -v pip3 &>/dev/null; then
    echo "pip3未安裝，正在安裝pip3..."
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3
fi

# 檢查並安裝必要的依賴項
REQUIRED_PACKAGES=(requests tqdm speedtest-cli)
for PACKAGE in "${REQUIRED_PACKAGES[@]}"; do
    if ! python3 -m pip show "$PACKAGE" &>/dev/null; then
        echo "正在安裝 $PACKAGE..."
        python3 -m pip install "$PACKAGE"
    else
        echo "$PACKAGE 已安裝"
    fi
done

# 線上執行 Python 腳本
URL="https://raw.githubusercontent.com/OH4MA/NetworkTest_Script/main/networktest.py"

if ! curl -sL "$URL" | python3 -; then
    echo "無法執行 Python 網路測試腳本"
    exit 1
fi
