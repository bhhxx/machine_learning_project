1.	#include <stdio.h>
2.	
3.	#define ROWS 3
4.	#define COLS 4
5.	
6.	void rowWiseProduct(int arr[ROWS][COLS], int rows, int cols, int product[]) {
7.	    for (int i = 0; i < rows; i++) {
8.	        product[i] = 1; // Initialize product to 1 for each row
9.	        for (int j = 0; j < cols; j++) {
10.	            product[i] *= arr[i][j];
11.	        }
12.	    }
13.	}
14.	
15.	int main() {
16.	    int arr[ROWS][COLS] = {
17.	        {1, 2, 3, 4},
18.	        {5, 6, 7, 8},
19.	        {9, 10, 11, 12}
20.	    };
21.	
22.	    int product[ROWS];
23.	
24.	    rowWiseProduct(arr, ROWS, COLS, product);
25.	
26.	    printf("Row-wise products:\n");
27.	    for (int i = 0; i < ROWS; i++) {
28.	        printf("Product of row %d: %d\n", i, product[i]);
29.	    }
30.	
31.	    return 0;32.	}
