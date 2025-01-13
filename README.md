# 網路測試腳本
短時間測太多次會被SpeedTest暫時拒絕訪問 但Ping測試依舊可用

**Linux/MacOS**
```
curl -sL https://raw.githubusercontent.com/Oh4ma/NetworkTest_Script/main/networktest.sh | bash
```

**Windows Powershell/或Linux和MacOS的Powershell**
```
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Oh4ma/NetworkTest_Script/main/networktest.ps1" -UseBasicParsing).Content
```

Powered by Google Cloud Platform and  Ookla Speedtest

Made by LIU MIN KAI
