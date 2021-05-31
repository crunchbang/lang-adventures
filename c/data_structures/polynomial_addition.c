#include <stdio.h>

struct poly {
    int coeff;
    int exp;
};

typedef struct poly Polynomial;

void getPoly(Polynomial *, int *);
void displayPoly(Polynomial *, int *);
void addPoly(Polynomial *, int *, Polynomial *, int *, Polynomial *, int *);

int main ()
{
    Polynomial p1[20], p2[20], result[20];
    int l1, l2, l3;


    printf("Enter the first polynomial:\n");
    getPoly(p1, &l1);
    printf("Enter the second polynomial:\n");
    getPoly(p2, &l2);

    addPoly(p1, &l1, p2, &l2, result, &l3);
    printf("The first polynomial is:\n");
    displayPoly(p1, &l1);
    printf("The second polynomial is:\n");
    displayPoly(p2, &l2);
    printf("The result of addition is:\n");
    displayPoly(result, &l3);

    return 0;
}

void getPoly(Polynomial p[], int *len)
{
    int i; 

    printf("Number of terms: ");
    scanf("%d", len);
    printf("\nEnter each term of the polynomial in the specified format (MAX: 20 terms)\n"
            "Coefficient exponent\n");
    
    for (i = 0; i < *len; ++i) {
        printf("\nCoeff Exp: ");
        scanf("%d %d", &p[i].coeff, &p[i].exp);
    }
}

void displayPoly(Polynomial p[], int *len)
{
    int i;

    for (i = 0; i < *len; ++i) 
        printf("%dx^(%d) +", p[i].coeff, p[i].exp);
    printf(" 0\n");
}

void addPoly(Polynomial p1[], int *l1, Polynomial p2[], int *l2, Polynomial result[], int *l3)
{
    int i, j, k;

    i = j = k = 0;

    while ((i < *l1) && (j < *l2)) {
        if(p1[i].exp < p2[j].exp) {
            result[k].exp = p2[j].exp;
            result[k].coeff = p2[j].coeff;
            j++;
            k++;
        }
        else if(p1[i].exp > p2[j].exp) {
            result[k].exp = p1[i].exp;
            result[k].coeff = p1[i].coeff;
            i++;
            k++;
        }
        else {
            result[k].exp = p1[i].exp;
            result[k].coeff = p1[i].coeff + p2[j].coeff;
            i++;
            j++;
            k++;
        }
    }
    while (i < *l1) {
            result[k].exp = p1[i].exp;
            result[k].coeff = p1[i].coeff;
            i++;
            k++;
    }
    while (j < *l2) {
            result[k].exp = p2[j].exp;
            result[k].coeff = p2[j].coeff;
            j++;
            k++;
    }

    *l3 = k;
}
