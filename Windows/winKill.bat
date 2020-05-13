::it should work
sc config qengine start= disabled
sc config qupdate start= disabled
Taskkill /f /im QUpdateService.exe
Taskkill /f /im qengine.exe
