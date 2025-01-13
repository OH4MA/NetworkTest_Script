#!/bin/bash

# 檢查 Python 是否安裝
if ! command -v python3 &>/dev/null; then
    echo "Python沒有安裝 可以執行以下指令來安裝"
    echo "1. Debian/Ubuntu: sudo apt update && sudo apt install python3"
    echo "2. CentOS/Red Hat: sudo yum install python3"
    echo "3. macOS (using Homebrew): brew install python3"
    exit 1
fi

echo "Python已安裝."

# 檢查 pip 是否安裝
if ! command -v pip3 &>/dev/null; then
    echo "正在安裝pip..."
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3
fi

# 檢查 tqdm 是否安裝
if ! python3 -m pip show tqdm &>/dev/null; then
    echo "正在安裝tqdm..."
    python3 -m pip install tqdm
else
    echo "tqdm已安裝"
fi

# 檢查 speedtest-cli 是否安裝
if ! python3 -m pip show speedtest-cli &>/dev/null; then
    echo "正在安裝speedtest-cli..."
    python3 -m pip install speedtest-cli
else
    echo "speedtest-cli已安裝"
fi

# 執行 networktest.py
URL="https://raw.githubusercontent.com/OH4MA/NetworkTest_Script/main/networktest.py"

if ! curl -sL "$URL" | python3 -; then
    echo "無法執行網路測試腳本。請檢查網路環境"
    exit 1
fi
