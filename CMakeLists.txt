cmake_minimum_required( VERSION 3.13 FATAL_ERROR )

# Give the project a name
project( rgbds-cradle
    VERSION 0.1.0
    DESCRIPTION "Simple project template for Game Boy (Color) games developed with RGBDS"
    LANGUAGES NONE
)

# Add the RGBDS module to CMake
list( APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake" )

# Tell CMake this is an RGBDS project. The target executable will be the final ROM
# that will be built. 
enable_language( RGBDS )

# We're going to compile the sources into an object library first. This will 
# make generating the link file easier.
add_library( ${PROJECT_NAME}_objs OBJECT "" )
add_subdirectory( src )

# The link file. The link file is copied into the build directory. This is a 
# little trick to make sure the ROM is rebuilt if the link file is modified.
set( LINK_FILE linkfile.cfg )   # Name of the link file

add_custom_target(
    linkfile
    DEPENDS ${CMAKE_BINARY_DIR}/${LINK_FILE}
)

add_custom_command(
    OUTPUT ${CMAKE_BINARY_DIR}/${LINK_FILE}
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/${LINK_FILE} ${CMAKE_BINARY_DIR}
    DEPENDS ${CMAKE_SOURCE_DIR}/${LINK_FILE}
)


# This will be the final executable/ROM
add_executable( ${PROJECT_NAME} $<TARGET_OBJECTS:${PROJECT_NAME}_objs> )
set_target_properties( ${PROJECT_NAME} PROPERTIES SUFFIX ".gb" )
add_dependencies( ${PROJECT_NAME} linkfile )

# Add linker options to export a memory map and use a linker file. Modify accordingly
# to add/remove linker options.
target_link_options( ${PROJECT_NAME}
    PUBLIC  
        "LINKER:-mmemory_map.txt,-l${CMAKE_BINARY_DIR}/${LINK_FILE}"
)
