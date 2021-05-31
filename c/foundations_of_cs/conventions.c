#include <stdio.h>

#define TRUE  1
#define FALSE 0
#define DefCell(EltType, CellType, ListType) \
    typedef struct CellType *ListType;       \
    struct CellType {                        \
        EltType element;                     \
        ListType next;                       \
    };

main()
{
    ;
    DefCell(int, CELL, LIST);
    LIST a;
    a->element = 1;
}
