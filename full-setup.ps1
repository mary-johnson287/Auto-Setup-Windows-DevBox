# 🔧 VSCode Install
Invoke-WebRequest -Uri "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -OutFile "$env:TEMP\vscode.exe"
Start-Process -FilePath "$env:TEMP\vscode.exe" -ArgumentList "/silent" -Wait

# 🔧 AnyDesk Install
Invoke-WebRequest -Uri "https://download.anydesk.com/AnyDesk.exe" -OutFile "$env:TEMP\AnyDesk.exe"
Start-Process "$env:TEMP\AnyDesk.exe" -ArgumentList "--install", "C:\Program Files (x86)\AnyDesk\", "--start-with-win", "--silent" -Wait

# 🔐 Set AnyDesk Password and Enable Unattended Access
$anydeskPath = "HKLM:\SOFTWARE\AnyDesk"
New-Item -Path $anydeskPath -Force | Out-Null
Set-ItemProperty -Path $anydeskPath -Name "Password" -Value ([System.Text.Encoding]::UTF8.GetBytes("Sumit@123") | ForEach-Object { $_ }) -Type Binary
Set-ItemProperty -Path $anydeskPath -Name "AllowUnattendedAccess" -Value 1 -Type DWord
Set-ItemProperty -Path $anydeskPath -Name "AlwaysShowAcceptWindow" -Value 0 -Type DWord

# 🔑 Enable RDP Access
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# 🔥 Allow AnyDesk in Firewall
New-NetFirewallRule -DisplayName "Allow AnyDesk" -Direction Inbound -Program "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" -Action Allow -Enabled True

# 📡 Show AnyDesk ID (Optional)
Start-Sleep -Seconds 5
$anydeskID = Get-Content "C:\ProgramData\AnyDesk\service.conf" | Select-String "ad.anynet.id" | ForEach-Object { $_ -replace ".*=", "" }
Write-Host "`n🆔 AnyDesk ID: $anydeskID" -ForegroundColor Cyan
Write-Host "🔑 Password: Sumit@123" -ForegroundColor Yellow

# ✅ Finish
Write-Host "`n✅ All Done! VSCode + AnyDesk + RDP Ready!" -ForegroundColor Green
