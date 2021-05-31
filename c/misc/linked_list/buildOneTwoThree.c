#include "node.h"
#include <stdlib.h>


struct node* buildOneTwoThree ()
{
    int i;
    struct node *head = NULL;
    struct node *tail;

//    head = buildNode(1);
//    two = buildNode(2);
//    three = buildNode(3);
//    
//    head->next = two;
//    two->next = three;
    
    Push(&head, 1);
    tail = head;
    for (i = 2; i < 4; ++i) {
        Push(&(tail->next), i);
        tail = tail->next;
    }

    return head;
}

