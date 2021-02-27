@ECHO OFF
SETLOCAL
	SET PATH=%PATH%;C:\bin\dl
	ECHO %PATH%
	SET DLPATH=C:\download
	aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all=true --rpc-secret=105022_Alpha
ENDLOCAL
	
	
ECHO ON