#include <stdio.h>

int main(int argc, char *argv[])
{
    int ages[] = {23, 43, 12, 89, 2};
    char *names[] = {
        "Alan", "Frank",
        "Mary", "John", "Lisa"
    };

    // Safely get the size of ages
    int count = sizeof(ages) / sizeof(int);
    int i = 0;

    // 1st Method : Indexing
    for(i = 0; i < count; i++) {
        printf("%s has been alive for %d years.\n",
                names[i], ages[i]);
    }

    printf("---\n");

    // Reposition pointers at the start of the array
    int *cur_age = ages;
    char **cur_name = names;

    // 2nd Method : Pointers
    for(i = 0; i < count; i++) {
        printf("%s is %d years old.\n",
                *(cur_name+i), *(cur_age+i));
    }

    printf("---\n");

    // 3rd Method : Pointers as arrays
    for(i = 0; i < count; i++) {
        printf("%s is %d.\n",
                cur_name[i], cur_age[i]);
    }

    printf("---\n");

    // 4th Method : Pointers Incrementation
    for(cur_name = names, cur_age = ages;
            (cur_age - ages) < count;
            cur_name++, cur_age++)
    {
        printf("%s lived %d years so far.\n",
                *cur_name, *cur_age);
    }

    return 0;
}
