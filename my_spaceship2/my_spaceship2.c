// #include <stdlib.h>
#include <string.h>
#include <stdio.h>


char *my_spaceship(char *path) {
	int index, x, y, i = 0;
	char rotation[4][6] = {"up", "right", "down", "left"};
    int len = strlen(path);
    char *ptr = (char*)malloc(sizeof(char) * 100);
    
    if (ptr == NULL) return NULL;
    
    while (i < len) {
        if (path[i] == 'R') index++;
        else if (path[i] == 'L') index--;
        else if (path[i] == 'A'){
            if (index == 0) y--;
            else if (index == 1) x++;
            else if (index == 2) y++;
            else x--;
        }
        while (index < 0) {
            index += 4;
        }
        i++;
    }    
    sprintf(ptr, "{x: %d,  Y: %d, direction: '%s'}", x,  y, rotation[index%4]);
    return ptr;
}



int main(int ac, char **av)
{
    char *result;
    int i = 1;
    if (ac > 1) {
        
        while (i < ac) {
            result = my_spaceship(av[i]);
            printf("%s\n", result);
            i++;
        }
    }
    free(result);
    return (0);
}
