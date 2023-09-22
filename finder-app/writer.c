#include <stdio.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    openlog(argv[0], LOG_PID, LOG_USER);
    if (argc < 3) {
        syslog(LOG_ERR, "Missing required positional arguments: writefile and writestr");
        return 1;
    }
    char *fName = argv[1];
    char *writeStr = argv[2];
    FILE *outFile;

    if ((outFile = fopen(fName, "w")) == NULL) {
        syslog(LOG_ERR, "Failed to open file: %s", fName);
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", writeStr, fName);
    fprintf(outFile, "%s", writeStr);
    fclose(outFile);
    return 0;
}
