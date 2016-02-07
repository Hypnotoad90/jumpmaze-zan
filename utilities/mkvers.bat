@ECHO OFF

IF %USEVERSION%==1 (
    IF %USEGIT%==1 (
        git >nul 2>&1
        if %ERRORLEVEL%==9009 (
            ECHO "Could not find git.exe on this system."
            ECHO "Ensure it is in your PATH variable!"
            EXIT 1
        )
    )

    "%START%\utilities\genver.exe" "%START%\version.gv" batch "%START%\utilities\zz_autogen_version.bat" --silent
    CALL "%START%\utilities\zz_autogen_version.bat"
    SET FILEVERSION=-%VERSION_STRING%

    IF %USEGIT%==1 (
        "%START%\utilities\gitcommit.exe" batch "%START%\utilities\zz_autogen_commit.bat" --silent
        CALL "%START%\utilities\zz_autogen_commit.bat"
    )

    :: Odd workaround so that the commit hash is added correctly.
    IF %USEGIT%==1 SET FILEVERSION=-%VERSION_STRING%-%COMMIT_HASH%
) ELSE (
	IF %USEVERSION%==0 (
		SET FILEVERSION=-dev
	)
)
