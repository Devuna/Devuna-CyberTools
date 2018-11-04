
!ABCIncludeFile(ABC)

!================================================================
!Copyright ©2007-2014 Devuna
!Creation Date: 2007/02/20
!================================================================

!  COMPILE('ENDCOMPILE',_ABCLinkMode_)
!    PRAGMA ('link (shfolder.lib)')
!  !ENDCOMPILE

OMIT('_EndOfInclude_',_vistaINIClassPresent_)
_vistaINIClassPresent_ EQUATE(1)

    INCLUDE('ABUTIL.INC'),ONCE

CSIDL_DESKTOP                   EQUATE(00000h)      !{desktop}
CSIDL_INTERNET                  EQUATE(00001h)      !Internet Explorer (icon on desktop)
CSIDL_PROGRAMS                  EQUATE(00002h)      !Start Menu\Programs
CSIDL_CONTROLS                  EQUATE(00003h)      !My Computer\Control Panel
CSIDL_PRINTERS                  EQUATE(00004h)      !My Computer\Printers
CSIDL_PERSONAL                  EQUATE(00005h)      !My Documents
CSIDL_FAVORITES                 EQUATE(00006h)      !{user name}\Favorites
CSIDL_STARTUP                   EQUATE(00007h)      !Start Menu\Programs\Startup
CSIDL_RECENT                    EQUATE(00008h)      !{user name}\Recent
CSIDL_SENDTO                    EQUATE(00009h)      !{user name}\SendTo
CSIDL_BITBUCKET                 EQUATE(0000Ah)      !{desktop}\Recycle Bin
CSIDL_STARTMENU                 EQUATE(0000Bh)      !{user name}\Start Menu
CSIDL_MYMUSIC                   EQUATE(0000Dh)      ! "My Music" folder
CSIDL_DESKTOPDIRECTORY          EQUATE(00010h)      !{user name}\Desktop
CSIDL_DRIVES                    EQUATE(00011h)      !My Computer
CSIDL_NETWORK                   EQUATE(00012h)      !Network Neighborhood
CSIDL_NETHOOD                   EQUATE(00013h)      !{user name}\nethood
CSIDL_FONTS                     EQUATE(00014h)      !windows\fonts
CSIDL_TEMPLATES                 EQUATE(00015h)
CSIDL_COMMON_STARTMENU          EQUATE(00016h)      !All Users\Start Menu
CSIDL_COMMON_PROGRAMS           EQUATE(00017h)      !All Users\Programs
CSIDL_COMMON_STARTUP            EQUATE(00018h)      !All Users\Startup
CSIDL_COMMON_DESKTOPDIRECTORY   EQUATE(00019h)      !All Users\Desktop
CSIDL_APPDATA                   EQUATE(0001Ah)      !{user name}\Application Data
CSIDL_PRINTHOOD                 EQUATE(0001Bh)      !{user name}\PrintHood
CSIDL_LOCAL_APPDATA             EQUATE(0001Ch)      !{user name}\Local Settings\Application Data (non roaming)
CSIDL_ALTSTARTUP                EQUATE(0001Dh)      !non localized startup
CSIDL_COMMON_ALTSTARTUP         EQUATE(0001Eh)      !non localized common startup
CSIDL_COMMON_FAVORITES          EQUATE(0001Fh)
CSIDL_INTERNET_CACHE            EQUATE(00020h)
CSIDL_COOKIES                   EQUATE(00021h)
CSIDL_HISTORY                   EQUATE(00022h)
CSIDL_COMMON_APPDATA            EQUATE(00023h)      !All Users\Application Data
CSIDL_WINDOWS                   EQUATE(00024h)      !GetWindowsDirectory()
CSIDL_SYSTEM                    EQUATE(00025h)      !GetSystemDirectory()
CSIDL_PROGRAM_FILES             EQUATE(00026h)      !C:\Program Files
CSIDL_MYPICTURES                EQUATE(00027h)      !C:\Program Files\My Pictures
CSIDL_PROFILE                   EQUATE(00028h)      !USERPROFILE
CSIDL_SYSTEMX86                 EQUATE(00029h)      !x86 system directory on RISC
CSIDL_PROGRAM_FILESX86          EQUATE(0002Ah)      !x86 C:\Program Files on RISC
CSIDL_PROGRAM_FILES_COMMON      EQUATE(0002Bh)      !C:\Program Files\Common
CSIDL_PROGRAM_FILES_COMMONX86   EQUATE(0002Ch)      !x86 Program Files\Common on RISC
CSIDL_COMMON_TEMPLATES          EQUATE(0002Dh)      !All Users\Templates
CSIDL_COMMON_DOCUMENTS          EQUATE(0002Eh)      !All Users\Documents
CSIDL_COMMON_ADMINTOOLS         EQUATE(0002Fh)      !All Users\Start Menu\Programs\Administrative Tools
CSIDL_ADMINTOOLS                EQUATE(00030h)      !{user name}\Start Menu\Programs\Administrative Tools
CSIDL_RESOURCES                 EQUATE(00038h)      ! %windir%\Resources\, For theme and other windows resources.
CSIDL_RESOURCES_LOCALIZED       EQUATE(00039h)      ! %windir%\Resources\<LangID>, for theme and other windows specific resources.

CSIDL_FLAG_CREATE               EQUATE(8000h)       !combine with CSIDL_ value to force create on SHGetSpecialFolderLocation()
CSIDL_FLAG_DONT_VERIFY          EQUATE(4000h)       !combine with CSIDL_ value to force create on SHGetSpecialFolderLocation()
CSIDL_FLAG_MASK                 EQUATE(0FF00h)      !mask for all possible flag values


vistaINIClass       CLASS(INIClass),TYPE,MODULE('vistaINIClass.clw'),LINK('vistaINIClass.clw',_ABCLinkMode_),DLL(_ABCDllMode_)
m_SubFolder           CSTRING(65),PROTECTED

Construct             PROCEDURE()
Init                  PROCEDURE(STRING FileName, UNSIGNED nvType, LONG extraData = 0) !,EXTENDS
SetSubFolder          PROCEDURE(STRING SubFolder)
                    END

!_EndOfInclude_
