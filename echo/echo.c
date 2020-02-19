#include <stdio.h>
#include <string.h>
#include <stdlib.h>

size_t getBufferSize(int argc, const char *argv[]) {
    size_t size = 0;
    for (int i = 1; i < argc; i++)
        size += strlen(argv[i]) + 1;
    if (size == 0)
        size = 1;
    return size;
}

int main(int argc, const char *argv[]) {
    size_t bufferSize = getBufferSize(argc, argv);
    char *buf = (char *) malloc(bufferSize);
    if (buf == NULL) abort();
    size_t offset = 0;
    for (int i = 1; i < argc; i++) {
        strcpy(buf + offset, argv[i]);
        offset += strlen(argv[i]);
        buf[offset++] = ' ';
    }
    buf[bufferSize - 1] = '\n';
    fputs(buf, stdout);
    free(buf);
}
