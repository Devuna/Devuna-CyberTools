
  MEMBER
!================================================================
!Copyright ©2007-2014 Devuna
!Creation Date: 2007/02/20
!================================================================

  INCLUDE('CWSYNCHM.INC'),ONCE
  INCLUDE('CWSYNCHC.INC'),ONCE
  INCLUDE('kcrINIClass.inc'),ONCE
  
tempFilename   CSTRING(261),STATIC
tempFile       FILE,DRIVER('ASCII'),CREATE,PRE(temp),NAME(tempFilename)
                  RECORD
RecordBuffer         STRING(2000)                  
                  END
               END   

!======================================================================================
! kcrINIClass.Construct Method
!=======================================================================================
kcrINIClass.Construct PROCEDURE
  CODE
    SELF.m_Subfolder = '\Devuna'
    RETURN


!======================================================================================
! kcrINIClass.SetModuleName method
!=======================================================================================
kcrINIClass.SetModuleName   PROCEDURE(STRING ModuleName)
   CODE
      SELF.ModuleName = ModuleName
      RETURN


!======================================================================================
! kcrINIClass.Init Method
!=======================================================================================
kcrINIClass.Init    PROCEDURE(STRING FileName, UNSIGNED nvType, LONG extraData = 0) !,EXTENDS
  CODE
    PARENT.Init(FileName, nvType, extraData)
    RETURN

!======================================================================================
! kcrINIClass.Kill Method
!=======================================================================================
kcrINIClass.Kill    PROCEDURE()
critProc       CriticalProcedure

  CODE
    critProc.init(SELF.critSect) 
    PARENT.Kill()
    SELF.CleanUp()
    RETURN
    
!======================================================================================
! kcrINIClass.FetchQueue Method
!=======================================================================================
kcrINIClass.FetchQueue     PROCEDURE(STRING Sector,STRING Name,QUEUE Q,*? F1,<*? F2>,<*? F3>,<*? F4>)
critProc       CriticalProcedure

   CODE
      critProc.init(SELF.critSect)
      IF CLIP(Sector) = '__Dont_Touch_Me__'
         IF SELF.ModuleName <> ''
            PARENT.FetchQueue(Sector, SELF.ModuleName & '_' & Name, Q, F1, F2, F3, F4)
         ELSE
            PARENT.FetchQueue(Sector, Name, Q, F1, F2, F3, F4)      
         END
      ELSE   
         PARENT.FetchQueue(Sector, Name, Q, F1, F2, F3, F4)      
      END
      RETURN    
    
!======================================================================================
! kcrINIClass.UpdateQueue Method
!=======================================================================================
kcrINIClass.UpdateQueue    PROCEDURE(STRING Sector,STRING Name,QUEUE Q,*? F1,<*? F2>,<*? F3>,<*? F4>)
critProc       CriticalProcedure

   CODE
      critProc.init(SELF.critSect)

      IF CLIP(Sector) = '__Dont_Touch_Me__'
         IF SELF.ModuleName <> ''
            PARENT.UpdateQueue(Sector, SELF.ModuleName & '_' & Name, Q, F1, F2, F3, F4)
         ELSE
            PARENT.UpdateQueue(Sector, Name, Q, F1, F2, F3, F4)      
         END
      ELSE   
         PARENT.UpdateQueue(Sector, Name, Q, F1, F2, F3, F4)      
      END
      RETURN
      
      
!======================================================================================
! kcrINIClass.DeleteQuery Method
! marks query parameters for deletion (changes first two characters to //)
!=======================================================================================
kcrINIClass.DeleteQuery PROCEDURE(STRING Family, *CSTRING QueryToDelete) !,LONG
critProc       CriticalProcedure
Sector         CSTRING(81)
ReturnValue    LONG(Level:Fatal)
               
   CODE
   critProc.init(SELF.critSect)

   Sector = SELF.GetSector(Family,QueryToDelete,'Query')

   tempFileName = SELF.FileName
   OPEN(tempFile,ReadWrite+DenyNone)
   IF NOT ERRORCODE()
      SET(tempFile)
      NEXT(tempFile)
      LOOP UNTIL ERRORCODE()
        IF tempFile.RecordBuffer[1 : LEN(Sector)] = Sector
           tempFile.RecordBuffer[1] = '/'
           tempFile.RecordBuffer[2] = '/'
           PUT(tempFile)
        END
        NEXT(tempFile)
      END
      CLOSE(tempFile)
      ReturnValue = Level:Benign
   END
   RETURN ReturnValue

!======================================================================================
! kcrINIClass.CleanUp Method
! clean up QBE junk left in the ini file
! - remove extra sectors from [__Dont_Touch_Me__] section
! - remove deleted queries (marked with // at the beginning of the record)
!=======================================================================================
kcrINIClass.CleanUp PROCEDURE() !,LONG
critProc       CriticalProcedure
RecordQueue    QUEUE,PRE(q)
RecordBuffer      LIKE(tempFile.RecordBuffer)
               END
I              LONG
J              LONG
P              LONG
thisGroup      CSTRING(81)
thisCount      LONG
ReturnValue    LONG(Level:Fatal)
SectorQ        QUEUE,PRE(SQ)
Sector            LIKE(tempFile.RecordBuffer)
               END
               
   CODE
   critProc.init(SELF.critSect)

   tempFileName = SELF.FileName
   OPEN(tempFile,ReadWrite+DenyAll)
   IF NOT ERRORCODE()
      SET(tempFile)
      NEXT(tempFile)
      LOOP UNTIL ERRORCODE()
        IF tempFile.RecordBuffer[1 : 2] = '//'
           !skip query records marked for deletion
           NEXT(tempFile)
        ELSE          
           IF tempFile.RecordBuffer = '[__Dont_Touch_Me__]'
              !!!Region Sector Cleanup
              FREE(SectorQ)
              RecordQueue.RecordBuffer = tempFile.RecordBuffer
              ADD(RecordQueue)
              NEXT(tempFile)
              
              !CleanUp Sectors
              LOOP UNTIL ERRORCODE()
                 IF tempFile.RecordBuffer[1] = '['
                    BREAK
                 ELSE
                    SectorQ.Sector = tempFile.RecordBuffer
                    IF CLIP(SectorQ.Sector) <> ''
                       ADD(SectorQ)
                    END 
                    NEXT(TempFile)
                 END
              END
              
              SORT(SectorQ,+SectorQ.Sector)
              J = RECORDS(SectorQ)
              LOOP I = 1 TO J
                 GET(SectorQ,I)
                 
                 P = INSTRING('=',SectorQ.Sector)
                 IF P > 0
                    RecordQueue.RecordBuffer = SectorQ.Sector
                    ADD(RecordQueue)
                    thisGroup = SectorQ.Sector[1 : p-1]
                    thisCount = SectorQ.Sector[p+1 : LEN(CLIP(SectorQ.Sector))]
                    LOOP thisCount TIMES
                       I += 1
                       GET(SectorQ,I)
                       IF ERRORCODE()
                          BREAK
                       ELSE   
                          RecordQueue.RecordBuffer = SectorQ.Sector
                          ADD(RecordQueue)
                       END
                    END
                    LOOP
                       I += 1
                       GET(SectorQ,I)
                       IF ERRORCODE()
                          BREAK
                       ELSIF SectorQ.Sector[1 : LEN(thisGroup)] <> thisGroup
                          I -= 1
                          BREAK
                       END   
                    END
                 ELSE
                    RecordQueue.RecordBuffer = SectorQ.Sector
                    ADD(RecordQueue)
                    BREAK
                 END
              END   
              !add a blank line
              RecordQueue.RecordBuffer = ''
              ADD(RecordQueue)              
              !start of next section
              RecordQueue.RecordBuffer = tempFile.RecordBuffer
              ADD(RecordQueue)              
              NEXT(tempFile)
              !!!EndRegion              
           ELSE
              RecordQueue.RecordBuffer = tempFile.RecordBuffer
              ADD(RecordQueue)
              NEXT(tempFile)
           END   
        END
      END
      EMPTY(tempFile)
      J = RECORDS(RecordQueue)
      LOOP I = 1 TO J
         GET(RecordQueue,I)
         tempFile.RecordBuffer = RecordQueue.RecordBuffer
         ADD(tempFile)
      END
      CLOSE(tempFile)
      ReturnValue = Level:Benign
   END
   RETURN ReturnValue