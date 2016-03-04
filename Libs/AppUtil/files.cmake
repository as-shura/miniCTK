file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/include/*")

set(CPP_FILES
  src/mitkBaseApplication.cpp
  src/mitkProvisioningInfo.cpp
  src/QmitkSafeApplication.cpp
  src/QmitkSingleApplication.cpp
)
