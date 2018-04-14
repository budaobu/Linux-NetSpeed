@ECHO OFF & PUSHD %~DP0 & TITLE
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

taskkill /f /im TIM* >NUL 2>NUL
taskkill /f /im TXP* >NUL 2>NUL
taskkill /f /im tad* >NUL 2>NUL
taskkill /f /im QQP* >NUL 2>NUL
taskkill /f /im QQC* >NUL 2>NUL
taskkill /f /im QQ.exe >NUL 2>NUL

rd/s/q "%AppData%\Tencent\TIM"  2>NUL

rd/s/q "%UserProfile%\Documents\Tencent"   2>NUL
rd/s/q "%UserProfile%\My Documents\Tencent"2>NUL

regsvr32 /s /u Bin\TXSSO\Npchrome\npactivex.dll
regsvr32 /s /u Bin\TXSSO\Bin\SSOCommon.dll
regsvr32 /s /u Bin\TXSSO\Bin\npSSOAxCtrlForPTLogin.dll
if exist Bin\Timwp.dll regsvr32 /s /u Bin\Timwp.dll
if exist Bin\AppCom.dll regsvr32 /s /u Bin\AppCom.dll
if exist Bin\CPHelper.dll regsvr32 /s /u Bin\CPHelper.dll
if exist Bin\TXPFProxy.dll regsvr32 /s /u Bin\TXPFProxy.dll
if exist Bin\KernelUtil.dll regsvr32 /s /u Bin\KernelUtil.dll
if exist Bin\TXPlatform.exe Bin\TXPlatform.exe /UnregServer
regsvr32 /s /u Plugin\Com.Tencent.NetDisk\Bin\QQDisk\Bin\TXFTNActiveX.dll

reg delete HKCU\Software\Tencent\TIM /F  >NUL 2>NUL
reg delete HKLM\Software\Tencent\TIM /F  >NUL 2>NUL
reg delete HKLM\Software\Wow6432Node\Tencent\TIM /F>NUL 2>NUL

CLS && ECHO.&ECHO 卸载完成，任意键退出！ &&PAUSE >NUL & EXIT