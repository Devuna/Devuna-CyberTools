
!ABCIncludeFile(ABC)

!================================================================
!Copyright ©2007-2014 Devuna
!Creation Date: 2007/02/20
!================================================================

OMIT('_EndOfInclude_',_kcrINIClassPresent_)
_kcrINIClassPresent_ EQUATE(1)

    INCLUDE('ABUTIL.INC'),ONCE
    INCLUDE('vistaINIClass.inc'),ONCE

kcrINIClass         CLASS(vistaINIClass),TYPE,MODULE('kcrINIClass.clw'),LINK('kcrINIClass.clw',_ABCLinkMode_),DLL(_ABCDllMode_)
ModuleName            CSTRING(31)
Construct             PROCEDURE()
SetModuleName         PROCEDURE(STRING ModuleName)
Init                  PROCEDURE(STRING FileName, UNSIGNED nvType, LONG extraData = 0) !,EXTENDS
Kill                  PROCEDURE()
FetchQueue            PROCEDURE(STRING Sector,STRING Name,QUEUE Q,*? F1,<*? F2>,<*? F3>,<*? F4>),DERIVED
UpdateQueue           PROCEDURE(STRING Sector,STRING Name,QUEUE Q,*? F1,<*? F2>,<*? F3>,<*? F4>),DERIVED
DeleteQuery           PROCEDURE(STRING Family, *CSTRING QueryToDelete),LONG,PROC
CleanUp               PROCEDURE(),LONG,PROC
                    END

!_EndOfInclude_
