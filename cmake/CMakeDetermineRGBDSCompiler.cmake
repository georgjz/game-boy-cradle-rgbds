# Find the assembler
find_program(
    CMAKE_RGBDS_COMPILER
        NAMES "rgbasm"
        HINTS "${CMAKE_SOURCE_DIR}"
        DOC "RGBDS assembler" 
        REQUIRED
)

# Find the linker
find_program(
    CMAKE_RGBDS_LINKER
        NAMES "rgblink"
        HINTS "${CMAKE_SOURCE_DIR}"
        DOC "RGBDS linker" 
        REQUIRED
)

# Find the fixer
find_program(
    CMAKE_RGBDS_FIXER
        NAMES "rgbfix"
        HINTS "${CMAKE_SOURCE_DIR}"
        DOC "RGBDS fixer" 
        REQUIRED
)

mark_as_advanced( CMAKE_RGBDS_COMPILER )
mark_as_advanced( CMAKE_RGBDS_LINKER )
mark_as_advanced( CMAKE_RGBDS_FIXER )

set( CMAKE_RGBDS_SOURCE_FILE_EXTENSIONS asm;s )
set( CMAKE_RGBDS_OUTPUT_EXTENSION .o )
set( CMAKE_RGBDS_COMPILER_ENV_VAR "" )

# Configure variables set in this file for fast reload later on
configure_file( ${CMAKE_CURRENT_LIST_DIR}/CMakeRGBDSCompiler.cmake.in
                ${CMAKE_PLATFORM_INFO_DIR}/CMakeRGBDSCompiler.cmake )
