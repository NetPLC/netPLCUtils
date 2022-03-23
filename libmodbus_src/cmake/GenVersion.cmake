function(GenerateVersionHeader ver_file)

# 写入头文件宏定义的版本字符串，日期和 Hash
file(WRITE ${ver_file}
"
#define LIBMODBUS_VERSION_MAJOR ${LIBMODBUS_VERSION_MAJOR}

#define LIBMODBUS_VERSION_MINOR ${LIBMODBUS_VERSION_MINOR}

#define LIBMODBUS_VERSION_MICRO ${LIBMODBUS_VERSION_MICRO}

#define LIBMODBUS_VERSION  ${LIBMODBUS_VERSION}

#define LIBMODBUS_VERSION_STRING \"${LIBMODBUS_VERSION}\"

/* Numerically encoded version, like 0x010203 */
#define LIBMODBUS_VERSION_HEX ((LIBMODBUS_VERSION_MAJOR << 24) |  \
                               (LIBMODBUS_VERSION_MINOR << 16) |  \
                               (LIBMODBUS_VERSION_MICRO << 8))

/* Evaluates to True if the version is greater than @major, @minor and @micro
 */
#define LIBMODBUS_VERSION_CHECK(major,minor,micro)      \
    (LIBMODBUS_VERSION_MAJOR > (major) ||               \
     (LIBMODBUS_VERSION_MAJOR == (major) &&             \
      LIBMODBUS_VERSION_MINOR > (minor)) ||             \
     (LIBMODBUS_VERSION_MAJOR == (major) &&             \
      LIBMODBUS_VERSION_MINOR == (minor) &&             \
      LIBMODBUS_VERSION_MICRO >= (micro)))
"
)

endfunction()
