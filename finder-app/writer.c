#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <string.h>

int main(int argc, char *argv[]) {
    // Setup syslog
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    // Check if correct number of arguments are provided
    if (argc != 3) {
        syslog(LOG_ERR, "Error: Invalid number of arguments. Usage: %s <file_path> <string_to_write>", argv[0]);
        closelog();
        return 1;
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Open file for writing
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Could not open file %s for writing", writefile);
        closelog();
        return 1;
    }

    // Write string to file
    if (fputs(writestr, file) == EOF) {
        syslog(LOG_ERR, "Error: Could not write to file %s", writefile);
        fclose(file);
        closelog();
        return 1;
    }

    // Close file
    fclose(file);

    // Log success message
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    closelog();
    return 0;
}
