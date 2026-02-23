if (WITH_ASTROBWT)
    add_definitions(/DXMRIG_ALGO_ASTROBWT)

    list(APPEND HEADERS_CRYPTO
        src/crypto/astrobwt/AstroBWT.h
        src/crypto/astrobwt/sha256_utils.h
        src/crypto/astrobwt/hash_utils.h
        src/crypto/astrobwt/sais.h
        src/crypto/astrobwt/Salsa20.hpp
    )

    list(APPEND SOURCES_CRYPTO
        src/crypto/astrobwt/AstroBWT.cpp
        src/crypto/astrobwt/Salsa20.cpp
        src/crypto/astrobwt/sha256_utils.cpp
    )
else()
    remove_definitions(/DXMRIG_ALGO_ASTROBWT)
endif()
