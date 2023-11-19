#Persistent

SendMode Input

ScriptEnabled := 1

SetTimer, PressWASD, 100
SetTimer, CheckPixel, 100
SetTimer, HoldDownE, 10
SetTimer, PressX, 500

return

\::
    ScriptEnabled := !ScriptEnabled
    Tooltip, %ScriptEnabled%
    return

HoldDownE:
    if (ScriptEnabled)
        SendInput, {E down}
    return

PressWASD:
    if (ScriptEnabled)
    {
        Send, {W down}
        Sleep, 50
        Send, {W up}

        Sleep, 50

        Send, {A down}
        Sleep, 50
        Send, {A up}

        Sleep, 50

        Send, {S down}
        Sleep, 50
        Send, {S up}

        Sleep, 50

        Send, {D down}
        Sleep, 50
        Send, {D up}
    }
    return

PressX:
    if (ScriptEnabled)
    {
        Send, {X down}
        Sleep, 50
        Send, {X up}
    }
    return

CheckPixel:
    if (ScriptEnabled)
    {
        PixelSearch, Px, Py, 1845, 404, 1845, 777, 0x2B89FE, 5, Fast RGB
        if ErrorLevel = 0
        {
            Click, %Px%, %Py%
            Sleep, 650
            Send, {X down}
            Sleep, 50
            Send, {X up}
            PixelFound := 0
        }
        else if (A_TickCount - StartTime >= 5000 && !PixelFound)
        {
            Click, 1000, 1000
            Sleep, 50
            Send, {X down}
            Sleep, 50
            Send, {X up}
            SetTimer, CheckPixel, 100
            StartTime := A_TickCount
        }
    }

    return
