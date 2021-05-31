#include "node.h"
#include <malloc.h>
#include <assert.h>

int Pop(struct node **headRef)
{
    int data;
    struct node *remove = *headRef;
    
    assert(remove != NULL);

    data = remove->data;
    *headRef = remove->next;
    free(remove);

    return data;
}

void PopTest()
{
    struct node *head = buildOneTwoThree();
    int a = Pop(&head);
    int b = Pop(&head);
    int c = Pop(&head);
    int len = Length(head);

    printf("%d %d %d, %d", a, b, c, len);
}
