find_program(DIA_PATH
             NAMES
                dia
            )

if(NOT DIA_PATH)
    message(WARNING "Did not find dia")
else()
    function(dia_convert input output)
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

        add_custom_command(OUTPUT ${output}
                           COMMAND ${DIA_PATH} --export "${real_output}" "${real_input}"
                           DEPENDS ${real_input}
                          )
        add_custom_target(${output}_
                          DEPENDS
                            ${real_output}
                         )
    endfunction()
endif()
