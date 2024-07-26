:start
@echo off
setlocal enabledelayedexpansion enableextensions
2>nul md tmp&&cls 
@del tmp\pvar*.ini>NUL 2>&1
@del tmp\evar*.ini>NUL 2>&1
@del tmp\bvar*.ini>NUL 2>&1
@del tmp\gvar*.ini>NUL 2>&1
@del tmp\flashy.txt>NUL 2>&1
@echo 20'>tmp\pvar1.ini
@echo 10'>tmp\evar1.ini
@echo 23'>tmp\evar2.ini
@echo 36'>tmp\evar3.ini
@echo 222'>tmp\evar9.ini
@echo 0'>tmp\svar1.ini
@echo 1'>tmp\bvar1.ini
@echo 0'>tmp\bvar2.ini
@echo 20'>tmp\bvar3.ini
@echo 1'>tmp\gvar1.ini
@echo 7'>tmp\gvar2.ini
@echo 1'>tmp\gvar3.ini
@echo 888'>tmp\gvar9.ini
@copy tmp\*.ini tmp\*.ini_>NUL 2>&1
::player x-pos
set pvar1=20
::enemy1 x-pos
set evar1=10
::enemy2 x-pos
set evar2=23
::enemy3 x-pos
set evar3=36
::enemy combo
set evar9=222
::score
set svar1=0
::bullet reload
set bvar1=1
::bullet x-pos
set bvar2=0
::bullet y-pos
set bvar3=20
::game steps
set gvar1=1
::enemy y-pos
set gvar2=7
::phase steps
set gvar3=1
::enemy exists
set gvar9=888
::enemy y-pos+1
set /a gvar4=%gvar2%+1
::other exists
set /a evar1x=1
set /a evar2x=1
set /a evar3x=1
set /a evar9a=122
set /a evar9b=212
set /a evar9c=221
set /a evar9d=122
set /a evar9e=111
set /a evar9f=211
set /a evar9g=121
:flashgen
for /l %%n in (1,1,21) do (echo.&&for /l %%t in (1,1,41) do (set /p "=#"<nul))>>tmp/flashy.txt
:intro
@cls
@echo  _______________________________________
@echo :     ___    ___   ___    ___  _    _   :
@echo :    l   \  l __l / __\  l __l \\  //   :
@echo :    l D  l lI__  l l _  lI__   \\//    :
@echo :    l   /  l __l l l/ l l __l   II     :
@echo :    l \ \  lI__  l \I / lI__   //\\    :
@echo :  . l_I\_\ l___l \___/  l___l //  \\   :
@echo :       ___      .        __ _  _    .  :
@echo :        I  I\ I\  //\ I\I_ I/ /_ I     :
@echo :   .   _I_ I \I \//--\I/I__I\ _/ o .   :
@echo : .     .   _      .                  . :
@echo :      .   (O)    .___.  .         .    :
@echo :  .       /'\    /_ _\      (O)    .   :
@echo :                / O O \     /'\        :
@echo :\      .      /\\__n__//\             /:
@echo : \           /  / / \ \  \          /\ :
@echo :  \/\        `            `     /\ /  \:
@echo :  /  \/\         /\          /\/  \    :
@echo :\     \ \\.,.,/\/  \\,.,.,/\/ /    \   :
@echo : \        \ /  /     \  /   \/        /:
@echo :LDA    ( press any key to start )   '24:
@echo :.......................................:
@echo.
@echo  ---------------------------------------
@echo. Z (left)   -   X (right)   -   A (fire)  
@echo  ---------------------------------------
@echo.
@echo.
@echo.
@ping 0.0.0.0 -n 2 -w 2 >nul 2>nul
pause>nul
:waveloop
set /a gvar2=%gvar2%+%gvar1%
set /a svar1=%svar1%*2
:gameloop
@sed -e "s/^-.*$/0'/g" -e "s/41/40/g" -e "s/'//g" tmp/pvar1.ini>tmp/pvar1.ini_
cd tmp&&del pvar1.ini&&ren pvar1.ini_ pvar1.ini
copy pvar1.ini pvar1.ini_>NUL 2>&1
@cd..
:extcheck
if %evar1x%==1 (if %evar2x%==1 (if %evar3x%==1 (
set /a evar9=222
set /a gvar9=888
)))
if %evar1x%==0 (if %evar2x%==0 (if %evar3x%==1 (
set /a evar9=112
set /a gvar9=778
)))
if %evar1x%==1 (if %evar2x%==0 (if %evar3x%==1 (
set /a evar9=212
set /a gvar9=878
)))
if %evar1x%==0 (if %evar2x%==1 (if %evar3x%==0 (
set /a evar9=121
set /a gvar9=787
)))
if %evar1x%==0 (if %evar2x%==1 (if %evar3x%==1 (
set /a evar9=122
set /a gvar9=788
)))
if %evar1x%==1 (if %evar2x%==0 (if %evar3x%==0 (
set /a evar9=211
set /a gvar9=877
)))
if %evar1x%==1 (if %evar2x%==1 (if %evar3x%==0 (
set /a evar9=221
set /a gvar9=887
)))
if %evar1x%==0 (if %evar2x%==0 (if %evar3x%==0 (
set /a gvar1=%gvar1%+1
goto :nexty
)))
set /p pvar1=<tmp\pvar1.ini
if %gvar2%==21 (goto :gameover)
if %pvar1%==39 (set /a svar1=-99999&&goto :gameover)
if %bvar1%==1 (set /a bvar2=%pvar1%)
if %gvar3%==1 (set /a evar1=10 && set /a evar2=23 && set /a evar3=36)
if %gvar3%==2 (set /a evar1=11 && set /a evar2=24 && set /a evar3=37)
if %gvar3%==3 (set /a evar1=12 && set /a evar2=25 && set /a evar3=38)
if %gvar3%==4 (set /a evar1=13 && set /a evar2=26 && set /a evar3=39)
if %gvar3%==5 (set /a evar1=12 && set /a evar2=25 && set /a evar3=38)
if %gvar3%==6 (set /a evar1=11 && set /a evar2=24 && set /a evar3=37)
if %gvar3%==7 (set /a evar1=10 && set /a evar2=23 && set /a evar3=36)
if %gvar3%==8 (set /a evar1=9 && set /a evar2=22 && set /a evar3=35)
if %gvar3%==9 (set /a evar1=8 && set /a evar2=21 && set /a evar3=34)
if %gvar3%==10 (set /a evar1=7 && set /a evar2=20 && set /a evar3=33)
if %gvar3%==11 (set /a evar1=8 && set /a evar2=21 && set /a evar3=34) 
if %gvar3%==12 (set /a evar1=9 && set /a evar2=22 && set /a evar3=35)
:drawplay
@echo  _______________________________________ >tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :   -  R E G E X - I N V A D E R S  -   :>>tmp\play.txt
@echo :  -=-                             -=-  :>>tmp\play.txt
@echo : -===-   -===-   -===-   -===-   -===- :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                       :>>tmp\play.txt
@echo :                                  _u__ :>>tmp\play.txt
@echo :                                 /____\:>>tmp\play.txt
@echo :                                 I m E :>>tmp\play.txt
@echo :.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.I.H.,.:>>tmp\play.txt
@echo.>>tmp\play.txt
@echo  --------------------------------------->>tmp\play.txt
@echo  score=%svar1%   -   level=%gvar1%   -   step=%gvar2% >>tmp\play.txt
@echo  --------------------------------------->>tmp\play.txt
cd tmp
@copy play.txt play.txt_>NUL 2>&1
cd..
:playloop
cls
set /a gvar4=%gvar2%+1
set /a evar1a=%evar1%
set /a evar1b=%evar1%+1
set /a evar1c=%evar1%+2
set /a evar2a=%evar2%-3
set /a evar2b=%evar2%-4
set /a evar2c=%evar2%-5
set /a evar3a=%evar3%-7
set /a evar3b=%evar3%-6
set /a evar3c=%evar3%-5
set /a bvar3b=%bvar3%+1
if %bvar3%==6 (
set bvar1=1
set bvar2=%pvar1%
set bvar3=20
set /a svar1=%svar1%+1
)
goto :hitdats
:flasho
@cls
@type tmp\flashy.txt
@echo.
@echo.
@echo  ---------------------------------------
@echo.                  
@echo  ---------------------------------------
@echo.&&@echo.&&@echo.
@ping 0.0.0.0 -n 1 -w 1 >nul 2>nul
goto :gameloop
:hitdats
if %evar1x%==1 (if %bvar3%==%gvar4% (if %bvar2%==%evar1a% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar1x=0
goto :flasho
)))
if %evar1x%==1 (if %bvar3%==%gvar4% (if %bvar2%==%evar1b% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar1x=0
goto :flasho
)))
if %evar1x%==1 (if %bvar3%==%gvar4% (if %bvar2%==%evar1c% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar1x=0
goto :flasho
)))
if %evar1x%==1 (if %bvar3b%==%gvar2% (if %bvar2%==%evar1a% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar1x=0
goto :flasho
)))
if %evar1x%==1 (if %bvar3b%==%gvar2% (if %bvar2%==%evar1b% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar1x=0
goto :flasho
)))
if %evar1x%==1 (if %bvar3b%==%gvar2% (if %bvar2%==%evar1c% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar1x=0
goto :flasho
)))
if %evar2x%==1 (if %bvar3%==%gvar4% (if %bvar2%==%evar2a% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar2x=0
goto :flasho
)))
if %evar2x%==1 (if %bvar3%==%gvar4% (if %bvar2%==%evar2b% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar2x=0
goto :flasho
)))
if %evar2x%==1 (if %bvar3%==%gvar4% (if %bvar2%==%evar2c% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar2x=0
goto :flasho
)))
if %evar2x%==1 (if %bvar3b%==%gvar2% (if %bvar2%==%evar2a% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar2x=0
goto :flasho
)))
if %evar2x%==1 (if %bvar3b%==%gvar2% (if %bvar2%==%evar2b% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar2x=0
goto :flasho
)))
if %evar2x%==1 (if %bvar3b%==%gvar2% (if %bvar2%==%evar2c% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar2x=0
goto :flasho
)))
if %evar3x%==1 (if %bvar3%==%gvar4% (if %bvar2%==%evar3a% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar3x=0
goto :flasho
)))
if %evar3x%==1 (if %bvar3%==%gvar4% (if %bvar2%==%evar3b% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar3x=0
goto :flasho
)))
if %evar3x%==1 (if %bvar3%==%gvar4% (if %bvar2%==%evar3c% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar3x=0
goto :flasho
)))
if %evar3x%==1 (if %bvar3b%==%gvar2% (if %bvar2%==%evar3a% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar3x=0
goto :flasho
)))
if %evar3x%==1 (if %bvar3b%==%gvar2% (if %bvar2%==%evar3b% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar3x=0
goto :flasho
)))
if %evar3x%==1 (if %bvar3b%==%gvar2% (if %bvar2%==%evar3c% (
set /a bvar1=1
set /a bvar2=%pvar1%
set /a bvar3=20
set /a svar1=%svar1%+100*%gvar1%
set /a evar3x=0
goto :flasho
)))
::double-checks
::set evar1z=true
::if not "%evar9%"=="222" if not "%evar9%"=="221" if not "%evar9%"=="211" if not "%evar9%"=="212" set evar1z=false
::if "%evar1z%"=="true" (set /a evar1x=1)
::set evar2z=true
::if not "%evar9%"=="222" if not "%evar9%"=="221" if not "%evar9%"=="121" if not "%evar9%"=="122" set evar1z=false
::if "%evar2z%"=="true" (set /a evar2x=1)
::set evar3z=true
::if not "%evar9%"=="222" if not "%evar9%"=="212" if not "%evar9%"=="112" if not "%evar9%"=="212" set evar1z=false
::if "%evar3z%"=="true" (set /a evar3x=1)
:sedland
if %evar9%==222 (
if %bvar1%==1 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0(O)k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0(O)k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0(O)k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\/'\\k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\/'\\k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\/'\\k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_99
))
if %evar9%==112 (
if %bvar1%==1 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0   k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0   k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0(O)k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\   \k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\   \k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\/'\\k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_99
))
if %evar9%==121 (
if %bvar1%==1 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0   k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0(O)k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0   k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\   \k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\/'\\k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\   \k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_99
))
if %evar9%==122 (
if %bvar1%==1 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0   k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0(O)k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0(O)k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\   \k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\/'\\k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\/'\\k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_99
))
if %evar9%==212 (
if %bvar1%==1 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0(O)k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0   k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0(O)k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\/'\\k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\   \k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\/'\\k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_99
))
if %evar9%==221 (
if %bvar1%==1 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0(O)k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0(O)k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0   k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\/'\\k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\/'\\k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\   \k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_99
))
if %evar9%==211 (
if %bvar1%==1 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0(O)k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0   k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0   k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\/'\\k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\   \k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\   \k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_99
))
if %evar9%==222 (
if %bvar1%==0 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0(O)k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0(O)k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0(O)k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\/'\\k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\/'\\k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\/'\\k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_10
@sed -E "%bvar3%s/^(.{%bvar2%})/\0 lk/g" tmp\play.txt_10>tmp\play.txt_11
@sed -E "%bvar3%s/k..//g" tmp\play.txt_11>tmp\play.txt_99
))
if %evar9%==112 (
if %bvar1%==0 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0   k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0   k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0(O)k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\   \k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\   \k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\/'\\k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_10
@sed -E "%bvar3%s/^(.{%bvar2%})/\0 lk/g" tmp\play.txt_10>tmp\play.txt_11
@sed -E "%bvar3%s/k..//g" tmp\play.txt_11>tmp\play.txt_99
))
if %evar9%==121 (
if %bvar1%==0 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0   k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0(O)k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0   k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\   \k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\/'\\k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\   \k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_10
@sed -E "%bvar3%s/^(.{%bvar2%})/\0 lk/g" tmp\play.txt_10>tmp\play.txt_11
@sed -E "%bvar3%s/k..//g" tmp\play.txt_11>tmp\play.txt_99
))
if %evar9%==122 (
if %bvar1%==0 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0   k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0(O)k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0(O)k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\   \k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\/'\\k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\/'\\k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_10
@sed -E "%bvar3%s/^(.{%bvar2%})/\0 lk/g" tmp\play.txt_10>tmp\play.txt_11
@sed -E "%bvar3%s/k..//g" tmp\play.txt_11>tmp\play.txt_99
))
if %evar9%==212 (
if %bvar1%==0 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0(O)k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0   k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0(O)k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\/'\\k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\   \k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\/'\\k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_10
@sed -E "%bvar3%s/^(.{%bvar2%})/\0 lk/g" tmp\play.txt_10>tmp\play.txt_11
@sed -E "%bvar3%s/k..//g" tmp\play.txt_11>tmp\play.txt_99
))
if %evar9%==211 (
if %bvar1%==0 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0(O)k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0   k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0   k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\/'\\k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\   \k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\   \k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_10
@sed -E "%bvar3%s/^(.{%bvar2%})/\0 lk/g" tmp\play.txt_10>tmp\play.txt_11
@sed -E "%bvar3%s/k..//g" tmp\play.txt_11>tmp\play.txt_99
))
if %evar9%==221 (
if %bvar1%==0 (
@sed -E "21s/^(.{%pvar1%})/\0.M.k/" tmp\play.txt>tmp\play.txt_00
@sed -E "22s/^(.{%pvar1%})/\0<=>k/" tmp\play.txt_00>tmp\play.txt_01
@sed -E "s/k...//" tmp\play.txt_01>tmp\play.txt_02
@sed -E "%gvar2%s/^(.{%evar1%})/\0(O)k/" tmp\play.txt_02>tmp\play.txt_03
@sed -E "%gvar2%s/^(.{%evar2%})/\0(O)k/" tmp\play.txt_03>tmp\play.txt_04
@sed -E "%gvar2%s/^(.{%evar3%})/\0   k/" tmp\play.txt_04>tmp\play.txt_05
@sed -E "%gvar4%s/^(.{%evar1%})/\0\/'\\k/" tmp\play.txt_05>tmp\play.txt_06
@sed -E "%gvar4%s/^(.{%evar2%})/\0\/'\\k/" tmp\play.txt_06>tmp\play.txt_07
@sed -E "%gvar4%s/^(.{%evar3%})/\0\   \k/" tmp\play.txt_07>tmp\play.txt_08
@sed -E "%gvar2%s/k...//g" tmp\play.txt_08>tmp\play.txt_09
@sed -E "%gvar4%s/k...//g" tmp\play.txt_09>tmp\play.txt_10
@sed -E "%bvar3%s/^(.{%bvar2%})/\0 lk/g" tmp\play.txt_10>tmp\play.txt_11
@sed -E "%bvar3%s/k..//g" tmp\play.txt_11>tmp\play.txt_99
))
cd tmp
@del play.txt
@ren play.txt_99 play.txt
@copy play.txt play.txt_99>NUL 2>&1
cd..
@type tmp\play.txt
@echo.&&@echo.&&@echo.
:varloop
if %bvar1%==0 (
set /a bvar3=%bvar3%-1
)
if %gvar3%==12 (
set /a gvar3=0
set /a gvar2=%gvar2%+1
)
if %evar9%==111 (
set /a gvar1=%gvar1%+1
goto :nexty
)
:choice
set /a gvar3=%gvar3%+1
choice /C ZXA89 /D 9 /N /T 1 >NUL
if %errorlevel%==1 goto chc1
if %errorlevel%==2 goto chc2
if %errorlevel%==3 goto chc3
if %errorlevel%==4 goto rest
if %errorlevel%==5 goto gameloop
::goto :start
:chc1
set /a p=%pvar1%
set /a pvar1=p-1
@echo %pvar1%'>tmp\pvar1.ini
goto :gameloop
:chc2
set /a p=%pvar1%
set /a pvar1=p+1
@echo %pvar1%'>tmp\pvar1.ini
goto :gameloop
:chc3
set /a bvar1=0
goto :gameloop
:rest
goto :start
pause
:gameover
for /l %%n in (1,1,13) do (
@cls
@type tmp\flashy.txt
@echo.
@echo.
@echo  ---------------------------------------
@echo.                  
@echo  ---------------------------------------
@echo.&&@echo.&&@echo.
@ping 0.0.0.0 -n 1 -w 1 >nul 2>nul
@cls
@ping 0.0.0.0 -n 1 -w 1 >nul 2>nul
)
@cls
@ping 0.0.0.0 -n 2 -w 2 >nul 2>nul
@type tmp\flashy.txt
@echo.
@echo.
@echo  ---------------------------------------
@echo.                  
@echo  ---------------------------------------
@echo.&&@echo.&&@echo.
@ping 0.0.0.0 -n 2 -w 66x >nul 2>nul
@cls
@ping 0.0.0.0 -n 2 -w 2 >nul 2>nul
@echo  _______________________________________ 
@echo :                                       :
@echo :   -  R E G E X - I N V A D E R S  -   :
@echo :  -=-                             -=-  :
@echo : -===-   -===-   -===-   -===-   -===- :
@echo :                                       :
@echo :         (O)                           :
@echo :    (O)  /'\        (O)                :
@echo :    /'\             /'\                :
@echo :                                       :
@echo :                                       :
@echo :  (O)                                  :
@echo :  /'\                                  :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                  (O)  :
@echo :                                  /'7  :
@echo : ,                           (O)  _u__ :
@echo : z,                      (O) ['\ /____\:
@echo :,w                       /'\  (O)I m E :
@echo :/=J,.,.,.,.,.,.,.,.,.,.,.,.,.,/'L_xH.,.:
@echo.
@echo  ---------------------------------------
@echo                 owwwwww^^!^^!^^!
@echo  ---------------------------------------
@echo.&&@echo.&&@echo.
@ping 0.0.0.0 -n 4 -w 44 >nul 2>nul
@cls
@echo  _______________________________________ 
@echo :                                       :
@echo :   -  R E G E X - I N V A D E R S  -   :
@echo :  -=-                             -=-  :
@echo : -===-   -===-   -===-   -===-   -===- :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :               ,       ,    i          :
@echo :              _\______/_   nIb         :
@echo :               /`_, ._\     /          :
@echo :            _ /  O  O  \   /           :
@echo :           / \\___nn___/__/            :
@echo :          /   /  /  \  \               :
@echo :         /   /  /    \  \              :
@echo :         \@  `  `     ` /              :
@echo :          `            `               :
@echo :.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.:
@echo.
@echo  ---------------------------------------
@echo.                   ahh^^!
@echo  ---------------------------------------
@echo.&&@echo.&&@echo.
@ping 0.0.0.0 -n 2 -w 22 >nul 2>nul
@cls
@ping 0.0.0.0 -n 1 -w 1 >nul 2>nul
@cls
@echo  _______________________________________ 
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :             -------------             :
@echo :             '           '             :
@echo :                G A M E                :
@echo :                                       :
@echo :                O V E R                :
@echo :             .           .             :
@echo :             -------------             :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :_______________________________________:
@echo.
@echo  ---------------------------------------
@echo              your score:  %svar1%
@echo  ---------------------------------------
@echo.&&@echo.&&@echo.
@ping 0.0.0.0 -n 3 -w 99 >nul 2>nul
pause>nul
goto :start
:nexty
@cls
@type tmp\flashy.txt
@echo.
@echo.
@echo  ---------------------------------------
@echo.                  
@echo  ---------------------------------------
@echo.&&@echo.&&@echo.
@ping 0.0.0.0 -n 2 -w 22 >nul 2>nul
@cls
@echo  _______________________________________ 
@echo :                                       :
@echo :   -  R E G E X - I N V A D E R S  -   :
@echo :  -=-                             -=-  :
@echo : -===-   -===-   -===-   -===-   -===- :
@echo :             .                         :
@echo :         .        .                    :
@echo :       .              .                :
@echo :              ,        ,               :
@echo :     .        / /_/=\_\ \              :
@echo :              \//  u  \\/  _/\         :
@echo :                \ O O /    \  /        :
@echo :      .         `\\_//`    //\\        :
@echo :                      _/\_             :
@echo :               _/\_   \  /        //\\ :
@echo :               \  /   //\\       //  \\:
@echo :               //\\          ___//    \:
@echo :                            \\         :
@echo :                             \\        :
@echo :                              \\       :
@echo :                              //       :
@echo :.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.:
@echo.
@echo  ---------------------------------------
@echo.                    pow^^!
@echo  ---------------------------------------
@echo.&&@echo.&&@echo.
@ping 0.0.0.0 -n 2 -w 22 >nul 2>nul
for /l %%n in (1,1,17) do (
@cls
@type tmp\flashy.txt
@echo.
@echo.
@echo  ---------------------------------------
@echo.                  
@echo  ---------------------------------------
@echo.&&@echo.&&@echo.
@ping 0.0.0.0 -n 1 -w 1 >nul 2>nul
)
@cls
@echo  _______________________________________ 
@echo :                                       :
@echo :   -  R E G E X - I N V A D E R S  -   :
@echo :  -=-                             -=-  :
@echo : -===-   -===-   -===-   -===-   -===- :
@echo :                                       :
@echo :                   l                   :
@echo :                 \   /                 :
@echo :               -   *   -               :
@echo :                 / M \                 :
@echo :                   M                   :
@echo :                   "                   :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                   `   :
@echo :                   __              ,   :
@echo :l\l\              [\/]      ___    ;   :
@echo :  Oo\_          _.I__I._   [./ l  _u__ :
@echo :___\__D       //-/----\-\\ [___l /____\:
@echo :// `U``       \\=\-==-/=//     I I m E :
@echo :.,.,.,.,.,.,.,.-o-o--o-o-,.,.,.I.I.H.,.:
@echo.
@echo  ---------------------------------------
@echo                     phew^^!
@echo  ---------------------------------------
@echo.&&@echo.&&@echo.
@ping 0.0.0.0 -n 4 -w 44 >nul 2>nul
@cls
@echo  _______________________________________ 
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :             -------------             :
@echo :             '           '             :
@echo :                N E X T                :
@echo :                                       :
@echo :                W A V E                :
@echo :             .           .             :
@echo :             -------------             :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :                                       :
@echo :_______________________________________:
@echo.
@echo  ---------------------------------------
@echo                 level:  %gvar1%
@echo  ---------------------------------------
@echo.&&@echo.&&@echo.
@ping 0.0.0.0 -n 3 -w 7 >nul 2>nul
pause>nul
set /a evar9=222
set /a evar1x=1
set /a evar2x=1
set /a evar3x=1
set pvar1=20
set evar1=10
set evar2=23
set evar3=36
set evar9=222
set bvar1=1
set bvar2=0
set bvar3=20
set gvar2=7
goto :waveloop
exit /b
