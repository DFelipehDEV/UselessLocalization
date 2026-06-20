add_library(UselessLocalization SHARED ../useless.hpp api.cpp)

add_custom_command(TARGET UselessLocalization POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
        "$<TARGET_FILE:UselessLocalization>"
        "${CMAKE_CURRENT_BINARY_DIR}/UselessLocalization.dll"
    COMMAND ${CMAKE_COMMAND} -E copy
        "${CMAKE_CURRENT_SOURCE_DIR}/UselessLocalization.gej"
        "${CMAKE_CURRENT_BINARY_DIR}/UselessLocalization.gej"
    COMMAND ${CMAKE_COMMAND} -E copy
        "${CMAKE_CURRENT_SOURCE_DIR}/api.gml"
        "${CMAKE_CURRENT_BINARY_DIR}/api.gml"
    COMMAND python "${CMAKE_SOURCE_DIR}/gm82gex.py" "UselessLocalization.gej"
    WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
    COMMENT "Created UselessLocalization.gex at ${CMAKE_CURRENT_BINARY_DIR}"
)