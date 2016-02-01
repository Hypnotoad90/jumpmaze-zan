@ECHO OFF

CALL "%CD%\utilities\variables.bat"

PUSHD jm_maps\
cd jm_maps
%SEVENZAEXE% a -tzip "%START%\jm_maps-dev.pk3" * -r -xr!*.dbs -xr!*.backup1 -xr!*.backup2 -xr!*.backup3 -xr!*.bak
cd ..\jm2_maps
%SEVENZAEXE% a -tzip "%START%\jm2_maps-dev.pk3" * -r -xr!*.dbs -xr!*.backup1 -xr!*.backup2 -xr!*.backup3 -xr!*.bak
cd ..
POPD
