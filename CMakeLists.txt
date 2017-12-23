cmake_minimum_required(VERSION 3.0)
cmake_policy(VERSION 3.0)

project("dia-convert"
        LANGUAGES
            NONE
        VERSION
            0.1.0
       )

include(GNUInstallDirs)

add_subdirectory(test)

install(FILES
            DiaConvert.cmake
        DESTINATION ${CMAKE_ROOT}/Modules
       )
