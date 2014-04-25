#include <stdio.h>

int main(int argc, char *argv[])
{
    int i = 0;

    // Go through each string in argv
    // argv[0] is skipped on purpose, it's the program name
    for(i = 1; i < argc; i++) {
        printf("arg %d: %s\n", i, argv[i]);
    }

    // Let's make out our own array of string
    char *states[] = {
        "California", "Oregon",
        "Washington", "Texas"
    };
    int num_states = 4;

    for(i = 0; i < num_states; i++) {
        printf("state %d: %s\n", i, states[i]);
    }

    return 0;
}
