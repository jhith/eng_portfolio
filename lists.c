/* Code for doubly linked list and to remove duplicates in the list */
/* Cousera week3 honors assignment                                  */
/* J. H.                                                            */
/*  June 2025                                                       */
//////////////////////////////////////////////////////////////////////

#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<time.h>


// list doubly linked
typedef struct list{
	int data; 
	struct list *next;
	struct list *prev; 
	
	} list;
	
int is_empty(const list*l){
	return (l==NULL);
	}

// initialize doubly linked list	
list* create_list(int d){
	list* head = (list*)malloc(sizeof(list));
	head-> data=d;
	head -> next= NULL;
	head -> prev= NULL;
	return head;
}

// add an element to the end of the list
list* add_to_front(int d, list* h){
	 list* head = create_list(d);
	 head-> next = h;
	 if(h!=NULL){
		 h->prev = head; 	 
	 }
	 return head;
}


// put an array to the doubly linked list
list* array_to_list(int d[], int size){
	list* head=create_list(d[0]);
	for(int i=1;i<size;i++){
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

// remove repeats from the sorted list 
void remove_repeats(list *head){
	list* with_repeats = head;
	while(with_repeats !=NULL && with_repeats->next != NULL){
		if(with_repeats->data == with_repeats->next->data){
			list* no_repeats= with_repeats->next;
			with_repeats->next = no_repeats->next;
			if(no_repeats->next != NULL)
				no_repeats->next->prev = with_repeats;
			free(no_repeats);
		}else{
			with_repeats = with_repeats->next;
		}
	}
}



// generate 200 random numbers between 0-49, in an array and add to list

int main(){
	
	srand(time(NULL)); // random seed generate in each run of the code
	const int SIZE = 200; // array size
	const int cols = 5; //  number of numbers printed per row 
	int min_value = 0;
	int max_value = 49;
	int random_array[SIZE]; // initialize array
	
	// fill random values in the array
	for (int i=0;i < SIZE;i++){
		random_array[i] = min_value + rand()%(max_value-min_value + 1);
	}

	// store array in a list
	list *head = NULL;
	head = array_to_list(random_array,SIZE);
	print_list(head,cols, "Random list before sorting: ");
	
	bubble_list(head);  // sort using bubble sort
	remove_repeats(head);
	print_list(head,cols, "List After sorting: ");
	
	return 0;
	
}




