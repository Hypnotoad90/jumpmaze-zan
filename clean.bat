@ECHO OFF

WHERE /Q make
IF ERRORLEVEL 1 (
	ECHO "Could not find GNU Make on this system."
	ECHO "Ensure it is in your PATH variable!"
	EXIT 1
)

make clean
