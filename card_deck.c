/* Code for random shuffle of card deck             */
/* evaluate random hands and matching probabilities */
/* using monte-carlo simulation                     */
/* Cousera Week2 honors assignment                  */
/* J H. E.                                          */
/* June 2025                                        */
//////////////////////////////////////////////////////


#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

#define HANDS 1000000

typedef enum suit{ 
	hearts, diamonds, clubs, spades
} suit;

//struct for card in the deck
typedef struct card{ 
	suit s;   // enum for suit
	short p; // short int for pips 0-12
	} card;
	
	
// values for pips	
const char *pips[]={
	"ace","2","3","4","5","6","7","8","9","10","jack","queen","king"
};

// suit names
const char *suits[]={
	"hearts", "diamonds", "clubs", "spades"
};
	
// function to create card deck 52 cards
void create_deck(card deck[]){
	int i = 0;
	for(int s =0;s < 4; s++){
		for(int p = 0; p < 13; p++){
			deck[i].s = (suit)s;
			deck[i].p = p;
			i++;
		}
	}
}

// function to randomly shuffle the deck 
void shuffle_deck(card deck[], int size){
	for(int i = size-1; i > 0; i--){
		int j = rand()%(i+1);
		//swap cards
		card temp = deck[i];
		deck[i] = deck[j];
		deck[j] = temp; 
	}
}

// function to randomly deal 7 card hands
void deal_hand(card deck[],card hand[],int hand_size){
	for (int i = 0; i < hand_size; i++){
		hand[i] = deck[i]; // copy the dealt hand into seperate array
	}
	/*printf("Dealt hand: \n");
	for (int i = 0; i < hand_size; i++){
		printf("%s of %s \n", pips[hand[i].p], suits[hand[i].s]);
	} */
}

// matches from the hand
const char *matches[]={
	"No pairs","One pair","Two pairs","Three of a kind","Full house","Four of a kind"
};


// Evaluate the dealt hand
int evaluate_hand(card hand[]){
	int pip_count[13]={0}; // count initalized to zero
	for(int i=0; i< 7; i++){
		pip_count[hand[i].p]++;
	}
	int pairs = 0;
	int threes = 0;
	int fours = 0;
	
	for(int i =0; i < 13; i++){
		if (pip_count[i] == 2 ) 
			pairs++;
		else if(pip_count[i] == 3)
			threes++;
		else if(pip_count[i] == 4)
			fours++; 
	}
	if(fours) return 5;               // Four of a kind
	if(threes && pairs) return 4;     // Full House
	if (threes) return 3;             // Three of a kind
	if(pairs == 2) return 2;          // Two pair
	if(pairs == 1) return 1;          // One pair
	return 0;                         // No pair
}


int main(){
	srand(time(NULL)); // random seed for shuffling
	card deck[52]; // initialize deck
	card hand[7];  // initialize dealt hand 
	int counts[6]={0}; //{0=no pair, 1= one pair, 2= two pairs, 3= threes, 4= threes and pairs, 5= four of a kind}
	
	
	for(int i=0;i<HANDS;i++){
		create_deck(deck);
		shuffle_deck(deck,52);
		deal_hand(deck,hand,7);
	    int result = evaluate_hand(hand);	
		counts[result]++;
	}
	
	
// Run Monte-Carlo simulation for probabilities
	printf("Probabilities of %d hands: \n",HANDS);
	for(int i=0; i<6; i++){
		printf("%s : %d %6.7f \n ", matches[i], counts[i],(double)counts[i]/HANDS);
	}
	
	return 0;
	
}
