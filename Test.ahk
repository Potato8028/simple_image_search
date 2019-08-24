#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Text, x30 y5 w110 h20, ImageSearch-T
Gui, Add, Text, x60 y25 w50 h20 vA, 대기
Gui, Add, Text, x60 y50 w50 h20 vB, 0 회

Gui, Add, Text, x20 y84 w55 h20, 반복횟수:
Gui, Add, Edit, x80 y80 w30 h20 v반복횟수, 0
Gui, Add, Text, x115 y84 w20 h20, 회

Gui, Add, Button, x20 y110 w110 h20, 시작
Gui, Add, Button, x20 y140 w110 h20, 종료
Gui, Add, Text, x50 y170 w90 h20, F2 : 멈춤
Gui, Show

매크로시작 := false

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

return 

Button시작:
{
	Gui,Submit,nohide
	GuiControl, , A, 시작

	매크로시작 := true
	끝난회수 := 0

	While((매크로시작 = true) && ((끝난회수 < 반복횟수) ll (반복횟수 = 0)))
	{
		;파란 세모
		Imagesearch, vx, vy, 1,1,1920,1080, *80 1.png
		if ((Errorlevel = 0) && (매크로시작 = true))
		{
			random,sleepTime,1000,2000
			sleep,sleepTime

			random,x,901,978		;랜덤으로 설정한 좌표
			random,y,498,562
			MouseClick,Left,x,y

		}

		;붉은 원
		Imagesearch ,vx, vy, 1,1,1920,1080, *80 2.png
		if ((Errorlevel = 0) && (매크로시작 = true))
		{
			random,sleepTime,1000,2000
			sleep,sleepTime

			random,x,1303,1409
			random,y,736,767

			MouseClick,Left,x,y
			
		}

		;노란 사각형
		Imagesearch ,vx, vy, 1,1,1920,1080, *80 3.png
		if ((Errorlevel = 0) && (매크로시작 = true))
		{
			random,sleepTime,1000,2000
			sleep,sleepTime

			random,x,1229,1412
			random,y,948,1005
		
			MouseClick,Left,x,y


			끝난회수 := 끝난회수 + 1
			Gui,Submit,nohide
			GuiControl, , B, %끝난회수% 회
		}

		if(매크로시작 = false)
		{
			break
		}
	}

}
return

Button종료:
{
	매크로시작 := false
	ExitApp
}
return 

F2::
{
	매크로시작 := false
	
	Gui,Submit,nohide
	GuiControl, , A,멈춤
}
return
