!region Notices
! ================================================================================
! Notice : Copyright (C) 2017, Devuna
!          Distributed under the MIT License (https://opensource.org/licenses/MIT)
!
!    This file is part of Devuna-CyberTools (https://github.com/Devuna/Devuna-CyberTools)
!
!    Devuna-CyberTools is free software: you can redistribute it and/or modify
!    it under the terms of the MIT License as published by
!    the Open Source Initiative.
!
!    Devuna-CyberTools is distributed in the hope that it will be useful,
!    but WITHOUT ANY WARRANTY; without even the implied warranty of
!    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!    MIT License for more details.
!
!    You should have received a copy of the MIT License
!    along with Devuna-CyberTools.  If not, see <https://opensource.org/licenses/MIT>.
! ================================================================================
!EndRegion Notice
  MODULE('CYBERTOOLS.DLL')
    CalendarOLD(*? pDate)                                                                   !Three Month Calendar
    WordWrapText(*CSTRING TextToWrap, *QUEUE TextQueue, *STRING TextQueueField, BYTE TextLength, BYTE TextLines)                !Word Wrap Text
    FullName(*CSTRING FName, *CSTRING MI, *CSTRING LName, *CSTRING FullName)                !Full Name
    ProperString(*CSTRING PassedString)                                                     !Proper Passed String
    RemoveCharacter(STRING PassedCharacter, *CSTRING PassedString)                          !Remove A Character From A Passed String
    SplitFullName(*CSTRING szFullName, *CSTRING szFirstName, *CSTRING szMiddleName, *CSTRING szLastName)                        !Split Fullname into Component Names
    WAVControl(STRING ControlType, USHORT DeviceID, ULONG CallingWindow, *CSTRING WAVFileName, <*ULONG PassedPosition>),USHORT  !Control WAV File
    BodySurface(REAL PassedHeight, REAL PassedWeight),REAL                                  !Calculate Body Surface
    C3ResizeControls(SHORT AnchorCTL, SHORT Resize:CWidth, SHORT Resize:CHeight)            !Resize Controls On Window
    CopyFile(*CSTRING FromFileName, *CSTRING ToFileName)                                    !Copy File From One To Another
    _AddThread(LONG pThdNumber,STRING pThdName,<LONG pThdMaxInstance>,<LONG pThdParam1>,<LONG pThdParam2>,<LONG pThdParam3>,<LONG pThdParam4>,<STRING pThdBuffer>)   !Add Thread Queue Entry
    DeleteThread()                                                                          !Delete Thread Queue Entry
    FindThread(STRING pThdName,<LONG pThdInstance>,*GROUP pThdRecord,<STRING pThdOrdinal>)  !Find Thread from Queue
    CloseThreads()                                                                          !Close All Threads
    Threads(),BYTE                                                                          !Get Number of Threads
    Instances(STRING pThdName),LONG                                                         !Get Thread Instance Count
    GetThread(LONG,*GROUP)                                                                  !Get Thread from Queue
    SendThread(STRING pThdName, LONG pThdEvent)                                             !Send Thread An Event
    PutThread(LONG pThd, *GROUP pThdRecord)                                                 !Get Thread from Queue
    PutRegistry(STRING pSectionName, STRING pTokenLabel, STRING pNewValue, <STRING pFileName>, <STRING pUserName>)                      !Put Registry Information
    GetRegistry(STRING pSectionName, STRING pTokenLabel, <STRING pDefaultValue>, <STRING pDummyParameter>, <STRING pUserName>),STRING   !Get Registry Data
    DeleteRegistry(STRING pSectionName, STRING pTokenLabel, STRING pNewValue, <STRING pFileName>, <STRING pUserName>)                   !Delete Registry Information
    NumberToText(*DECIMAL pAmount, BYTE pFlag, *CSTRING TextAmount)                         !Number To Text Converter
    EnumPrinters(*QUEUE pQueue, *CSTRING pPrinterName),LONG                                 !Enumerate Printers
    StdDev(*QUEUE pQueue, *DECIMAL pValue, *DECIMAL pStdDev)                                !Standard Deviation
    GetDiskFreeSpace(*CSTRING szDirectoryName, *DECIMAL nFreeBytesAvail, *DECIMAL nTotalNumberOfBytes, *DECIMAL nTotalNumberOfFreeBytes),BYTE   !
    Calculator()                                                                            !Calculator
    DayofWeek(LONG pDate),STRING                                                            !Return the day of the week
    Calendar(*? PassedDate),BYTE,PROC                                                       !Calendar
    srcCalculateHolidays(HOLIDAY:QUEUETYPE HYQ, LONG pYear, STRING pProvince, STRING pCountry)   !SEE EXTENDED DESCRIPTION
    ds_Message(STRING MessageTxt,<STRING HeadingTxt>,<STRING IconSent>,<STRING ButtonsPar>,UNSIGNED Defaults=0,BOOL StylePar=FALSE),UNSIGNED,PROC,name('ds_Message')   !
    ds_Stop(<string StopText>),name('ds_Stop')                                              !
    ds_Halt(UNSIGNED Level=0,<STRING HaltText>),name('ds_Halt')                             !
    OpportunisticLockingDisabled(),BYTE                                                     !Returns TRUE if OpLocks are disabled
    vbdate(LONG cwDate),LONG                                                                !convert clarion date to vbdate
    vbtime(LONG cwTime),LONG                                                                !convert clarion time to vbtime
    cwdate(LONG vbdate),LONG                                                                !convert vbdate to clarion date
    cwtime(LONG vbtime),LONG                                                                !convert vbtime to clarion time
    DateTimeToMinutes(LONG pDate, LONG pTime),ULONG                                         !convert data and time to minutes
    GetCtrlRect(window OleWin, long feq, *RECT rc)                                          !get control rectangle
    RGB(LONG r, LONG g, LONG b),LONG                                                        !convert r,g,b to color
    IsHoliday(LONG pDate,*CSTRING szHolidayName),BOOL                                       !TRUE if passed date is a holiday
    Word:SpellCheck(*CSTRING p_TextToCheck, BYTE p_Quiet=0)                                 !SpellCheck using word ole
    srcURLHandler(UNSIGNED wHandle, STRING URL),UNSIGNED,PROC                               !shell execute handler
    GUIDFromString(*CSTRING szString),STRING
    GUIDToString(*GUID uuid),STRING
    GUIDToString2(*GROUP uuid),STRING
    newGUID(),STRING
  END