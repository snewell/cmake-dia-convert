cmake_minimum_required(VERSION 3.0)
cmake_policy(VERSION 3.0)

project("dia-convert-test"
        LANGUAGES
            NONE
       )

include("${CMAKE_CURRENT_SOURCE_DIR}/../DiaConvert.cmake")

include(png.cmake)
