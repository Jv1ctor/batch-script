@echo off
setlocal enabledelayedexpansion

set "pastaOrigem[0]=c:\Users\jrodr\Desktop\script bat\XML\01\TLE_CANCELADOS"
set "pastaOrigem[1]=c:\Users\jrodr\Desktop\script bat\XML\01\TLE_RECEBIDOS"

set "pastaOrigem[2]=c:\Users\jrodr\Desktop\script bat\XML\02\TLE_CANCELADOS"
set "pastaOrigem[3]=c:\Users\jrodr\Desktop\script bat\XML\02\TLE_RECEBIDOS"

set "pastaBkp[0]=c:\Users\jrodr\Desktop\script bat\XML\01\TLE_CANCELADOS_BKP"
set "pastaBkp[1]=c:\Users\jrodr\Desktop\script bat\XML\01\TLE_RECEBIDOS_BKP"

set "pastaBkp[2]=c:\Users\jrodr\Desktop\script bat\XML\02\TLE_CANCELADOS_BKP"
set "pastaBkp[3]=c:\Users\jrodr\Desktop\script bat\XML\02\TLE_RECEBIDOS_BKP"



set "pastaDestino=C:\Users\jrodr\Desktop\script bat\XML\TLE_RECEBIDOS"


for /l %%I in (0, 1, 4) do (
    for %%A in ("!pastaOrigem[%%I]!") do (
      copy %%A "!pastaBkp[%%I]!"
    )
    echo BACKUP feito com successo

    for %%A in ("!pastaOrigem[%%I]!\*.*") do (
        echo "!pastaOrigem[%%I]!\*.*"
        set "arquivo=%%~nxA"
        set "contador=1"
        
        call :moveComRenomeio "%%A"
    )
    echo MOVIDO com sucesso  
)
endlocal
goto :eof


:moveComRenomeio
if exist "%pastaDestino%\%arquivo%" (
    set "arquivo=%~n1(!contador!)%~x1"
    set /a "contador+=1"
    call :moveComRenomeio %1
) else (
    move %1 "%pastaDestino%\%arquivo%"
)
goto :eof

