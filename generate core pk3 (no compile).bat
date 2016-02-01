@echo off
7z a -tzip ./jm_core-dev.pk3 ./jm_core/* -x!*.dbs -x!*.bak -x!*.backup1 -x!*.backup2 -x!*.backup3
pause 