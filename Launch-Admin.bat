@echo off
setlocal
cd /d "%~dp0"
title CoreLink

set "CSC="
if exist "%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe" set "CSC=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe"
if not defined CSC if exist "%WINDIR%\Microsoft.NET\Framework\v4.0.30319\csc.exe" set "CSC=%WINDIR%\Microsoft.NET\Framework\v4.0.30319\csc.exe"

if not defined CSC (
  echo Windows C# compiler not found.
  pause
  exit /b 1
)

echo Building CoreLink.exe ...
"%CSC%" /nologo /t:winexe /platform:x86 /optimize+ /out:"%~dp0CoreLink.exe" /r:System.dll /r:System.Core.dll /r:System.Windows.Forms.dll /r:System.Drawing.dll "%~dp0CoreLink.cs"
if errorlevel 1 (
  echo Build failed.
  pause
  exit /b 1
)

powershell -NoProfile -Command "Start-Process -FilePath '%~dp0CoreLink.exe' -Verb RunAs"
