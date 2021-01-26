Set-ExecutionPolicy Bypass -Scope Process -Force

Invoke-WebRequest -Uri "https://stlcpimagebuilder.blob.core.windows.net/public/setup.exe" -OutFile "C:\temp\setup.exe"

Invoke-Command -ScriptBlock {& C:\temp\setup.exe}
do {
    $SymantecStatus = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Symantec Endpoint Protection"}
    Start-Sleep -Seconds 15
} Until ($SymantecStatus -ne $Null)
