 MEMBER
 MAP
   MODULE('API')
     DestroyWindow(LONG),LONG,PASCAL,PROC
     CreateWindowEx(ULONG, *CSTRING, *CSTRING, ULONG, SHORT, SHORT, SHORT, |
     SHORT, UNSIGNED, UNSIGNED, UNSIGNED, ULONG), UNSIGNED, PASCAL, RAW, NAME('CreateWindowExA')
     SendMessage(LONG, LONG, LONG, LONG), LONG, PASCAL, PROC, NAME('SendMessageA')
     MoveWindow(UNSIGNED, SHORT, SHORT, SHORT, SHORT, BOOL),BOOL, PASCAL, PROC, NAME('MoveWindow')
     ShowWindow(UNSIGNED, SHORT), BOOL, PASCAL, NAME('ShowWindow'),PROC
   END
   MODULE('CMDDLG')
     InitCommonControlsEx(*tagInitCommonControlsEx),BOOL,PASCAL,RAW,PROC
   END
 END

 INCLUDE('MONTHCALENDAR.INC')


H_MAX                   EQUATE(0FFFFH + 1)
DTM_FIRST               EQUATE(1000H)
DTN_FIRST               EQUATE(H_MAX - 760)
DTN_LAST                EQUATE(H_MAX - 799)
MCM_FIRST               EQUATE(1000H)
MCN_FIRST               EQUATE(H_MAX - 750)
MCN_LAST                EQUATE(H_MAX - 759)
MCM_GETCURSEL           EQUATE(MCM_FIRST + 1)
MCM_SETCURSEL           EQUATE(MCM_FIRST + 2)
MCN_SELECT              EQUATE(MCN_FIRST + 4)
MCM_SETCOLOR            EQUATE(MCM_FIRST + 10)
MCM_SETTODAY            EQUATE(MCM_FIRST + 12)
MCM_GETTODAY            EQUATE(MCM_FIRST + 13)
MCM_HITTEST             EQUATE(MCM_FIRST + 14)
MCM_SETFIRSTDAYOFWEEK   EQUATE(MCM_FIRST + 15)
MCM_SETRANGE            EQUATE(MCM_FIRST + 18)
MCM_SETMONTHDELTA       EQUATE(MCM_FIRST + 20)

DTN_DATETIMECHANGE      EQUATE(DTN_FIRST + 1)


WM_VSCROLL          EQUATE(115H)
WM_HSCROLL          EQUATE(114H)

WM_COMMAND          EQUATE(111H)
WM_COMMNOTIFY       EQUATE(44H)
 
ICC_DATE_CLASSES    EQUATE(100H)



tagInitCommonControlsEx GROUP,TYPE
lngSize  LONG
lngICC   LONG
                        END



MONTHCAL_CLASSA     EQUATE('SysMonthCal32')


SW_HIDE             EQUATE(0)
SW_SHOWNORMAL       EQUATE(1)
SW_SHOW             EQUATE(5)

gtSYSTEMTIME GROUP,TYPE
wYear           SHORT
wMonth          SHORT
wDayOfWeek      SHORT
wDay            SHORT
wHour           SHORT
wMinute         SHORT
wSecond         SHORT
wMilliseconds   SHORT
           END

MCS_DAYSTATE        EQUATE(0001H)
MCS_MULTISELECT     EQUATE(0002H)
MCS_WEEKNUMBERS     EQUATE(0004H)
MCS_NOTODAYCIRCLE   EQUATE(0008H)
MCS_NOTODAY         EQUATE(0010H)

MCSC_BACKGROUND     EQUATE(0)
MCSC_TEXT           EQUATE(1)
MCSC_TITLEBK        EQUATE(2)
MCSC_TITLETEXT      EQUATE(3)
MCSC_MONTHBK        EQUATE(4)
MCSC_TRAILINGTEXT   EQUATE(5)

GDTR_MIN            EQUATE(0001H)
GDTR_MAX            EQUATE(0002H)

! Window Styles
WS_OVERLAPPED           EQUATE(000000000h)
WS_POPUP                EQUATE(080000000h)
WS_CHILD                EQUATE(040000000h)
WS_MINIMIZE             EQUATE(020000000h)
WS_VISIBLE              EQUATE(010000000h)
WS_DISABLED             EQUATE(008000000h)
WS_CLIPSIBLINGS         EQUATE(004000000h)
WS_CLIPCHILDREN         EQUATE(002000000h)
WS_MAXIMIZE             EQUATE(001000000h)
WS_CAPTION              EQUATE(000C00000h)     ! WS_BORDER + WS_DLGFRAME
WS_BORDER               EQUATE(000800000h)
WS_DLGFRAME             EQUATE(000400000h)
WS_VSCROLL              EQUATE(000200000h)
WS_HSCROLL              EQUATE(000100000h)
WS_SYSMENU              EQUATE(000080000h)
WS_THICKFRAME           EQUATE(000040000h)
WS_GROUP                EQUATE(000020000h)
WS_TABSTOP              EQUATE(000010000h)

WS_MINIMIZEBOX          EQUATE(000020000h)
WS_MAXIMIZEBOX          EQUATE(000010000h)

! Common Window Styles
WS_TILED                EQUATE(WS_OVERLAPPED)
WS_ICONIC               EQUATE(WS_MINIMIZE)
WS_SIZEBOX              EQUATE(WS_THICKFRAME)
WS_OVERLAPPEDWINDOW     EQUATE(WS_OVERLAPPED + WS_CAPTION + WS_SYSMENU + WS_THICKFRAME + WS_MINIMIZEBOX + WS_MAXIMIZEBOX)
WS_POPUPWINDOW          EQUATE(WS_POPUP + WS_BORDER + WS_SYSMENU)
WS_CHILDWINDOW          EQUATE(WS_CHILD)
WS_TILEDWINDOW          EQUATE(WS_OVERLAPPEDWINDOW)

! Extended Window Styles
WS_EX_DLGMODALFRAME         EQUATE(000000001h)
WS_EX_NOPARENTNOTIFY        EQUATE(000000004h)
WS_EX_TOPMOST               EQUATE(000000008h)
WS_EX_ACCEPTFILES           EQUATE(000000010h)
WS_EX_TRANSPARENT           EQUATE(000000020h)

WS_EX_MDICHILD              EQUATE(000000040h)
WS_EX_TOOLWINDOW            EQUATE(000000080h)
WS_EX_WINDOWEDGE            EQUATE(000000100h)
WS_EX_CLIENTEDGE            EQUATE(000000200h)
WS_EX_CONTEXTHELP           EQUATE(000000400h)

WS_EX_RIGHT                 EQUATE(000001000h)
WS_EX_LEFT                  EQUATE(000000000h)
WS_EX_RTLREADING            EQUATE(000002000h)
WS_EX_LTRREADING            EQUATE(000000000h)
WS_EX_LEFTSCROLLBAR         EQUATE(000004000h)
WS_EX_RIGHTSCROLLBAR        EQUATE(000000000h)

WS_EX_CONTROLPARENT         EQUATE(000010000h)
WS_EX_STATICEDGE            EQUATE(000020000h)
WS_EX_APPWINDOW             EQUATE(000040000h)

WS_EX_OVERLAPPEDWINDOW      EQUATE(WS_EX_WINDOWEDGE + WS_EX_CLIENTEDGE)
WS_EX_PALETTEWINDOW         EQUATE(WS_EX_WINDOWEDGE + WS_EX_TOOLWINDOW + WS_EX_TOPMOST)


WHITE_BRUSH         EQUATE(0)

MonthCalendar.Init             PROCEDURE()
iccex  LIKE(tagInitCommonControlsEx)

  CODE

  iccex.lngSize = SIZE(iccex)
  iccex.lngICC  = ICC_DATE_CLASSES
  t# = InitCommonControlsEx(iccex)
  !
  ! Initialize member variables
  !
  SELF.MonthCalHwnd = 0
  SELF.WeekNumbers  = 0

MonthCalendar.CreateCalendar      PROCEDURE(<LONG left>,<LONG Top>,<LONG Width>,<LONG Height>)
   CODE
      RETURN SELF.CreateCalendar2(0, left, Top, Width, Height)   

MonthCalendar.CreateCalendar2      PROCEDURE(<LONG hWndParent>,<LONG left>,<LONG Top>,<LONG Width>,<LONG Height>)
NullString    CSTRING(3)
WorkCSTRING   CSTRING(40)
CalendarStyle LONG

  CODE

  If hWndParent{PROP:ClientHandle} = 0 Then
    RETURN False
  End

  If OMITTED(3)  Then left = 0.
  If OMITTED(4)  Then Top = 0.
  If OMITTED(5)  Then Width = 200.
  If OMITTED(6)  Then Height = 160.
  NullString = ''
  WorkCSTRING = 'SysMonthCal32'
  CalendarStyle = BOR(BOR(WS_CHILD,WS_VISIBLE),SELF.WeekNumbers)
  SELF.MonthCalHwnd = CreateWindowEX(0, WorkCSTRING, NullString, |
                                     CalendarStyle, 0, 0, 0, 0,  |
                                     hWndParent{PROP:ClientHandle}, 0, SYSTEM{PROP:AppInstance}, 0)
  MoveWindow(SELF.MonthCalHwnd, left, Top, Width, Height, True)
  ShowWindow(SELF.MonthCalHwnd, SW_SHOWNORMAL)

  RETURN TRUE
   

MonthCalendar.Kill       PROCEDURE()

  CODE

    If SELF.MonthCalHwnd <> 0 Then
       DestroyWindow(SELF.MonthCalHwnd)
    End



MonthCalendar.GetCalendarDate   PROCEDURE()
RetVal LONG
systime LIKE(gtSYSTEMTIME)

   CODE

   SendMessage(SELF.MonthCalHwnd, MCM_GETCURSEL, 0, ADDRESS(systime))
   RetVal = DATE(systime.wMonth,systime.wDay,systime.wYear)
   RETURN(RetVal)


MonthCalendar.GethWnd    PROCEDURE()

   CODE

   RETURN(SELF.MonthCalHwnd)

MonthCalendar.ShowWeekNumbers       PROCEDURE()

  CODE

  SELF.WeekNumbers = MCS_WEEKNUMBERS 

MonthCalendar.SetBackGrColor          PROCEDURE(LONG NewVal)

  CODE

  SendMessage(SELF.MonthCalHwnd, MCM_SETCOLOR, MCSC_BACKGROUND, NewVal)

MonthCalendar.SetTextColor            PROCEDURE(LONG NewVal)

  CODE

  SendMessage(SELF.MonthCalHwnd, MCM_SETCOLOR, MCSC_TEXT , NewVal)

MonthCalendar.SetTitleBackGrColor     PROCEDURE(LONG NewVal)

  CODE

  SendMessage(SELF.MonthCalHwnd, MCM_SETCOLOR, MCSC_TITLEBK , NewVal)

MonthCalendar.SetTitleColor           PROCEDURE(LONG NewVal)

  CODE

  SendMessage(SELF.MonthCalHwnd, MCM_SETCOLOR, MCSC_TITLETEXT , NewVal)

MonthCalendar.SetMonthBackGrColor     PROCEDURE(LONG NewVal)

  CODE

  SendMessage(SELF.MonthCalHwnd, MCM_SETCOLOR, MCSC_MONTHBK , NewVal)

MonthCalendar.SetTrailTextColor       PROCEDURE(LONG NewVal)

  CODE

  SendMessage(SELF.MonthCalHwnd, MCM_SETCOLOR, MCSC_TRAILINGTEXT , NewVal)

MonthCalendar.SetFirstDayOfWeek       PROCEDURE(LONG NewVal)

  CODE

  SendMessage(SELF.MonthCalHwnd, MCM_SETFIRSTDAYOFWEEK, 0 , NewVal)

MonthCalendar.SetDate       PROCEDURE(LONG NewVal)
systime LIKE(gtSYSTEMTIME)

  CODE

  systime.wMonth = MONTH(NewVal)
  systime.wDay   = DAY(NewVal)
  systime.wYear  = YEAR(NewVal)

  SendMessage(SELF.MonthCalHwnd, MCM_SETCURSEL, 0 , ADDRESS(systime))

MonthCalendar.SetDateRange       PROCEDURE(<LONG MinDate>,<LONG MaxDate>)
MinDateFlag LONG
MaxDateFlag LONG
SysTimeArray GROUP
SysTimeMin LIKE(gtSYSTEMTIME)
SysTimeMax LIKE(gtSYSTEMTIME)
             END

  CODE

  MinDateFlag = 0
  MaxDateFlag = 0
  If Not OMITTED(2) Then ! MinDate exists
    MinDateFlag = GDTR_MIN
    SysTimeArray.SysTimeMin.wMonth = MONTH(MinDate)
    SysTimeArray.SysTimeMin.wDay   = DAY(MinDate)
    SysTimeArray.SysTimeMin.wYear  = YEAR(MinDate)
  End

  If Not OMITTED(3) Then ! MaxDate exists
    MaxDateFlag = GDTR_MAX
    SysTimeArray.SysTimeMax.wMonth = MONTH(MaxDate)
    SysTimeArray.SysTimeMax.wDay   = DAY(MaxDate)
    SysTimeArray.SysTimeMax.wYear  = YEAR(MaxDate)
  End

  SendMessage(SELF.MonthCalHwnd, MCM_SETRANGE, BOR(MinDateFlag,MaxDateFlag) , ADDRESS(SysTimeArray))

MonthCalendar.SetTodayDate  PROCEDURE(LONG NewVal)
systime LIKE(gtSYSTEMTIME)

  CODE

  systime.wMonth = MONTH(NewVal)
  systime.wDay   = DAY(NewVal)
  systime.wYear  = YEAR(NewVal)

  SendMessage(SELF.MonthCalHwnd, MCM_SETTODAY, 0 , ADDRESS(systime))

MonthCalendar.SetMonthDelta       PROCEDURE(SHORT NewVal)

  CODE

  SendMessage(SELF.MonthCalHwnd, MCM_SETMONTHDELTA, NewVal , 0)

