@ECHO OFF

CALL "%CD%\utilities\variables.bat"
CALL "%CD%\utilities\mkvers.bat"

DEL /F /Q "%OUTDIR%\jm_core-*.pk3"

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
acc "scripts/TRANSLUCENT.acs" "acs/TRANSLUCENT.o"
acc "scripts/sflags.acs" "acs/sflags.o"
acc "scripts/who_exited.acs" "acs/jmwhoxit.o"
acc "scripts/timer.acs" "acs/jmtimer.o"
acc "scripts/telefrag_patch.acs" "acs/teleptch.o"
acc "scripts/script_trigger.acs" "acs/strigger.o"
acc "scripts/luk.acs" "acs/luksys.o"
acc "scripts/constants.acs" "acs/constant.o"
acc "scripts/auto_fist.acs" "acs/strigger.o"
acc "scripts/script_trigger.acs" "acs/autofist.o"
acc "scripts/rsd.acs" "acs/rsdsys.o"
acc "scripts/client.acs" "acs/client.o"
acc "scripts/personal_teleport.acs" "acs/ptport.o"
acc "scripts/jpxmapinfo.acs" "acs/JPXINFO.o"
acc "scripts/svmz/game.acs" "acs/srvlmaze.o"
%SEVENZAEXE% a -tzip "%START%\jm_core-%FILEVERSION%.pk3" * -r -xr!*.dbs -xr!*.backup1 -xr!*.backup2 -xr!*.backup3 -xr!*.bak
POPD
