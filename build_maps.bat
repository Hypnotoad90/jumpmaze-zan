@ECHO OFF

SET JM2_MAPS_VERSION=rc3

CALL "%CD%\utilities\variables.bat"

DEL /F /Q "%OUTDIR%\jm2_maps-*.pk3"

PUSHD jm_maps\
cd jm_maps
%SEVENZAEXE% a -tzip "%START%\jm_maps.pk3" * -r -xr!*.dbs -xr!*.backup1 -xr!*.backup2 -xr!*.backup3 -xr!*.bak
cd ..\jm2_maps
%SEVENZAEXE% a -tzip "%START%\jm2_maps-%JM2_MAPS_VERSION%.pk3" * -r -xr!*.dbs -xr!*.backup1 -xr!*.backup2 -xr!*.backup3 -xr!*.bak
cd ..
POPD
