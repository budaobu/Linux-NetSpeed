@ECHO OFF & PUSHD %~DP0 & TITLE �̻�
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

regsvr32 /s Bin\TXSSO\Npchrome\npactivex.dll

regsvr32 /s Bin\TXSSO\Bin\SSOCommon.dll
regsvr32 /s Bin\TXSSO\Bin\npSSOAxCtrlForPTLogin.dll

regsvr32 /s Plugin\Com.Tencent.NetDisk\Bin\QQDisk\Bin\TXFTNActiveX.dll

:: ֧��tencentЭ��
if exist Bin\Timwp.dll regsvr32  /s Bin\Timwp.dll
if exist Bin\AppCom.dll regsvr32 /s Bin\AppCom.dll
if exist Bin\TXPFProxy.dll regsvr32 /s Bin\TXPFProxy.dll
if exist Bin\KernelUtil.dll regsvr32 /s Bin\KernelUtil.dll
if exist Bin\TXPlatform.exe Bin\TXPlatform.exe /RegServer
if exist Bin\QQExternal.exe Bin\QQExternal.exe /SetupRegister

if "%PROCESSOR_ARCHITECTURE%"=="x86" reg add HKLM\Software\Tencent\TIM /f /v Install /d "%~dp0\" >NUL
if "%PROCESSOR_ARCHITECTURE%"=="x86" reg add HKLM\Software\Tencent\TIM /f /v version /d "55.37.0.22747.0" >NUL
If "%PROCESSOR_ARCHITECTURE%"=="AMD64" reg add HKLM\Software\Wow6432Node\Tencent\TIM /f /v Install /d "%~dp0\" >NUL
If "%PROCESSOR_ARCHITECTURE%"=="AMD64" reg add HKLM\Software\Wow6432Node\Tencent\TIM /f /v version /d "55.37.0.22747.0" >NUL

CLS & ECHO.&ECHO.�̻����! �Ƿ񴴽������ݷ�ʽ��
CLS & ECHO.&ECHO.���밴����������ֱ�ӹرմ��ڣ�&PAUSE >NUL 2>NUL
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\��ѶTIM.lnk""):b.TargetPath=""%~dp0Bin\TIM.exe"":b.WorkingDirectory=""%~dp0"":b.Save:close")
CLS & ECHO.&ECHO ������ɣ��˳����������&PAUSE >NUL 2>NUL & EXIT