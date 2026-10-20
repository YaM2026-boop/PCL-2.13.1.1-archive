# PCL 2.13.1.1 发布文件校验
# 用法：右键 -> 使用 PowerShell 运行；或在终端里 .\验证.ps1
# 作用：确认你下载到的 exe 与本仓库声明的官方原版完全一致（未被修改/投毒）

$ErrorActionPreference = "Stop"
$Expected = "30EB93C62FC51EDE0898648E67455478A3D5A4F279938AE65AEC77B84CB9703F"
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path
$Exe  = Join-Path $Here "Plain Craft Launcher 2.exe"

Write-Host ""
Write-Host "=== PCL 2.13.1.1 校验 ===" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path $Exe)) {
    Write-Host "[×] 没找到 Plain Craft Launcher 2.exe" -ForegroundColor Red
    Write-Host "    请把它和本脚本放在同一文件夹。" -ForegroundColor Yellow
    Read-Host "按回车退出"
    exit 1
}

$f = Get-Item $Exe
$hash = (Get-FileHash $Exe -Algorithm SHA256).Hash
$sig  = (Get-AuthenticodeSignature $Exe).Status
$ver  = $f.VersionInfo.FileVersion
$size = $f.Length

Write-Host ("文件大小   : {0:N0} 字节" -f $size)
Write-Host ("文件版本   : {0}" -f $ver)
Write-Host ("数字签名   : {0}" -f $sig)
Write-Host ("你的 SHA256: {0}" -f $hash)
Write-Host ("官方 SHA256: {0}" -f $Expected)
Write-Host ""

$ok = $true
if ($hash -ne $Expected) { $ok = $false; Write-Host "[×] 哈希不一致！文件被修改过，或下载损坏。" -ForegroundColor Red }
if ($ver   -ne "2.13.1.1") { $ok = $false; Write-Host "[×] 版本号不是 2.13.1.1" -ForegroundColor Red }
if ($size  -ne 5750272)    { $ok = $false; Write-Host "[×] 文件大小不对" -ForegroundColor Red }

if ($ok) {
    Write-Host "[√] 校验通过：与官方 2.13.1.1 原版逐字节一致。" -ForegroundColor Green
    Write-Host ""
    Write-Host "说明：PCL 官方版本本来就没有数字签名（NotSigned），" -ForegroundColor DarkGray
    Write-Host "      这是原版特征，不是可疑迹象。" -ForegroundColor DarkGray
} else {
    Write-Host ""
    Write-Host "[!] 不要运行这个文件。请从 Release 重新下载。" -ForegroundColor Red
}

Write-Host ""
Read-Host "按回车退出"
if ($ok) { exit 0 } else { exit 1 }