/* Given a linked list head pointer,
 * computes and returns the number of
 * nodes in the list
 */
#include <malloc.h>
#include "node.h"

int Length(struct node* head) 
{
    struct node* current = head;
    int count = 0;

    while(current != NULL) {
        ++count;
        current = current-> next;
    }

    return count;
}
