  MEMBER
!================================================================
!Copyright ©2007-2014 Devuna
!Creation Date: 2007/02/20
!================================================================

HANDLE  EQUATE(LONG)
HWND    EQUATE(HANDLE)
HRESULT EQUATE(HANDLE)
DWORD   EQUATE(LONG)
S_OK    EQUATE(0)

  INCLUDE('vistaINIClass.inc'),ONCE

  MAP
    MODULE('kernel32.dll')
      kcr_CreateDirectory(*CSTRING szPath, LONG lpSecurityAttributes),BOOL,PASCAL,RAW,NAME('CreateDirectoryA')
! KV 2010.09.15      kcr_GetLastError(),LONG,PASCAL,NAME('GetLastError')
    END
    MODULE('Shfolder.dll') ! SHfolder is used to support Windows 2000, ME and prior versions. All newer version of Windows have these functions located ni Shell32. KV 2010.09.21
      kcr_SHGetFolderPath(HWND hwnd, LONG csidl, HANDLE hToken, DWORD dwFlags, *CSTRING szPath),HRESULT,RAW,PASCAL,NAME('SHGetFolderPathA')
    END
  END

!======================================================================================
! vistaINIClass.Construct Method
!=======================================================================================
vistaINIClass.Construct PROCEDURE
  CODE
    SELF.m_subfolder = ''
    RETURN

!======================================================================================
! vistaINIClass.Init Method
!=======================================================================================
vistaINIClass.Init    PROCEDURE(STRING FileName, UNSIGNED nvType, LONG extraData = 0) !,EXTENDS
hr          HRESULT
hFile       HANDLE
szPath      CSTRING(File:MaxFilePath)

  CODE
    !check for INI file type
    IF nvType = NVD_INI
       !check for simple filename
       IF ~INSTRING('\',FileName)
          !hr = kcr_SHGetFolderPath(0,CSIDL_COMMON_APPDATA,0,0,szPath)
          hr = kcr_SHGetFolderPath(0,CSIDL_PERSONAL,0,0,szPath)
          IF hr = S_OK
             szPath = LONGPATH(szPath) & SELF.m_Subfolder
             IF kcr_CreateDirectory(szPath,0)
                PARENT.Init(szPath & '\' & FileName, nvType, extraData)
             ELSE
                !IF kcr_GetLastError() = ERROR_ALREADY_EXISTS KV commented out just to get the class to compile in Clarion 7
                IF EXISTS(szPath)			
                   PARENT.Init(szPath & '\' & FileName, nvType, extraData)
                ELSE
                   PARENT.Init(FileName, nvType, extraData)
                END
             END
          ELSE
             PARENT.Init(FileName, nvType, extraData)
          END
       ELSE
          PARENT.Init(FileName, nvType, extraData)
       END
    ELSE
       PARENT.Init(FileName, nvType, extraData)
    END
    RETURN

!======================================================================================
! vistaINIClass.SetSubFolder Method
!=======================================================================================
vistaINIClass.SetSubFolder PROCEDURE(STRING SubFolder)
   CODE
      SELF.m_SubFolder = SubFolder
      RETURN

