/* Code for random array sorted using bubble sort */
/* Cousera week3 assignment */
/* J. H. */
/*  June 2025*/
//////////////////////////////////////////////////////
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<time.h>


// bubble sort
void swap(int *a,int *b){
		int temp = *a;
		*a = *b;
		*b = temp;
}
// print array
void print_array(int how_many, int data[], char *str){
	int i;
	printf("%s", str);
	for (i=0;i<how_many; i++)
		printf("%f\n", data[i]);
}

void bubble(int data[],int how_many){
	int i,j;
	int go_on;
	
	for (i=0;i<how_many; i++){
	for(j=how_many-1;j>i;j--)
		if(data[j-1]>data[j])
			swap(&data[j-1],&data[j]);		
	}
	
}

// print the random data in a matrix
void matrix_print(int data[],int array_size,int cols){
	int i,j;
	for (i=0;i<array_size/cols; i++){
		for (j=0;j<cols;j++){
			printf("%d\t", data[i*cols + j]);
		}	
		printf("\n");
	}
}


// generate 100 random numbers array and add to list

int main(){
	
	srand(time(NULL)); // random seed generate in each run of the code
	const int SIZE = 100; // array size
	const int cols = 5; //  number of numbers printed per row 
	int min_value = 1;
	int max_value = 100;
	int random_array[SIZE]; // initialize array
	int sorted[SIZE];
	
	for (int i=0;i<SIZE;i++){
		random_array[i] = min_value + rand()%(max_value-min_value + 1);
	}
		
	// print the array - 5 per each row	
	// print generated array
	printf("Generated random array: \n\n");
	matrix_print(random_array,SIZE,cols);
	printf("\n");
	bubble(random_array,SIZE);
	printf("Sorted array: \n\n");
	matrix_print(random_array,SIZE,cols);
	
	return 0;
	
}

