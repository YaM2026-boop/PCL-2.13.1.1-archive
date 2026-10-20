@echo off
chcp 936>nul
title 锁定 PCL 更新（防止升级到 2.99）
set "EXE=%~dp0Plain Craft Launcher 2.exe"
if not exist "%EXE%" (
    echo [错误] 没找到 Plain Craft Launcher 2.exe
    echo 请把本文件放到与 PCL 相同的文件夹后再运行。
    pause
    exit /b 1
)
attrib +R "%EXE%"
if errorlevel 1 (
    echo [错误] 设置只读失败
    pause
    exit /b 1
)
echo.
echo 已锁定。PCL 无法被更新覆盖，版本将保持在：
powershell -NoProfile -Command "(Get-Item '%EXE%').VersionInfo.FileVersion"
echo.
echo 想恢复更新：右键 exe - 属性 - 取消勾选"只读"。
pause