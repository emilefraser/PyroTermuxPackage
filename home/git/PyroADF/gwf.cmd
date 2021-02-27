
@ECHO OFF

IF "%1"=="" (
	GOTO:COMMITMESSAGEERR
)	ELSE (
 	git add * && git commit -m "%1" && git push -u usb master && git push -u origin master
)	
GOTO:EOF


:COMMITMESSAGEERR
ECHO You need to supply a commit message
GOTO:EOF
