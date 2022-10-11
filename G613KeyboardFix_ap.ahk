;What does this script do?
;It's a workaround for broken G910  Logitech keyboards (possibly other keyboards too) whereby some keys occasionally register multiple keystrokes for one kkkkkeypress.
;The key bug appears because keyboard registers multiple keystrokes in a very short timespan even though you pressed the key only once. 
;This script makes it so the subsequent keystrokes registered in a very short timespan are ignored thus outputing the key only for the first stroke.

;List all your broken keys between quotes below. I.e. if your broken keys are g and f then the line below shoud be 
;brokenKeys := "gf"
brokenKeys := "e"


;timepan in which subsequent keystrokes should be ignored.
;In a typical scenario you yourself won't be pressing a single key faster than 5 times a second (every 200 miliseconds) so it's safe to have this number at 200.
;However, this number also determines how fast autorepeat can happen (when you hold the key).
;The smaller the number the faster the auto repeat speed of the fixed keys will be  but also the higher the chance of the key bug happening when you type  normally.
;Values higher than 80 seems work best but it might depend on you operating system. 
fixOffset := 80

;That's it. There is no need to change anything else below

;These are typical values for a starter AHK script
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;This array will hold timers for each broken key
lastTimePressed := {}

;Create timer with current time for each broken key
Loop, Parse, brokenKeys
{
    lastTimePressed[A_LoopField] := A_TickCount
}

;lastTimePressed := A_TickCount

;Assign a hotkey handler for each broken key
Loop, Parse, brokenKeys
{    
    keyName := 
    Hotkey, $%A_LoopField%, HotKeyHandler 
}


HotKeyHandler:    
    pressedKey := SubStr(pressedKey,2)SubStr(A_ThisHotKey,2)    
    sinceLastPress := A_TickCount - lastTimePressed[pressedKey]
    if (sinceLastPress > fixOffset) { ;send the hijacked key only when sufficient time has passed
        lastTimePressed[pressedKey] := A_TickCount
        Send %pressedKey%
    }
return 