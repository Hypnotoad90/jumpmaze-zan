@echo off
7z a -tzip ./jm2_maps-dev.pk3 ./jm_maps/jm2_maps/* -x!*.dbs -x!*.bak -x!*.backup1 -x!*.backup2 -x!*.backup3
pause 