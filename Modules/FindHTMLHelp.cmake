# 
# This module looks for Microsoft HTML Help Compiler
# It defines:
#   HTML_HELP_COMPILER     : full path to the HTML Help Compiler (hhc.exe)
#   HTML_HELP_INCLUDE_PATH : include path to the HTML Help API (htmlhelp.h)
#	HTML_HELP_LIBRARY      : full path to the HTML Help library (htmlhelp.lib)
#

IF (WIN32)

  FIND_PROGRAM (HTML_HELP_COMPILER
    hhc
    "[HKEY_CURRENT_USER\\Software\\Microsoft\\HTML Help Workshop;InstallDir]"
    "C:/Program Files/HTML Help Workshop" 
  )

  GET_FILENAME_COMPONENT (HTML_HELP_COMPILER_PATH ${HTML_HELP_COMPILER} PATH)

  FIND_PATH (HTML_HELP_INCLUDE_PATH 
    htmlhelp.h 
    "${HTML_HELP_COMPILER_PATH}/include"
    "[HKEY_CURRENT_USER\\Software\\Microsoft\\HTML Help Workshop;InstallDir]/include"
    "C:/Program Files/HTML Help Workshop/include" 
  )

  FIND_LIBRARY (HTML_HELP_LIBRARY 
    htmlhelp
    "${HTML_HELP_COMPILER_PATH}/lib"
    "[HKEY_CURRENT_USER\\Software\\Microsoft\\HTML Help Workshop;InstallDir]/lib"
    "C:/Program Files/HTML Help Workshop/lib"
  )

  MARK_AS_ADVANCED (
    HTML_HELP_COMPILER
    HTML_HELP_INCLUDE_PATH
	HTML_HELP_LIBRARY
  )

ENDIF (WIN32)
