@echo off
color 3f

TITLE Redmi Note11P+ һ��ROOT  By ����

echo *************************************
echo Redmi Note11P һ��ROOT
echo ���������miui�汾�������س�
echo �����ҵ���miui13.0.4
echo ��ô����13.0.4Ȼ��س�����
echo *************************************
set /p miui=���miui�汾����:
set xz="e5-oneindex.vercel.app/api/raw/?path=/Android/n11troot/%miui%.zip"

if  exist %miui%.img goto shuaji
if  exist %miui%.zip goto jiebao
echo ��⵽���ز������Ƿ�Ӵ��������أ�
pause
aria2c https://%xz% >nul
if not exist %miui%.zip echo �����Ʋ����ڴ˰汾����Ϊ���л���· &goto lu
echo �ļ��������[��]����ˢ��...
goto jiebao

:lu
echo ���ڳ�����·2����.....
set xz2="ark.mikequ.top/Chopin/n11tp-hf/%miui%.zip"
aria2c https://%xz2% >nul
if not exist %miui%.zip echo �ƶ˲����ڴ˰汾����Ϊ���Զ��˳� &pause&exit
echo �ļ��������[��]����ˢ��...
goto jiebao

:jiebao
7z x %miui%.zip >nul
if  exist %miui%.img echo ��⵽%miui%.img����ɹ�ѹ�������Զ�ɾ��&del %miui%.zip&goto shuaji
echo ���ʧ��Ϊ���Զ��˳� &pause &exit

:shuaji
echo.********************************************
echo.
echo.              %miui%.img�ļ��Ѿ�׼����
echo.    ��ȷ���ֻ�����fastbootģʽ�����ӵ���
echo.
echo.********************************************
echo.
echo.
echo.......�밴���������......
pause >nul
CLS

echo.********************************************
echo.
echo.            ����Ƿ����������ֻ�...
echo.
echo.********************************************
echo.
echo. ��ҳ���������ʾwaiting for any device...
echo.
echo.         ˵����û�гɹ����ӵ��豸
echo.
echo.
echo.  ����:
fastboot.exe wait-for-device
CLS

echo.********************************************
echo,
echo.                   ��ʼroot...
echo.
echo.********************************************
echo.
echo.�����ҳ���ݴ���ʾ'fastboot.exe' ����ʲôʲô��...
echo.
echo.      ˵����û�а������ļ���ѹ�����ٴ�
echo.
echo.
echo.  ����:
fastboot.exe flash boot %miui%.img
echo.
echo.
echo.�����ݴ���ʾ  [OKEY]
echo.......�밴����������ֻ�......
pause >nul
CLS

echo.********************************************
echo.
echo.                  �ֻ�������...
echo.
echo.û��Magisk�����������ֶ���װMagiskӦ��
echo.
echo.********************************************
fastboot.exe reboot
pause >nul
goto shanchu

:shanchu
CLS
echo.********************************************
echo.
echo.    root�ɹ��Ƿ�ɾ��%miui%.img
echo.   ��������1��ȷ��ɾ�������������ɾ��
echo.********************************************
set /p sc=��������1��ȷ��ɾ��:
if "%sc%"=="1"  del %miui%.img&echo %miui%.imgɾ���ɹ� &pause >nul
echo %miui%.img��Ϊ������ &pause >nul







