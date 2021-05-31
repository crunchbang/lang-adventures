#include "node.h"
#include <stdlib.h>
#include <stdio.h>

void DeleteList(struct node **headRef)
{
    struct node *current = *headRef;
    struct node *next = NULL;

    while(current != NULL) {
        next = current->next;
        free(current);
        current = next;
    }
    *headRef = NULL;
    printf("Memory deallocated");
}

void DeleteListTest()
{
    struct node* myList = buildOneTwoThree();

    DeleteList(&myList);
}
