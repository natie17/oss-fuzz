#include <string.h>
#include <stdlib.h>

void parse_input(const char *data, int size) {
    if (size > 0 && data[0] == 'F') {
        if (size > 1 && data[1] == 'U') {
            if (size > 2 && data[2] == 'Z') {
                char buf[8];
                memcpy(buf, data, size);
                volatile char opt_prevent = buf[0];
            }
        }
    }
}
