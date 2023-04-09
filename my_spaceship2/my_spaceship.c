#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct s_spaceship_object {
    int x;
    int y;
    char *direction;
} spaceship_objs;
spaceship_objs objs;
spaceship_objs *ptr_objs = &objs;


char *checkRightDirection(char *direction) {
    if (strcmp(direction, "up") == 0) {
        direction = "right";
    } else if (strcmp(direction, "left") == 0) {
        direction = "up";
    } else if (strcmp(direction, "right") == 0) {
        direction = "down";
    } else if (strcmp(direction, "down") == 0) {
        direction = "left";
    }
    return direction;
}

char *checkLeftDirection(char *direction) {
    if (strcmp(direction, "up") == 0) {
        direction = "left";
    } else if (strcmp(direction, "left") == 0) {
        direction = "down";
    } else if (strcmp(direction, "down") == 0) {
        direction = "right";
    } else if (strcmp(direction, "right") == 0) {
        direction = "up";
    }
    return direction;
}

void advanceShip(char *direction, int x, int y) {
    if (strcmp(direction, "up") == 0) y--;
    else if (strcmp(direction, "down") == 0) y++;
    else if (strcmp(direction, "right") == 0) x++;
    else if (strcmp(direction, "left") == 0) x--;
    ptr_objs->x = x;
    ptr_objs->y = y;
}


char* my_spaceship(char* param_1)
{
    char *res;
    ptr_objs->direction = "up";
    ptr_objs->x = 0;
    ptr_objs->y = 0;
    
    for (size_t i = 0; i < strlen(param_1); i++) {
        if (param_1[i] == 'R') {
            ptr_objs->direction = checkRightDirection(ptr_objs->direction);
        } else if (param_1[i] == 'L') {
            ptr_objs->direction = checkLeftDirection(ptr_objs->direction);
        } else if (param_1[i] == 'A') {
            advanceShip(ptr_objs->direction, ptr_objs->x, ptr_objs->y);
        } 
    }
    res = (char *)malloc(sizeof(char) * 25);
    snprintf(res, 100, "{x: %d, y: %d, direction: '%s'}", ptr_objs->x, ptr_objs->y,ptr_objs->direction);
    
    return res;
}

/*
flight_path = "RAALALL"; 
flight_path = "AAAA";
flight_path = "";
*/

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
    return 0;
}