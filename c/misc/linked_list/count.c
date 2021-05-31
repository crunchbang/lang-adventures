#include "node.h"
#include <stdio.h>

int Count(struct node* head, int searchFor)
{
    int count = 0;
    struct node *current = head;

    while (current != NULL) {
        if (current->data == searchFor)
            ++count;
        current = current->next;
    }

    return count;
}

void CountTest() 
{
    struct node *myList = buildOneTwoThree();
    int count = Count(myList, 2);
    printf("%d!!!", count);
}
