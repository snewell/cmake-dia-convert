find_program(DIA_PATH
             NAMES
                dia
            )

if(NOT DIA_PATH)
    message(WARNING "Did not find dia")
else()
    include(CMakeParseArguments REQUIRED)

    function(dia_convert input output)
        set(options
                ALL
           )
        set(one_value_args
                FILTER
                RESULT_TARGET
           )
        set(multi_value_args "")
        cmake_parse_arguments(DIA_CONVERT "${options}" "${one_value_args}"
                              "${multi_value_args}" ${ARGN})

        set(real_input ${input})
        set(real_output ${output})

        if(NOT IS_ABSOLUTE ${input})
            # we don't have an absolute path, so convert
            set(real_input "${CMAKE_CURRENT_SOURCE_DIR}/${input}")
        endif()
        if(NOT IS_ABSOLUTE ${output})
            # we don't have an absolute path, so convert
            set(real_output "${CMAKE_CURRENT_BINARY_DIR}/${output}")
        endif()

        if(DIA_CONVERT_FILTER)
            set(filter_args "--filter=${DIA_CONVERT_FILTER}")
        endif()
        add_custom_command(OUTPUT ${output}
                           COMMAND ${DIA_PATH} "--export=${real_output}" "${filter_args}" "${real_input}"
                           DEPENDS ${real_input}
                          )
        if(DIA_CONVERT_ALL)
            add_custom_target(${output}_ ALL
                              DEPENDS
                                ${real_output}
                             )
        else()
            add_custom_target(${output}_
                              DEPENDS
                                ${real_output}
                             )
        endif()
        if(DIA_CONVERT_RESULT_TARGET)
            set(${DIA_CONVERT_RESULT_TARGET} ${output}_ PARENT_SCOPE)
        endif()
    endfunction()
endif()
