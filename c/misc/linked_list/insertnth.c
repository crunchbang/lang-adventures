#include "node.h"
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

void InsertNth(struct node **headRef, int index, int data)
{
    struct node *current = *headRef;
    int i;

    if (index == 0)
        Push(headRef, data);
    else {
        for(i = 0; i < index - 1; ++i) {
            assert(current != NULL);
            current = current->next;
        }
        assert(current != NULL);

        Push(&(current->next), data);
    }
}

void InsertNthTest()
{
    struct node *head = NULL;
    struct node *current;

    InsertNth(&head, 0, 13);
    InsertNth(&head, 1, 42);
    InsertNth(&head, 1, 5);

    current = head;
    while (current != NULL) {
        printf("%d->", current->data);
        current = current->next;
    }
    DeleteList(&head);
}
