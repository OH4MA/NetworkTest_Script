# NetworkTest_Script

短時間測太多次會被SpeedTest暫時拒絕訪問 但Ping測試依舊可用

**Linux/MacOS**
```
curl -sL https://gist.githubusercontent.com/Oh4ma/7babd9f0dfd7ac26cd8f639821a93d70/raw/42b0fd4b1078a3e49deb10b63a4e621b85474d40/networktest.sh | bash
```

**Windows Powershell/或Linux和MacOS的Powershell**
```
Invoke-Expression (Invoke-WebRequest -Uri "https://gist.githubusercontent.com/Oh4ma/eb6bd91b6544057745795cecda0c05e1/raw/50dc5536f5f9fa1f1ece53f9909d60bc9e74fc3f/networktest.ps1" -UseBasicParsing).Content
```

Powered by Google Cloud Platform and  Ookla Speedtest
Made by LIU MIN KAI
