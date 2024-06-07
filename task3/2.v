1.	module rowWiseProduct (
2.	    input logic [31:0] arr [2:0][3:0],
3.	    output logic [31:0] product [2:0]
4.	);
5.	    always_comb begin
6.	        for (int i = 0; i < 3; i++) begin
7.	            product[i] = 32'd1; // Initialize product to 1 for each row
8.	            for (int j = 0; j < 4; j++) begin
9.	                product[i] = product[i] * arr[i][j];
10.	            end
11.	        end
12.	    end
13.	endmodule
14.	
15.	module tb;
16.	    logic [31:0] arr [2:0][3:0];
17.	    logic [31:0] product [2:0];
18.	
19.	    rowWiseProduct uut (
20.	        .arr(arr),
21.	        .product(product)
22.	    );
23.	
24.	    initial begin
25.	        // Initialize the array
26.	        arr[0][0] = 1; arr[0][1] = 2; arr[0][2] = 3; arr[0][3] = 4;
27.	        arr[1][0] = 5; arr[1][1] = 6; arr[1][2] = 7; arr[1][3] = 8;
28.	        arr[2][0] = 9; arr[2][1] = 10; arr[2][2] = 11; arr[2][3] = 12;
29.	
30.	        #10; // Wait for computation
31.	
32.	        // Display the results
33.	        $display("Row-wise products:");
34.	        for (int i = 0; i < 3; i++) begin
35.	            $display("Product of row %0d: %0d", i, product[i]);
36.	        end
37.	
38.	        $finish;
39.	    end
40.	endmodule
