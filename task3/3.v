1.	module rowWiseProduct (
2.	    input [31:0] arr [0:2][0:3],
3.	    output reg [31:0] product [0:2]
4.	);
5.	    // Calculate the product of each row
6.	    always @(*) begin
7.	        integer i, j;
8.	        for (i = 0; i < 3; i = i + 1) begin
9.	            product[i] = 32'd1; // Initialize product to 1 for each row
10.	            for (j = 0; j < 4; j = j + 1) begin
11.	                product[i] = product[i] * arr[i][j];
12.	            end
13.	        end
14.	    end
15.	endmodule
16.	module tb;
17.	    // Parameters for array dimensions
18.	    parameter ROWS = 3;
19.	    parameter COLS = 4;
20.	    // Signals for the testbench
21.	    reg [31:0] arr [0:ROWS-1][0:COLS-1];
22.	    wire [31:0] product [0:ROWS-1];
23.	
24.	    // Instantiate the rowWiseProduct module
25.	    rowWiseProduct uut (
26.	        .arr(arr),
27.	        .product(product)
28.	    );
29.	    // Task to print the row-wise products
30.	    task print_products;
31.	        integer i;
32.	        begin
33.	            $display("Row-wise products:");
34.	            for (i = 0; i < ROWS; i = i + 1) begin
35.	                $display("Product of row %0d: %0d", i, product[i]);
36.	            end
37.	        end
38.	    endtask
39.	    initial begin
40.	        integer i, j;
41.	        // Define and initialize the custom values array
42.	        arr[0][0] = 32'd1; arr[0][1] = 32'd2; arr[0][2] = 32'd3; arr[0][3] = 32'd4;
43.	        arr[1][0] = 32'd5; arr[1][1] = 32'd6; arr[1][2] = 32'd7; arr[1][3] = 32'd8;
44.	        arr[2][0] = 32'd9; arr[2][1] = 32'd10; arr[2][2] = 32'd11; arr[2][3] = 32'd12;
45.	        #10; // Wait for computation to complete
46.	        // Call the task to print the results
47.	        print_products();
48.	        $finish; // Terminate the simulation
49.	    end
50.	endmodule
