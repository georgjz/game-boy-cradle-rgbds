cmake_minimum_required( VERSION 3.13 FATAL_ERROR )

# Add include directory
target_include_directories( ${PROJECT_NAME}_objs
    PRIVATE 
        ${CMAKE_CURRENT_SOURCE_DIR}
        include
)

# If there are subdirectories with source files, just add them like this. Make 
# sure to copy THIS file to it too and add the file names correctly.
# add_subdirectory( subdir )
add_subdirectory( graphics )

# Add all sources you want to build in this directory
target_sources( ${PROJECT_NAME}_objs
    PRIVATE 
        Header.asm
        Main.asm
        # other_source.s
)
