@echo off
color 3f

TITLE Redmi Note11P+ 一键ROOT  By 大鸟

echo *************************************
echo Redmi Note11P 一键ROOT
echo 请输入你的miui版本，输入后回车
echo 例如我得是miui13.0.4
echo 那么输入13.0.4然后回车即可
echo *************************************
set /p miui=你的miui版本号是:
set xz="e5-oneindex.vercel.app/api/raw/?path=/Android/n11troot/%miui%.zip"

if  exist %miui%.img goto shuaji
if  exist %miui%.zip goto jiebao
echo 检测到本地不存在是否从大鸟云下载？
pause
aria2c https://%xz% >nul
if not exist %miui%.zip echo 大鸟云不存在此版本镜像为您切换线路 &goto lu
echo 文件下载完成[√]即将刷入...
goto jiebao

:lu
echo 正在尝试线路2下载.....
set xz2="ark.mikequ.top/Chopin/n11tp-hf/%miui%.zip"
aria2c https://%xz2% >nul
if not exist %miui%.zip echo 云端不存在此版本镜像为您自动退出 &pause&exit
echo 文件下载完成[√]即将刷入...
goto jiebao

:jiebao
7z x %miui%.zip >nul
if  exist %miui%.img echo 检测到%miui%.img解包成功压缩包已自动删除&del %miui%.zip&goto shuaji
echo 解包失败为您自动退出 &pause &exit

:shuaji
echo.********************************************
echo.
echo.              %miui%.img文件已经准备好
echo.    请确认手机进入fastboot模式并连接电脑
echo.
echo.********************************************
echo.
echo.
echo.......请按任意键继续......
pause >nul
CLS

echo.********************************************
echo.
echo.            检查是否正常连接手机...
echo.
echo.********************************************
echo.
echo. 此页如果内容显示waiting for any device...
echo.
echo.         说明你没有成功连接到设备
echo.
echo.
echo.  内容:
fastboot.exe wait-for-device
CLS

echo.********************************************
echo,
echo.                   开始root...
echo.
echo.********************************************
echo.
echo.如果此页内容处显示'fastboot.exe' 不是什么什么的...
echo.
echo.      说明你没有把所有文件解压出来再打开
echo.
echo.
echo.  内容:
fastboot.exe flash boot %miui%.img
echo.
echo.
echo.如内容处提示  [OKEY]
echo.......请按任意键重启手机......
pause >nul
CLS

echo.********************************************
echo.
echo.                  手机重启中...
echo.
echo.没有Magisk管理器的请手动安装Magisk应用
echo.
echo.********************************************
fastboot.exe reboot
pause >nul
goto shanchu

:shanchu
CLS
echo.********************************************
echo.
echo.    root成功是否删除%miui%.img
echo.   输入数字1以确认删除其余任意键不删除
echo.********************************************
set /p sc=输入数字1以确认删除:
if "%sc%"=="1"  del %miui%.img&echo %miui%.img删除成功 &pause >nul
echo %miui%.img已为您保留 &pause >nul







