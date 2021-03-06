
`include "alu/alu.v"
//`include "alu/au.v"
//`include "alu/full_adder.v"

module alu_tb();
reg [16:0] A, B; //Inputs A and B
reg [3:0] Alu_Ctrl; //The Alu_Control Signals
wire [16:0] Result; //Result of alu
wire z,n,v; //Flags output.

alu iDUT(Result[15:0], v, n, z, A[15:0], B[15:0], Alu_Ctrl, 0, 0);
assign Result[16] = 0; //Make the garbage bit auto 0

initial begin
    //TEST ADD
    //Alu_Ctrl = 4'b0000;
    //for (A = 0; A < (1<<15); A = A+31) begin
    //    for (B = 0; B < (1<<15); B = B+73) begin
    //        #1
    //        if (Result != (A+B))
    //            $display("BAD ADD, A:%h B%h Result:%b Expected:%h", A, B, Result, A+B);
    //            //$display("BAD ADD, A:%h B%h Result:%b Expected:%h, v:%b, n:%b z:%b", A, B, Result, A+B, v,n,z);
    //    end
    //end

    //TEST SUB
    Alu_Ctrl = 4'b0001;
    A = 6;
    B = 6;
#1
    if (Result != 0)
        $display("BAD SUB, A:%h B%h Result:%b Expected:%h, v:%b, n:%b z:%b", A, B, Result, 0, v,n,z);
        $display("BAD SUB, A:%h B%h Result:%b Expected:%h, v:%b, n:%b z:%b", A, B, Result, 0, v,n,z);
    //for (A = 0; A < (1<<15); A = A+31) begin
    //    for (B = 0; B < (1<<15); B = B+73) begin
    //        #1
    //        if (Result != ((A-B)& 17'h0ffff))
    //            $display("BAD SUB, A:%h B%h Result:%h Expected:%h", A, B, Result, ((A-B)& 17'h0ffff));
    //            //$display("BAD ADD, A:%h B%h Result:%b Expected:%h, v:%b, n:%b z:%b", A, B, Result, A+B, v,n,z);
    //    end
    //end



    //TEST XOR
    //Alu_Ctrl = 4'b1000;
    //for (A = 0; A < (1<<16); A = A+31) begin
    //    for (B = 0; B < (1<<16); B = B+73) begin
    //        #1
    //        if (Result != (A^B))
    //            $display("BAD XOR, A:%h B%h Result:%h Expected:%h", A, B, Result, A^B);
    //    end
    //end
    
    ////TEST NAND
    //Alu_Ctrl = 4'b0100;
    //for (A = 0; A < (1<<16); A = A+31) begin
    //    for (B = 0; B < (1<<16); B = B+73) begin
    //        #1
    //        if (Result != (~(A&B)& 17'h0ffff))
    //            $display("BAD NAND, A:%b B%b Result:%b Expected:%h", A, B, Result, ~(A&B)& 17'h0ffff);
    //    end
    //end

    ////TEST LEFT LOG SHIFT
    //Alu_Ctrl = 4'b1100;
    //for (A = 0; A < (1<<16); A = A+31) begin
    //    for (B = 0; B < (1<<16); B = B+73) begin
    //        #1
    //        if (Result != ((A << B[3:0])& 17'h0ffff))
    //            $display("BAD NAND, A:%h B%h Result:%h Expected:%h", A, B, Result, (A << B[3:0]) & 17'h0ffff);
    //    end
    //end
    
    //TEST SRL
    //Alu_Ctrl = 4'b1110;
    //for (A = 0; A < (1<<16); A = A+31) begin
    //    for (B = 0; B < (1<<16); B = B+73) begin
    //        #5
    //        if (Result != ((A >> B[3:0])& 17'h0ffff))
    //            $display("BAD NAND, A:%b B%b Result:%b Expected:%h", A, B, Result, (A >> B[3:0]) & 17'h0ffff);
    //            $display("BAD NAND, A:%b B%b Result:%b Expected:%h", A, B, Result, (A >> B[3:0]) & 17'h0ffff);
    //    end
    //end

    //TEST SRA
    //Alu_Ctrl = 4'b1111;
    //for (A = 16'hf000; A < (1<<16); A = A+31) begin
    //    for (B = 0; B < (1<<16); B = B+73) begin
    //        #1
    //        if (Result != ( A[15:0] >>> B[3:0])) //TODO: Doesn't work for sign extension test since doesn't recognize A[15:0] as signed.
    //            $display("BAD NAND, A:%h B%h Result:%h Expected:%h", A, B, Result, (A[15:0] >>> B[3:0]));
    //    end
    //end


    //TODO: TEST FLAGS and ADDER.


    
end

endmodule
