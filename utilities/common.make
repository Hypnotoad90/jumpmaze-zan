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

# Detect OS and CPU architecture
ifeq ($(OS),Windows_NT)
    hostOS := windows
    ifeq ($(PROCESSOR_ARCHITEW6432),AMD64)
        hostArch := 64
    else
        ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
            hostArch := 64
        endif
        ifeq ($(PROCESSOR_ARCHITECTURE),x86)
            hostArch := 32
        endif
    endif
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        hostOS := linux
    endif
    ifeq ($(UNAME_S),Darwin)
        hostOS := macos
    endif
    UNAME_P := $(shell uname -p)
    ifeq ($(UNAME_P),x86_64)
        hostArch := 64
    endif
    ifneq ($(filter %86,$(UNAME_P)),)
        hostArch := 32
    endif
endif

# Tools
# Use our own 7za on Windows, and system 7za everywhere else
ifeq ($(hostOS),windows)
	ACC=utilities/acc.exe
	SEVENZA=utilities/7za$(hostArch)
else
	ACC=utilities/acc$(hostArch)
	SEVENZA=7za
endif

ACCFLAGS=
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



