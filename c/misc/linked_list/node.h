#ifndef NODE_H
#define NODE_H 
struct node {
    int data;
    struct node* next;
};

struct node* buildOneTwoThree();
int Length(struct node*);
void Push(struct node**, int);
void PushTest();
struct node* BuildWithLocalRef();
void CountTest();
void GetNthTest();
void DeleteList(struct node**);
void DeleteListTest();
void PopTest();
void InsertNthTest();
#endif
