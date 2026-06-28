
; AHK脚本以管理员权限自启
if !(A_IsAdmin || InStr(DllCall("GetCommandLine", "Str"), ".exe /r"))
  RunWait % "*RunAs " (_:=A_IsCompiled ? """" : A_AhkPath " /r """) A_ScriptFullPath (_ ? """" : """ /r")




SendMode Input
#NoEnv
#Persistent


CoordMode, Pixel , Screen
CoordMode, Mouse , Screen
x:= 0
y:= 0
Loop
{

    if WinActive("ahk_exe YuanShen.exe")
    {
        x :=1
    }
    Else{
        x:=0
    }

    if y
    {
        send, {x down}
        Sleep, 20
        send, {x up}
        Sleep, 10
        send, {Space down}
        Sleep, 20
        send, {Space up}

    }
    Sleep, 500
}

~RCtrl::
    {
        if x
        {
            if GetKeyState("RCtrl", "P")
            {
                send, {LButton down}
                sleep, 10
                send, {LButton up}
                sleep, 20
                MouseGetPos, xpos, ypos
                sleep, 50
                MouseMove, 3133,2026
                sleep, 50
                send, {LButton down}
                sleep, 10
                send, {LButton up}
                sleep, 20
                MouseMove, 2318,1514
                sleep, 50
                send, {LButton down}
                sleep, 10
                send, {LButton up}
                sleep, 20
                MouseMove, %xpos%, %ypos%
                Return
            }
        }
        Return
    }

~RShift::
    {
        if x
        {
            Loop
            {
                if GetKeyState("RShift", "P")
                {
                    MouseMove, 3477,1536
                    sleep, 50
                    send, {LButton down}
                    sleep, 50
                    send, {LButton up}
                    sleep, 500

                    MouseMove, 3502,2036
                    sleep, 50
                    send, {LButton down}
                    sleep, 50
                    send, {LButton up}
                    sleep, 100

                    MouseMove, 229,306
                    sleep, 50
                    send, {LButton down}
                    sleep, 50
                    send, {LButton up}
                    sleep, 100

                    MouseMove, 280,447
                    sleep, 50
                    send, {LButton down}
                    sleep, 50
                    send, {LButton up}
                    sleep, 100
                }
                else
                    break
                return
            }
        }
        Return
    }

~F::
    {
        If x
        {
            Sleep, 124
            Loop
            {
                if GetKeyState("f", "P")
                {
                    send, {LButton down}
                    sleep, 18
                    send, {LButton up}
                    sleep 42
                }
                else
                {
                    Return
                }

            }
            Return
        }
        Return
    }

~x::
    {
        if x
        {
            Sleep, 200
            Loop
            {
                if GetKeyState("x", "P")
                {
                    send, {x down}
                    Sleep, 50
                    send,{x up}
                    Sleep, 50
                }
                Else
                {
                    Return
                    Break
                }

            }
            Return
        }
        Return
    }



~n::
{
    if y
    {
        y:=0
    }
    else
    {
        y:=1
    }
    Return


}






~xbutton2::alt




~>!k::
    {
        Run, "E:\.tools\1_dat\end.bat"
        exitapp
    }



