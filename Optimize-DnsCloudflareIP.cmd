@Echo Off
Rem PS1 脚本启动器
Rem PS1 文件不能直接运行，所以需要启动器
Rem 使用参数 Minimized 最小化模式启动
Rem 使用参数 Hidden 隐藏模式启动
Rem 其它参数会传递给 PS1 脚本
Title %~n0
CD /D "%~dp0"
SetLocal EnableDelayedExpansion
Set Path=%Path%;%SystemRoot%\system32\WindowsPowerShell\v1.0\
If /I "%1"=="Minimized" (
    Shift /1
    PowerShell -ExecutionPolicy Unrestricted -NoProfile -WindowStyle Minimized -File %~dpn0.ps1 -ExitEnd %*
) Else If /I "%1"=="Hidden" (
    Shift /1
    PowerShell -ExecutionPolicy Unrestricted -NoProfile -WindowStyle Hidden -File %~dpn0.ps1 -ExitEnd -ExitError %*
) Else (
    PowerShell -ExecutionPolicy Unrestricted -NoProfile -WindowStyle Minimized -File %~dpn0.ps1 %*
)
Set ExitCode=!ErrorLevel!
Echo.
Echo Exit Code: !ExitCode!
Exit !ExitCode!