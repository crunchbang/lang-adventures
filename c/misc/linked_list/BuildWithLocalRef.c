#include <stdio.h>
#include "node.h"

struct node* BuildWithLocalRef () 
{
    struct node* head = NULL;
    struct node** lastPtrRef = &head;
    int i;

    for (i = 1; i < 4; ++i) {
        Push(lastPtrRef, i);
        lastPtrRef = &((*lastPtrRef)->next);
    }

    return head;
}
