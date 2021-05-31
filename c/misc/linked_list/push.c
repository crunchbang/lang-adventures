#include <stdlib.h>
#include <stdio.h>
#include "node.h"

void Push(struct node** headRef, int data) 
{
    struct node* newNode = malloc(sizeof(struct node));

    newNode->data = data;
    newNode->next = *headRef;
    *headRef = newNode;
}

void PushTest ()
{
    struct node* head = buildOneTwoThree();
    struct node* curr;

    Push(&head, 1);
    Push(&head, 13);
    curr = head;
    while (curr != NULL) {
        printf("%d->", curr->data);
        curr = curr->next;
    }

}
    



