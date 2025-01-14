# 檢測操作系統
$IsWindows = $IsMacOS = $IsLinux = $false

if ($PSVersionTable.OS -like "*Windows*") {
    $IsWindows = $true
    $PythonCommand = "python"
} elseif ($PSVersionTable.OS -like "*Darwin*") {
    $IsMacOS = $true
    $PythonCommand = "python3"
} else {
    $IsLinux = $true
    $PythonCommand = "python3"
}

# 檢查 Python 是否安裝
if (-Not (Get-Command $PythonCommand -ErrorAction SilentlyContinue)) {
    Write-Host "未找到 $PythonCommand，請根據作業系統安裝 Python。"
    Write-Host "1. Windows: 從 https://www.python.org/ 下載並安裝 Python"
    Write-Host "2. macOS/Linux: 請執行系統相關的安裝命令 (如: brew install python3)"
    Exit 1
}

Write-Host "$PythonCommand 已安裝"

# 檢查 pip 是否安裝
if (-Not (Get-Command pip3 -ErrorAction SilentlyContinue)) {
    Write-Host "pip 未安裝，正在安裝 pip..."
    Invoke-WebRequest -Uri "https://bootstrap.pypa.io/get-pip.py" -OutFile "get-pip.py"
    & $PythonCommand get-pip.py
    Remove-Item "get-pip.py"
} else {
    Write-Host "pip 已安裝"
}

# 檢查並安裝必要的依賴項
$RequiredPackages = @("requests", "tqdm", "speedtest-cli")
foreach ($Package in $RequiredPackages) {
    $PackageCheck = & $PythonCommand -m pip show $Package
    if (-Not $PackageCheck) {
        Write-Host "正在安裝 $Package..."
        & $PythonCommand -m pip install $Package
    } else {
        Write-Host "$Package 已安裝"
    }
}

# 線上執行 Python 腳本
$URL = "https://raw.githubusercontent.com/OH4MA/NetworkTest_Script/main/networktest.py"
try {
    Invoke-WebRequest -Uri $URL -OutFile "networktest.py"
    & $PythonCommand networktest.py
    Remove-Item "networktest.py"
} catch {
    Write-Host "無法執行 Python 網路測試腳本"
    Exit 1
}
