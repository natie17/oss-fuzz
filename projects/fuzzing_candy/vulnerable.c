#include <string.h>
#include <stdint.h>

int xml_parse_buffer(const uint8_t *buf, size_t buf_len) {
    volatile char buffer[16];
    if (buf_len > 0) {
        memcpy((char *)buffer, buf, buf_len);
    }
    return 0;
}
