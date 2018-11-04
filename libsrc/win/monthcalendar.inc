
!ABCIncludeFile

MonthCalendar CLASS,TYPE,MODULE('MONTHCALENDAR.CLW'),LINK('MONTHCALENDAR.CLW') !,_ABCLinkMode_),DLL(_ABCDllMode_)

!Private properties
MonthCalHwnd      LONG
MonthCalParent    LONG
WeekNumbers       LONG
!Public Properties
GethWnd                 PROCEDURE(),LONG
SetBackGrColor          PROCEDURE(LONG lColor)
SetTextColor            PROCEDURE(LONG lColor)
SetTitleBackGrColor     PROCEDURE(LONG lColor)
SetTitleColor           PROCEDURE(LONG lColor)
SetMonthBackGrColor     PROCEDURE(LONG lColor)
SetTrailTextColor       PROCEDURE(LONG lColor)
!Methods
Init              PROCEDURE()
Kill              PROCEDURE()
ShowWeekNumbers   PROCEDURE()
SetDate           PROCEDURE(LONG lDate)
SetDateRange      PROCEDURE(<LONG lDateLow>,<LONG lDateHigh>)
SetFirstDayOfWeek PROCEDURE(LONG lDayOfWeek)
SetTodayDate      PROCEDURE(LONG lDate)
SetMonthDelta     PROCEDURE(SHORT lMonthDelta)
CreateCalendar    PROCEDURE(<LONG Left>,<LONG Top>,<LONG Width>,<LONG Height>),SHORT,PROC
CreateCalendar2   PROCEDURE(<LONG hWndParent>,<LONG Left>,<LONG Top>,<LONG Width>,<LONG Height>),SHORT,PROC
GetCalendarDate   PROCEDURE(),LONG
               END
!_EndOfInclude_

