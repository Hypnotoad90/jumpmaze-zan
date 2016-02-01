@ECHO OFF

CALL "%CD%\utilities\variables.bat"
CALL "%CD%\utilities\mkvers.bat"

PUSHD jm_core\pk3
IF NOT EXIST "%CD%\acs" MKDIR "%CD%\acs"
acc "scripts/utility.acs" "acs/utility.o"
acc "scripts/ranker_hs.acs" "acs/jmrhighs.o"
acc "scripts/ranker_solo.acs" "acs/jmrsolo.o"
acc "scripts/map_skill.acs" "acs/jmmskill.o"
acc "scripts/map_message.acs" "acs/jmmapmsg.o"
acc "scripts/jmgame.acs" "acs/jmgame.o"
acc "scripts/ranker_team.acs" "acs/jmrteam.o"
acc "scripts/jmrun.acs" "acs/jmrun.o"
acc "scripts/jm2_cdwn.acs" "acs/jm2_cdwn.o"
%SEVENZAEXE% a -tzip "%START%\jm_core-%FILEVERSION%.pk3" * -r -xr!*.dbs -xr!*.backup1 -xr!*.backup2 -xr!*.backup3 -xr!*.bak
POPD
