#include <stdio.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char const *argv[])
{
    char str[30] = "result_from_file_";

    strcpy(&str[17], argv[1]);
    
    printf("file name: %s\n", str);
    
    int num_of_file =  4;
    char str1[10] = "file1";
    //FILE *file = fopen(str, "w");
    for (size_t i = 0; i < num_of_file; i++) {
        FILE *file = fopen(str1, "w");
        
        if(!file) { 
            puts("目的檔案開啟失敗"); 
            return 1; 
        }

        printf("writing file %s\n", str1);
        str1[4]++;
        sleep(1);

        // write something in the file
        char *c = str;
        while(*c != '\0') {
            fputc(*c, file);
            c++;
        }

        fclose(file);
    }

    return 0;
}
