cmake_minimum_required( VERSION 3.13 FATAL_ERROR )

# Add all sources you want to build in this directory
target_sources( ${PROJECT_NAME}_objs
    PRIVATE 
        TileData.asm
        TileMap.asm
        # other_source.s
)


# If there are subdirectories with source files, just add them like this. Make 
# sure to copy THIS file to it too and add the file names correctly.
# add_subdirectory( subdir )
