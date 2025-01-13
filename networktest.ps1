# Windows PowerShell Script

# 檢查 Python 是否安裝
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "Python沒有安裝，可以按照以下方法進行安裝："
    Write-Host "1. 前往 https://www.python.org/downloads/ 下載並安裝最新版本的 Python。"
    Write-Host "2. 確保在安裝過程中勾選 'Add Python to PATH' 選項。"
    exit 1
}

Write-Host "Python已安裝."

# 檢查 pip 是否安裝
if (-not (Get-Command pip -ErrorAction SilentlyContinue)) {
    Write-Host "正在安裝pip..."
    Invoke-WebRequest -Uri https://bootstrap.pypa.io/get-pip.py -OutFile get-pip.py
    python get-pip.py
    Remove-Item -Force get-pip.py
}

# 檢查 tqdm 是否安裝
if (-not (python -m pip show tqdm -ErrorAction SilentlyContinue)) {
    Write-Host "正在安裝tqdm..."
    python -m pip install tqdm
} else {
    Write-Host "tqdm已安裝"
}

# 檢查 speedtest-cli 是否安裝
if (-not (python -m pip show speedtest-cli -ErrorAction SilentlyContinue)) {
    Write-Host "正在安裝speedtest-cli..."
    python -m pip install speedtest-cli
} else {
    Write-Host "speedtest-cli已安裝"
}

# 執行 python測試網路腳本
$URL = "https://raw.githubusercontent.com/OH4MA/NetworkTest_Script/main/networktest.py"

try {
    Invoke-WebRequest -Uri $URL -OutFile networktest.py
    python networktest.py
    Remove-Item -Force networktest.py
} catch {
    Write-Host "無法執行網路測試腳本。請檢查網路環境"
    exit 1
}
