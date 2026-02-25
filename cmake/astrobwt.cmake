if (WITH_ASTROBWT)
    add_definitions(/DXMRIG_ALGO_ASTROBWT)

    list(APPEND HEADERS_CRYPTO
        src/crypto/astrobwt/AstroBWT.h
        src/crypto/astrobwt/sha256_utils.h
        src/crypto/astrobwt/hash_utils.h
        src/crypto/astrobwt/sais.h
        src/crypto/astrobwt/Salsa20.hpp
        src/crypto/astrobwt/divsufsort.h
        src/crypto/astrobwt/divsufsort_private.h
    )

    list(APPEND SOURCES_CRYPTO
        src/crypto/astrobwt/AstroBWT.cpp
        src/crypto/astrobwt/Salsa20.cpp
        src/crypto/astrobwt/sha256_utils.cpp
        src/crypto/astrobwt/divsufsort.c
        src/crypto/astrobwt/sssort.c
        src/crypto/astrobwt/trsort.c
        src/crypto/astrobwt/divsufsort_utils.c
    )

    if (CMAKE_CXX_COMPILER_ID MATCHES GNU OR CMAKE_CXX_COMPILER_ID MATCHES Clang)
        set_source_files_properties(src/crypto/astrobwt/sha256_utils.cpp PROPERTIES COMPILE_FLAGS "-msha -msse4.1 -mssse3")
        set_source_files_properties(src/crypto/astrobwt/AstroBWT.cpp PROPERTIES COMPILE_FLAGS "-O3 -funroll-loops")
    endif()
else()
    remove_definitions(/DXMRIG_ALGO_ASTROBWT)
endif()
