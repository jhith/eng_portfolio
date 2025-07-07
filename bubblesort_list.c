/* Code for random list sorted using bubble sort */
/* Cousera week3 assignment */
/* J. H. */
/*  June 2025*/
//////////////////////////////////////////////////////

#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<time.h>

// list 
typedef struct list{
	int data; 
	struct list *next;
	} list;
	
int is_empty(const list*l){
	return (l==NULL);
	}

// initialize list	
list* create_list(int d){
	list* head = malloc(sizeof(list));
	head-> data=d;
	head -> next= NULL;
	return head;
}

// add an element to the list
list* add_to_front(int d, list*h){
	 list* head = create_list(d);
	 head-> next = h;
	 return head;
}

// put an array to the list
list* array_to_list(int d[], int size){
	list* head=create_list(d[0]);
	int i;
	for(i=1;i<size;i++){
		head=add_to_front(d[i],head);
	}
	return head;
}

// print the list with cols fixed (5)
void print_list(list *h,int cols, char *title){
		printf("%s\n", title);
		
		int count = 0;
		
		while (h!=NULL){
			printf("%d :", h->data);
			h = h -> next;
			count++;
			if (count%cols == 0)
				printf("\n");
		}
		if (count%cols != 0)   // new line if last row is not a multiple 
			printf("\n");
}


// bubble sort for a list 

void swap(int *a,int *b){
		int temp = *a;
		*a = *b;
		*b = temp;
}

void bubble_list(list *head){
	if (head == NULL)
		return;
	
	int swapped;
	list *ptr;
	do{
		swapped = 0;
		ptr = head;
		while(ptr->next != NULL){
			if(ptr->data > ptr->next->data){
				swap(&ptr->data,&ptr->next->data);
				swapped=1;
			}
			ptr= ptr->next;
		}
	}while(swapped);
}


// generate 100 random numbers array and add to list

int main(){
	
	srand(time(NULL)); // random seed generate in each run of the code
	const int SIZE = 100; // array size
	const int cols = 5; //  number of numbers printed per row 
	int min_value = 0;
	int max_value = 100;
	int random_array[SIZE]; // initialize array
	int sorted[SIZE];
	
	
	// fill random values in the array
	for (int i=0;i<SIZE;i++){
		random_array[i] = min_value + rand()%(max_value-min_value + 1);
	}

	
	// store array in a list
	list *head = NULL;
	head = array_to_list(random_array,SIZE);
	print_list(head,cols, "Random list before sorting: ");
	bubble_list(head);
	print_list(head,cols, "List After sorting: ");
	
	return 0;
	
}
