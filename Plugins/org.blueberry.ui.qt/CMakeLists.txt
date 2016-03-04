project(org_blueberry_ui_qt)

#include "files.cmake"

set(PLUGIN_export_directive  "BERRY_UI_QT")

set(PLUGIN_SRCS
  ${CPP_FILES}
  )

# Files which should be processed by Qts moc
set(PLUGIN_MOC_SRCS
  ${MOC_H_FILES}
  )

# Qt Designer files which should be processed by Qts uic
set(PLUGIN_UI_FORMS
)

# QRC Files which should be compiled into the plugin
set(PLUGIN_resources
)

set(PLUGIN_CACHED_RESOURCEFILES
  plugin.xml
)

#Compute the plugin dependencies
ctkFunctionGetTargetLibraries(PLUGIN_target_libraries)


ctkMacroBuildPlugin(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${PLUGIN_export_directive}
  SRCS ${PLUGIN_SRCS}
  MOC_SRCS ${PLUGIN_MOC_SRCS}
  UI_FORMS ${PLUGIN_UI_FORMS}
  RESOURCES ${PLUGIN_resources}
  CACHED_RESOURCEFILES ${PLUGIN_CACHED_RESOURCEFILES}
  TARGET_LIBRARIES ${PLUGIN_target_libraries}
)
