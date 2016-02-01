@echo off
7z a -tzip ./jm_assets-dev.pk3 ./jm_assets/* -x!*.dbs -x!*.bak -x!*.backup1 -x!*.backup2 -x!*.backup3
pause 