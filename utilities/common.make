# Some common targets
# - We put them inside ifndef so make doesn't emit warnings on replacing targets
ifndef targetName
# - Debug target has to be first for plain invocation of make
debug:
	@$(MAKE) build targetName=debug
	@echo Build successful!
beta:
	@$(MAKE) build targetName=beta
	@echo Build successful!
release:
	@$(MAKE) build targetName=release
	@echo Build successful!
cleanCommon:
	@$(DEL) $(DELFLAGS) $(targetDirDebug)
	@$(DEL) $(DELFLAGS) $(targetDirBeta)
	@$(DEL) $(DELFLAGS) $(targetDirRelease)
endif
.PHONY: debug beta release clean cleanCommon build

# Processor architecture
ifeq ($(PROCESSOR_ARCHITECTURE),x32)
ifndef PROCESSOR_ARCHITEW6432
hostArch := 32
else
hostArch := 64
endif
else
ifeq ($(PROCESSOR_ARCHITECTURE),x86)
ifndef PROCESSOR_ARCHITEW6432
hostArch := 32
else
hostArch := 64
endif
else
hostArch := 64
endif
endif

# Tools
ACC=utilities/acc
ACCFLAGS=
SEVENZA=utilities/7za$(hostArch)
SEVENZAFLAGS=a -tzip -r -xr!*.dbs -xr!*.backup1 -xr!*.backup2 -xr!*.backup3 -xr!*.bak
DEL=rm
DELFLAGS=-rf
WHERE=which
MKDIR=mkdir
MKDIRFLAGS=-p
FIND=/usr/bin/find
FINDFLAGS=-type f

# Directories
targetDirDebug := debug
targetDirBeta := release_beta
targetDirRelease := release

# Target specific options
# TODO targetVersion: check the most recent repository tag?
# - Debug
ifeq ($(targetName),debug)
targetDir := $(targetDirDebug)
targetSuffix := dev
endif

# - Beta
ifeq ($(targetName),beta)
targetDir := $(targetDirBeta)
ifeq ($(shell $(WHERE) git),)
$(error Could not find git.exe on this system. Ensure it is in your PATH variable!)
endif
commitHash := $(shell git rev-parse --short HEAD)
targetVersion := $(shell cat version.gv)
targetSuffix := $(targetVersion)-$(commitHash)
endif

# - Release
ifeq ($(targetName),release)
targetDir := $(targetDirRelease)
targetVersion := $(shell cat version.gv)
targetSuffix := $(targetVersion)
endif



