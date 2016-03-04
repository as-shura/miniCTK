project(AppUtil)

#
# See CTK/CMake/ctkMacroBuildLib.cmake for details
#

set(KIT_export_directive "MITKAPPUTIL_EXPORT")


# Source files
set(KIT_SRCS
    src/mitkBaseApplication.cpp
    src/mitkProvisioningInfo.cpp
    src/QmitkSafeApplication.cpp
    src/QmitkSigleApplication.cpp
  )

# Headers that should run through moc
set(KIT_MOC_SRCS
)

# UI files
set(KIT_UI_FORMS
)

# Resources
set(KIT_resources
)

# Target libraries - See CMake/ctkFunctionGetTargetLibraries.cmake
# The following macro will read the target libraries from the file 'target_libraries.cmake'
ctkFunctionGetTargetLibraries(KIT_target_libraries)

#if(CTK_QT_VERSION VERSION_GREATER "4")
#  list(APPEND KIT_target_libraries Qt5::Sql Qt5::Concurrent)
#endif()

ctkMacroBuildLib(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${KIT_export_directive}
  INCLUDE_DIRECTORIES ${CTK_SUPERBUILD_BINARY_DIR}
  SRCS ${KIT_SRCS}
  MOC_SRCS ${KIT_MOC_SRCS}
  UI_FORMS ${KIT_UI_FORMS}
  TARGET_LIBRARIES ${KIT_target_libraries}
  RESOURCES ${KIT_resources}
  LIBRARY_TYPE ${CTK_LIBRARY_MODE}
  )

# Testing
if(BUILD_TESTING)
#  add_subdirectory(Testing)
endif()
