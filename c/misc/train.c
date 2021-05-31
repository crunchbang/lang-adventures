#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>


#define CANCELLED 0
#define RESERVED  1

struct passenger {
    int id;
    char name[20];
    int seatno;
    int cancel;
    struct passenger *next;
};

typedef struct passenger TRAVELLER;
TRAVELLER *start, *end;

void createnode()
{
    TRAVELLER *tmp;

    tmp = (TRAVELLER *)malloc(sizeof(TRAVELLER));
    if (tmp == NULL) {
        printf("Insufficient Memory");
        exit(0);
    }
    tmp->next = NULL;
    end->next = tmp;
    end = tmp;
}

TRAVELLER* findptr(int seat)
{
    TRAVELLER *current;

    current = start;
    while (current != NULL) {
        if (current->seatno == seat) {
            current->cancel = CANCELLED;
            break;
        }
        current = current->next;
    }
    if (current != NULL)
        return current;
    else 
        return NULL;
}

void display(int seat)
{
    TRAVELLER *ptr;
    ptr = findptr(seat);
    if (ptr != NULL) {
        printf("ID: %i\n"
               "Name: %s\n"
               "Seat Number: %i\n", ptr->id, ptr->name, ptr->seatno);
        printf("Status: %i\n", ptr->cancel);
/*        if (ptr->cancel == RESERVED)
            printf("Reserved\n");
        else
            printf("Cancelled\n"); */
    }
}
           
int reservation()
{
    TRAVELLER *current;
    int seat;
    seat = end->seatno;

    if (seat < 100) {
        createnode();
        end->cancel = 1;
        printf("Enter the following details:\n"
               "Name: ");
        scanf(" %s", end->name);
//        end->cancel = RESERVED;
        printf("assigned");
        end->seatno = seat + 1;
        end->id=23*seat;
        display(end->seatno);
        return 1;
    }
    else {
        current = start;
        while (current != NULL) {
            if (current->cancel == CANCELLED) {
                printf("Enter the following details:\n"
                       "Name: ");
                fgets(current->name, 100, stdin);
                display(current->seatno);
                return 1;
            }
            current = current->next;
        }
    }
    return 0;
}

void cancellation(int seat)
{
    TRAVELLER *ptr;

    ptr = findptr(seat);
    if (ptr != NULL)
        ptr->cancel = CANCELLED;
}

int main()
{
    char choice = 'y';
    int option;
    int status, seat;

    setvbuf(stdin, NULL, _IONBF, 0);
    setvbuf(stdout, NULL, _IONBF, 0);


    start =malloc(sizeof(struct passenger));
    end = start;
    start->seatno = 0;

    while (tolower(choice) == 'y') {
        /* Menu */
        printf("Options\n"
               "=======\n\n"
               "1. Reservation\n"
               "2. Cancellation\n"
               "3. Status\n\n");
        printf("Please enter your choice: ");
        scanf("%i", &option);
        switch (option) {
            case 1:
                status = reservation();
                if (status == 0)
                    printf("All of the seats are booked.\n"
                           "Reservation unsuccessful.\n");
                break;
            case 2:
                printf("Please enter the seat number: ");
                scanf("%i", &seat);
                cancellation(seat);
                display(seat);
                break;
            case 3:
                printf("Please enter the seat number: ");
                scanf("%i", &seat);
                display(seat);
                break;
            default:
                printf("Wrong choice. Please try again");
                break;
        }
        fflush(stdin);
        fflush(stdout);
        printf("Would you like to try again?(y/n)");
        fscanf(stdin, " %c", &choice);
    }

    return 0;
}
