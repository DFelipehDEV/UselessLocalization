add_library(UselessLocalization SHARED ../useless.hpp api.cpp)

add_custom_command(TARGET UselessLocalization POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
        "${CMAKE_CURRENT_SOURCE_DIR}/UselessLocalization.gej"
        "$<TARGET_FILE_DIR:UselessLocalization>/UselessLocalization.gej"
    COMMAND ${CMAKE_COMMAND} -E copy
        "${CMAKE_CURRENT_SOURCE_DIR}/api.gml"
        "$<TARGET_FILE_DIR:UselessLocalization>/api.gml"
    COMMAND python "${CMAKE_SOURCE_DIR}/gm82gex.py" "UselessLocalization.gej"
    WORKING_DIRECTORY "$<TARGET_FILE_DIR:UselessLocalization>"
    COMMENT "Created UselessLocalization.gex at $<TARGET_FILE_DIR:UselessLocalization>"
)