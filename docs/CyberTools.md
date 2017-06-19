# CyberTools Library Functions #


----------


## Date / Time functions
>DayofWeek(LONG pDate),STRING                                                            !Return the day of the week

>Calendar(*? PassedDate),BYTE,PROC                                                       !Calendar

>CalendarOLD(*?pDate)                                                                   !Three Month Calendar

>cwdate(LONG vbdate),LONG                                                                !convert vbdate to clarion date

>cwtime(LONG vbtime),LONG                                                                !convert vbtime to clarion time

>DateTimeToMinutes(LONG pDate, LONG pTime),ULONG                                         !convert data and time to minutes

>IsHoliday(LONG pDate,*CSTRING szHolidayName),BOOL                                       !TRUE if passed date is a holiday

>srcCalculateHolidays(HOLIDAY:QUEUETYPE HYQ, LONG pYear, STRING pProvince, STRING pCountry)   !SEE EXTENDED DESCRIPTION

>vbdate(LONG cwDate),LONG                                                                !convert clarion date to vbdate

>vbtime(LONG cwTime),LONG                                                                !convert clarion time to vbtime

## ds functions ##

>ds\_Message(STRING MessageTxt,<STRING HeadingTxt>,<STRING IconSent>,<STRING ButtonsPar>,UNSIGNED Defaults=0,BOOL StylePar=FALSE),UNSIGNED,PROC,name('ds_Message')   !

>ds\_Stop(<string StopText>),name('ds_Stop')                                              !

>ds_Halt(UNSIGNED Level=0,<STRING HaltText>),name('ds\_Halt')                             !

## Expression Builder functions

>ExpressionBuilder(*QUEUE loc:VarQueue, *CSTRING loc:PassedTable, *CSTRING loc:PassedField, *CSTRING ReturnedExpression, BindFile PassedBindFile, UnBindfile PassedUnbindFile)   !Protocol Locking Configuration Database Table

>ValueWindow(STRING PictureString),STRING                                                !Expression Builder Value Entry Window

## GUID functions

>GUIDFromString(*CSTRING szString),STRING

>GUIDToString(*GUID uuid),STRING

>GUIDToString2(*GROUP uuid),STRING

>newGUID(),STRING

## Registry functions

>PutRegistry(STRING pSectionName, STRING pTokenLabel, STRING pNewValue, <STRING pFileName>, <STRING pUserName>)                      !Put Registry Information

>GetRegistry(STRING pSectionName, STRING pTokenLabel, <STRING pDefaultValue>, <STRING pDummyParameter>, <STRING pUserName>),STRING   !Get Registry Data

>DeleteRegistry(STRING pSectionName, STRING pTokenLabel, STRING pNewValue, <STRING pFileName>, <STRING pUserName>)                   !Delete Registry Information


## Text Manipulation functions

>FullName(*CSTRING FName, *CSTRING MI, *CSTRING LName, *CSTRING FullName)                !Full Name

>NumberToText(*DECIMAL pAmount, BYTE pFlag, *CSTRING TextAmount)                         !Number To Text Converter

>ProperString(*CSTRING PassedString)                                                     !Proper Passed String

>RemoveCharacter(STRING PassedCharacter, *CSTRING PassedString)                          !Remove A Character From A Passed String

>SplitFullName(*CSTRING szFullName, *CSTRING szFirstName, *CSTRING szMiddleName, *CSTRING szLastName)                        !Split Fullname into Component Names

>WordWrapText(*CSTRING TextToWrap, *QUEUE TextQueue, *STRING TextQueueField, BYTE TextLength, BYTE TextLines)                !Word Wrap Text

## Thread Management functions

>_AddThread(LONG pThdNumber,STRING pThdName,<LONG pThdMaxInstance>,<LONG pThdParam1>,<LONG pThdParam2>,<LONG pThdParam3>,<LONG pThdParam4>,<STRING pThdBuffer>)   !Add Thread Queue Entry

>CloseThreads()                                                                          !Close All Threads

>DeleteThread()                                                                          !Delete Thread Queue Entry

>FindThread(STRING pThdName,<LONG pThdInstance>,*GROUP pThdRecord,<STRING pThdOrdinal>)  !Find Thread from Queue

>GetThread(LONG,*GROUP)                                                                  !Get Thread from Queue

>SendThread(STRING pThdName, LONG pThdEvent)                                             !Send Thread An Event

>Instances(STRING pThdName),LONG                                                         !Get Thread Instance Count

>PutThread(LONG pThd, *GROUP pThdRecord)                                                 !Get Thread from Queue

>Threads(),BYTE                                                                          !Get Number of Threads

## Windows API functions

>EnumPrinters(*QUEUE pQueue, *CSTRING pPrinterName),LONG                                 !Enumerate Printers

>GetCtrlRect(window OleWin, long feq, *RECT rc)                                          !get control rectangle

>GetDiskFreeSpace(*CSTRING szDirectoryName, *DECIMAL nFreeBytesAvail, *DECIMAL nTotalNumberOfBytes, *DECIMAL nTotalNumberOfFreeBytes),BYTE   !

>OpportunisticLockingDisabled(),BYTE                                                     !Returns TRUE if OpLocks are disabled

>srcURLHandler(UNSIGNED wHandle, STRING URL),UNSIGNED,PROC                               !shell execute handler


## Other Useful functions

>BodySurface(REAL PassedHeight, REAL PassedWeight),REAL                                  !Calculate Body Surface

>Calculator()                                                                            !Calculator

>CopyFile(*CSTRING FromFileName, *CSTRING ToFileName)                                    !Copy File From One To Another

>C3ResizeControls(SHORT AnchorCTL, SHORT Resize:CWidth, SHORT Resize:CHeight)            !Resize Controls On Window

>RGB(LONG r, LONG g, LONG b),LONG                                                        !convert r,g,b to color

>StdDev(*QUEUE pQueue, *DECIMAL pValue, *DECIMAL pStdDev)                                !Standard Deviation

>Word:SpellCheck(*CSTRING p\_TextToCheck, BYTE p_Quiet=0)                                 !SpellCheck using word ole
>
>WAVControl(STRING ControlType, USHORT DeviceID, ULONG CallingWindow, \*CSTRING WAVFileName, <*ULONG PassedPosition>),USHORT  !Control WAV File

