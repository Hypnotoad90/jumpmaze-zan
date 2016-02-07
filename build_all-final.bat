@ECHO OFF

:: More workarounds...
CALL "%CD%\utilities\variables.bat" %*
CALL "%CD%\utilities\mkvers.bat" %*

@CALL "%CD%\build_core.bat" /nogit
@CALL "%CD%\build_assets.bat" /nogit
@CALL "%CD%\build_maps.bat" /nogit
