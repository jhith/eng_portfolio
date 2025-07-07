/* Code for printing next day of year using struct */
/* Cousera Week2 assignment*/
/* J. H.E.  */
/* June 2025 */

#include <stdio.h>
#include <ctype.h>
#include <string.h>

// enum for months

typedef enum month{ 
	january, february, march, april, may, 
	june, july, august, september, october, november, december
} month;

//struct for date
typedef struct date{ 
	month m; 
	int d;
	} date; // date and month

// function to get the enum of month from the input month

month monthenum(const char *m_string){
	const char *month_names[]={
		"january", "february", "march", "april", "may", 
		"june", "july", "august", "september", "october", "november", "december"
	};	
    
	for(int i=0;i<12;i++){
		if(strcmp(m_string,month_names[i])==0){
		return (month)i ;
		}
	}
	return -1;
}

// function to get month name from the enum

const char* monthname(month m){
	const char *input_month[]={
		"january", "february", "march", "april", "may", 
		"june", "july", "august", "september", "october", "november", "december"
	};
	
 return input_month[m];
}

// max days for months
const int dayspermonth[]={
		31,28,31,30,31,30,31,31,30,31,30,31
	};


//  function to printdate(date) 
void printdate(date d){
	printf("%s %d\n",monthname(d.m),d.d);
}

//function to get next date
 
date nextdate(date d)
{
	date next_day = d;
	if(d.d<dayspermonth[d.m]){
		next_day.d += 1;
	}else{
		next_day.d =1;
		next_day.m = (d.m+1)%12; 
	}
	return next_day;
}



int main()
{
	char Month[10];
	int Date;
	date today;
	
	// get month and date from user and store in the struct  
	printf("Enter month(in lower case): ");
	scanf("%s", Month);
	printf("Enter day of the month(between 1-31): ");
	scanf("%d", &Date);
	
	today.m=monthenum(Month);
	today.d=Date;
	

	
	// checking input validity
	if (today.m<0||today.m>11||today.d<1||today.d > dayspermonth[today.m]){
		printf("invalide input date");
		return 1;
	}else{
		// print outputs
		printf("Today's date: ");
		printdate(today);
		
		date next=nextdate(today);
		printf("Next date: ");
		printdate(next);
		
	}
	
	return 0;
}

