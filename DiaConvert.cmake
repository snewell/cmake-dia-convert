find_program(DIA_PATH
             NAMES
                dia
            )

if(NOT DIA_PATH)
    message(WARNING "Did not find dia")
else()
    include(CMakeParseArguments REQUIRED)

    function(dia_convert)
        set(options "")
        set(one_value_args
                FILTER
                INPUT
                OUTPUT
           )
        set(multi_value_args "")
        cmake_parse_arguments(DIA_CONVERT "${options}" "${one_value_args}"
                              "${multi_value_args}" ${ARGN})

        set(real_input ${DIA_CONVERT_INPUT})
        set(real_output ${DIA_CONVERT_OUTPUT})

        if(NOT IS_ABSOLUTE ${DIA_CONVERT_INPUT})
            # we don't have an absolute path, so convert
            set(real_input "${CMAKE_CURRENT_SOURCE_DIR}/${DIA_CONVERT_INPUT}")
        endif()
        if(NOT IS_ABSOLUTE ${DIA_CONVERT_OUTPUT})
            # we don't have an absolute path, so convert
            set(real_output "${CMAKE_CURRENT_BINARY_DIR}/${DIA_CONVERT_OUTPUT}")
        endif()

        if(DIA_CONVERT_FILTER)
            set(filter_args "--filter=${DIA_CONVERT_FILTER}")
        endif()
        add_custom_command(OUTPUT ${DIA_CONVERT_OUTPUT}
                           COMMAND ${DIA_PATH} "--export=${real_output}" "${filter_args}" "${real_input}"
                           DEPENDS ${real_input}
                          )
        add_custom_target(${DIA_CONVERT_OUTPUT}_
                          DEPENDS
                            ${real_output}
                         )
    endfunction()
endif()
