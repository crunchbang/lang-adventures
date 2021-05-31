#include "node.h"
#include <stdio.h>

int GetNth(struct node *head, int index)
{
    int len;
    struct node *current = head;

    len = Length(head);
    if (index > len || index < 0)
        return -1;

    while (current != NULL) {
        if (index == 0)
            return current->data;
        current = current->next;
        --index;
    }
}


void GetNthTest()
{
    struct node* myList = buildOneTwoThree();
    int lastNode = GetNth(myList, 2);

    printf("Data:%d", lastNode);
}
