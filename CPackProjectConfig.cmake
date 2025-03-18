if(CPACK_PACKAGE_FILE_NAME MATCHES ".*-src$")
    message(FATAL_ERROR "Creating source archives is not supported.")
endif()

set(PROJECT_NAME "SDL3_mixer")
set(PROJECT_VERSION "3.0.0")
set(PROJECT_SOURCE_DIR "D:/Development/Code/cpp/Repositories/dm-cmake/SDL_mixer-build")
set(SDL_CMAKE_PLATFORM "Windows")
set(SDL_CPU_NAMES "X64")
list(SORT SDL_CPU_NAMES)

string(TOLOWER "${SDL_CMAKE_PLATFORM}" SDL_CMAKE_PLATFORM)
string(TOLOWER "${SDL_CPU_NAMES}" SDL_CPU_NAMES)
if(lower_sdl_cmake_platform STREQUAL lower_sdl_cpu_names)
    set(SDL_CPU_NAMES_WITH_DASHES)
endif()

string(REPLACE ";" "-" SDL_CPU_NAMES_WITH_DASHES "${SDL_CPU_NAMES}")
if(SDL_CPU_NAMES_WITH_DASHES)
    set(SDL_CPU_NAMES_WITH_DASHES "-${SDL_CPU_NAMES_WITH_DASHES}")
endif()

set(MSVC 1)
set(MINGW )
if(MSVC)
    set(SDL_CMAKE_PLATFORM "${SDL_CMAKE_PLATFORM}-VC")
elseif(MINGW)
    set(SDL_CMAKE_PLATFORM "${SDL_CMAKE_PLATFORM}-mingw")
endif()

set(CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}-${PROJECT_VERSION}-${SDL_CMAKE_PLATFORM}${SDL_CPU_NAMES_WITH_DASHES}")

if(CPACK_GENERATOR STREQUAL "DragNDrop")
    set(CPACK_DMG_VOLUME_NAME "SDL3_mixer 3.0.0")
    # FIXME: use pre-built/create .DS_Store through AppleScript (CPACK_DMG_DS_STORE/CPACK_DMG_DS_STORE_SETUP_SCRIPT)
    set(CPACK_DMG_DS_STORE "${PROJECT_SOURCE_DIR}/Xcode/SDL/pkg-support/resources/SDL_DS_Store")
endif()
