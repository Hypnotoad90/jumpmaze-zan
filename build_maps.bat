@ECHO OFF

CALL "%CD%\utilities\variables.bat"

PUSHD jm_maps\jm_maps\
%SEVENZAEXE% a -tzip "%START%\jm_maps-dev.pk3" * -r -xr!*.dbs -xr!*.backup1 -xr!*.backup2 -xr!*.backup3 -xr!*.bak
POPD

PUSHD jm_maps\jm_maps2\
%SEVENZAEXE% a -tzip "%START%\jm2_maps-dev.pk3" * -r -xr!*.dbs -xr!*.backup1 -xr!*.backup2 -xr!*.backup3 -xr!*.bak
POPD
