# Use one of these targets to build:
# debug, beta, release, clean

# Variables and targets needed for build
include utilities/common.make

# ACS files
acsDir := jm_core/pk3/acs
sourceDir := jm_core/pk3/scripts
acsFiles := \
	$(acsDir)/utility.o \
	$(acsDir)/jmrhighs.o \
	$(acsDir)/jmrsolo.o \
	$(acsDir)/jmmskill.o \
	$(acsDir)/jmmapmsg.o \
	$(acsDir)/jmgame.o \
	$(acsDir)/jmrteam.o \
	$(acsDir)/jmrun.o \
	$(acsDir)/jm2_cdwn.o \
	$(acsDir)/TRANSLUCENT.o \
	$(acsDir)/sflags.o \
	$(acsDir)/jmwhoxit.o \
	$(acsDir)/jmtimer.o \
	$(acsDir)/teleptch.o \
	$(acsDir)/strigger.o \
	$(acsDir)/luksys.o \
	$(acsDir)/constant.o \
	$(acsDir)/autofist.o \
	$(acsDir)/rsdsys.o \
	$(acsDir)/client.o \
	$(acsDir)/ptport.o \
	$(acsDir)/srvlmaze.o \
	$(acsDir)/startreset.o \
	$(acsDir)/admin.o \
	$(acsDir)/hints.o \
	$(acsDir)/vote.o \
	$(acsDir)/cvarset.o \
	$(acsDir)/pickup.o \
	$(acsDir)/paths.o \
	$(acsDir)/speedometer.o \
	$(acsDir)/Spying.o \
	$(acsDir)/KeyPresses.o

$(acsDir):
	@$(MKDIR) $(MKDIRFLAGS) $@
$(acsDir)/utility.o: $(sourceDir)/utility.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/jmrhighs.o: $(sourceDir)/ranker_hs.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/jmrsolo.o: $(sourceDir)/ranker_solo.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/jmmskill.o: $(sourceDir)/map_skill.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/jmmapmsg.o: $(sourceDir)/map_message.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/jmgame.o: $(sourceDir)/jmgame.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/jmrteam.o: $(sourceDir)/ranker_team.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/jmrun.o: $(sourceDir)/jmrun.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/jm2_cdwn.o: $(sourceDir)/jm2_cdwn.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/TRANSLUCENT.o: $(sourceDir)/TRANSLUCENT.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/sflags.o: $(sourceDir)/sflags.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/jmwhoxit.o: $(sourceDir)/who_exited.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/jmtimer.o: $(sourceDir)/timer.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/teleptch.o: $(sourceDir)/telefrag_patch.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/strigger.o: $(sourceDir)/script_trigger.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/luksys.o: $(sourceDir)/luk.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/constant.o: $(sourceDir)/constants.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/autofist.o: $(sourceDir)/auto_fist.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/rsdsys.o: $(sourceDir)/rsd.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/client.o: $(sourceDir)/client.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/ptport.o: $(sourceDir)/personal_teleport.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/srvlmaze.o: $(sourceDir)/svmz/game.acs $(sourceDir)/svmz | $(acsDir)
	$(ACC) $< $@
$(acsDir)/startreset.o: $(sourceDir)/startreset.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/admin.o: $(sourceDir)/admin.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/hints.o: $(sourceDir)/hints.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/vote.o: $(sourceDir)/vote.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/cvarset.o: $(sourceDir)/cvarset.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/pickup.o: $(sourceDir)/pickup.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/paths.o: $(sourceDir)/paths.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/speedometer.o: $(sourceDir)/speedometer.acs $(sourceDir)/speedfuncs.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/Spying.o: $(sourceDir)/Spying.acs | $(acsDir)
	$(ACC) $< $@
$(acsDir)/KeyPresses.o: $(sourceDir)/KeyPresses.acs | $(acsDir)
	$(ACC) $< $@

# PK3 files
jmCoreContents = $(shell $(FIND) jm_core/pk3 $(FINDFLAGS) -newer $(targetDir)/jm_core-$(targetSuffix).pk3 2>/dev/null)
jmAssetsContents = $(shell $(FIND) jm_assets/pk3 $(FINDFLAGS) -newer $(targetDir)/jm_assets-$(targetSuffix).pk3 2>/dev/null)
jmMapsContents = $(shell $(FIND) jm_maps/jm_maps $(FINDFLAGS) -newer $(targetDir)/jm_maps-$(targetSuffix).pk3 2>/dev/null)
jm2MapsContents = $(shell $(FIND) jm_maps/jm2_maps $(FINDFLAGS) -newer $(targetDir)/jm2_maps-$(targetSuffix).pk3 2>/dev/null)

pk3Files := \
	$(targetDir)/jm_core-$(targetSuffix).pk3 \
	$(targetDir)/jm_assets-$(targetSuffix).pk3 \
	$(targetDir)/jm_maps-$(targetSuffix).pk3 \
	$(targetDir)/jm2_maps-$(targetSuffix).pk3

$(targetDir):
	@$(MKDIR) $(MKDIRFLAGS) $@
$(targetDir)/jm_core-$(targetSuffix).pk3: jm_core/pk3 $(jmCoreContents) $(acsFiles) | $(targetDir)
	@$(DEL) $(DELFLAGS) $@
	$(SEVENZA) $(SEVENZAFLAGS) $@ ./$</*
$(targetDir)/jm_assets-$(targetSuffix).pk3: jm_assets/pk3 $(jmAssetsContents) | $(targetDir)
	@$(DEL) $(DELFLAGS) $@
	$(SEVENZA) $(SEVENZAFLAGS) $@ ./$</*
$(targetDir)/jm_maps-$(targetSuffix).pk3: jm_maps/jm_maps $(jmMapsContents) | $(targetDir)
	@$(DEL) $(DELFLAGS) $@
	$(SEVENZA) $(SEVENZAFLAGS) $@ ./$</*
$(targetDir)/jm2_maps-$(targetSuffix).pk3: jm_maps/jm2_maps $(jm2MapsContents) | $(targetDir)
	@$(DEL) $(DELFLAGS) $@
	$(SEVENZA) $(SEVENZAFLAGS) $@ ./$</*

# Build target
build: $(pk3Files)

# Clean target
clean: cleanCommon
	@$(DEL) $(DELFLAGS) $(acsDir)/*
	@echo Clean operation complete.

