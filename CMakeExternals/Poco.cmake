#-----------------------------------------------------------------------------
# Poco
#-----------------------------------------------------------------------------

set(proj Poco)

set(${proj}_DEPENDENCIES "")

ExternalProject_Include_Dependencies(${proj}
  PROJECT_VAR proj
  DEPENDS_VAR ${proj}_DEPENDENCIES
  EP_ARGS_VAR ${proj}_EXTERNAL_PROJECT_ARGS
  USE_SYSTEM_VAR ${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj}
  )

if(${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj})
  message(FATAL_ERROR "Enabling ${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj} is not supported !")
endif()

# Sanity checks
if(DEFINED Poco_DIR AND NOT EXISTS ${Poco_DIR})
  message(FATAL_ERROR "Poco_DIR variable is defined but corresponds to non-existing directory")
endif()

if(NOT DEFINED Poco_DIR)
  ExternalProject_Add(${proj}
    LIST_SEPARATOR ${sep}
    SOURCE_DIR ${CMAKE_BINARY_DIR}/${proj}
    BINARY_DIR ${proj}-build
    PREFIX ${proj}${ep_suffix}
    URL https://github.com/pocoproject/poco/archive/poco-1.6.1-release.tar.gz
    URL_MD5 208872b13d282dfb0f0580fc11df96f3
    #INSTALL_COMMAND ""
    CMAKE_CACHE_ARGS
      ${ep_common_cache_args}
      -DENABLE_XML:BOOL=ON
      -DENABLE_JSON:BOOL=ON
      -DENABLE_MONGODB:BOOL=OFF
      -DENABLE_PDF:BOOL=OFF
      -DENABLE_UTIL:BOOL=ON
      -DENABLE_NET:BOOL=OFF
      -DENABLE_NETSSL:BOOL=OFF
      -DENABLE_NETSSL_WIN:BOOL=OFF
      -DENABLE_CRYPTO:BOOL=OFF
      -DENABLE_DATA:BOOL=OFF
      -DENABLE_DATA_SQLITE:BOOL=OFF
      -DENABLE_DATA_MYSQL:BOOL=OFF
      -DENABLE_DATA_ODBC:BOOL=OFF
      -DENABLE_SEVENZIP:BOOL=OFF
      -DENABLE_ZIP:BOOL=ON
      -DENABLE_APACHECONNECTOR:BOOL=OFF
      -DENABLE_CPPPARSER:BOOL=OFF
      -DENABLE_PocoDOC:BOOL=OFF
      -DENABLE_PAGECOMPILER:BOOL=OFF
      -DENABLE_PAGECOMPILER_FILE2PAGE:BOOL=OFF
    DEPENDS ${proj_DEPENDENCIES}
   )
  set(Poco_DIR ${CMAKE_BINARY_DIR}/${proj}-build)
  mitkFunctionInstallExternalCMakeProject(Poco)
else()
  ExternalProject_Add_Empty(${proj} DEPENDS ${${proj}_DEPENDENCIES})
endif()

mark_as_superbuild(
  VARS Poco_DIR:PATH
  LABELS "FIND_PACKAGE"
  )
