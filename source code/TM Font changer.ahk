#NoTrayIcon
#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Gui Add, Listbox, x8 y30 w109 h376 gList VList, Default|Bahnschrift Light|A sinario|Human Gothic|HY River Y|Pristina
Gui Add, Text, x10 y7 w88 h19 +0x200, Fonts


Gui Add, Picture, x125 y34 w479 h274, src\thumbnail\Default.png
Gui Add, Text, x127 y6 w101 h22 +0x200, Preview
Gui Add, Button, x510 y322 w96 h37 gApply, Apply

Gui Font, S14
Gui Add, Button, x125 y379 w29 h27 gSettings, ⚙️

;===================== 업데이트 soon 툴팁 =========================
Gui Add, Button, x155 y379 w29 h27 +Disabled , +
OnMessage(0x200, "update_soon") ;툴팁 기능


Gui Font,
Gui Add, Text, x122 y356 w120 h23 +0x200, Settings




Gui Show, w620 h420, TM Font changer (v1.0)
;============== 설정  gui======================
Gui, Settings:New, ,Settings
Gui, Add, Text, w300 h200, 💾Trackmania Installation Directory
Gui Add, Edit, x10 y20 w280 h20 vDirSelect ,
Gui Add, Button, x295 y19 w23 h23 gDirSelectBT, ...

;============== under working====================
;Gui Add, GroupBox, x15 y50 w298 h50 +Center, add custom fonts
;Gui Add, Listbox, x20 y70 w250 h27 , 
;Gui Add, Button, x275 y70 w23 h23 , +

;============== Credit ==========================
Gui, Font, FFD8BFD8
Gui, Add, Text, x15 y50 w300 h12, Program Made by Hardtack
Gui Add, Link, x15 y65 w300 h60, <a href="">Discord: Hardtack#1342</a>
Gui, Add, Text, x15 y90 w300 h12, Special thanks to Twince, blue :)
Gui, Font
;========================= 게임 설치 경로 가져오기 ===============
FileReadLine, dndir, src\path.dat, 1
guicontrol, ,DirSelect, %dndir%

Return

;============ 툴팁 ===============================
update_soon(wParam, lParam, Msg) {

MouseGetPos,,,, OutputVarControl

IfEqual, OutputVarControl, Button3 ;세번쨰 버튼인 +(곧 추가할) 버튼

	update_soon := "add custom fonts `n will update asap :("

ToolTip % update_soon
;;https://autohotkey.com/board/topic/81915-solved-gui-control-tooltip-on-hover/
}




;========================= 리스트 뷰 =========================
List:
{      
     Gui, Submit, NoHide 
     Gui Add, Picture, x125 y34 w479 h274, src\thumbnail\%List%.png
     Gui, Submit, NoHide 
     Gui Add, Picture, x125 y34 w479 h274, src\thumbnail\%List%.png        
}
return

;========================= 적용 버튼 ===========================
Apply:
{ 
    ;;들어온 TM디렉토리 경로에 fonts폴더가 없으면 거부 화면 구현하기
    if (!FileExist(dndir)) 
        {
            MsgBox, 48, TM font changer, select TM installtion folder first :)
        }
    else
    {
        if(List = "")
        {
        MsgBox, 48, TM font changer, you should select the font
        return
        }
        
        IfNotExist, %dndir%\GameData
            MsgBox, 48, TM font changer, Game installtion path is worng!
        else 
        {
        
        MsgBox, 4, TM font changer, Do you want apply %List% font?
    
    
        ifMsgBox, Yes
            {
            Filecopy,src\fonts\%List%\Led_00.dds, %dndir%\GameData\Interface\Media\Font\Led_Textures,1 ;파일 복사
            MsgBox, 64, TM font changer, Successfuly changed!
            }
        ifMsgBox, No
            {
            return
            }
        }
      
    }
 }
 

return

;============= 세팅 gui 활성화==============================
Settings:
{
    Gui, Settings:Show, w320 h110
  }
return

;============ trackmanaia설치 폴더지정 함수  =================
DirSelectBT:
{
    FileSelectFolder, dndir, , 3
    
    if dndir = 
    { 
    return 
    } 

   GuiControl,, DirSelect, %dndir%  ;;dndir에 디렉토리 경로를 edit에 띄어줌
   
   
    if (FileExist(dndir)) 
    {
    FileDelete, src\path.dat
    FileAppend,%dndir%,src\path.dat
    }

Return 

}

;=========== 언어 기능 =================================
Deutsch:
{
Gui Add, Text, x10 y7 w88 h19 +0x200, Schriftarten

Gui Add, Text, x127 y6 w101 h22 +0x200, Vorschau
Gui Add, Button, x510 y322 w96 h37 gApply, Apply

Gui Font, S14
Gui Add, Button, x125 y379 w29 h27 gSettings, ⚙️
Gui Font,
Gui Add, Text, x122 y356 w120 h23 +0x200, Settings


Gui Show, w620 h420, TM Font changer
;============== 설정  gui======================
Gui, Settings:New, ,Settings
Gui, Add, Text, w300 h200, Trackmania Installation Directory
}


GuiEscape:
GuiClose:
    ExitApp
