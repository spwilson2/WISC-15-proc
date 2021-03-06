module control_unit(halt, Alu_Cmd, alu_src, reg_wrt, mem_to_reg, mem_wrt, branch, call, ret, set_over, set_zero,llb,lhb, Inst);
output [3:0] Alu_Cmd;
output reg_wrt, mem_to_reg, mem_wrt, branch, set_over, set_zero, call, ret, alu_src, llb, lhb;
output halt;
reg halt;
input [3:0] Inst;

reg reg_wrt, mem_to_reg, mem_wrt, branch, set_over, set_zero, call, ret, alu_src, llb, lhb;
reg Alu_Cmd;


always @ (Inst) begin
    //Default settings (for easier programming)
    mem_wrt <= 0;
    branch <= 0;
    set_zero <= 0;
    set_over <= 0;
    Alu_Cmd <= 4'b0000;
    call <= 0;
    ret <= 0;
    alu_src <= 0;
    lhb <= 0;
    llb <= 0;
    halt <= 0;

    case(Inst)
        4'b0000: //ADD
        begin
            reg_wrt <= 1;
            mem_to_reg <= 0;
            set_over <= 1;
            set_zero <= 1;
            Alu_Cmd <= 4'b0000;
        end
        4'b0001: //Paddsb
         begin
            reg_wrt <= 1;
            mem_to_reg <= 0;
            Alu_Cmd <= 4'b0010;
        end
        4'b0010: //sub
          begin
            reg_wrt <= 1;
            mem_to_reg <= 0;
            set_over <= 1;
            set_zero <= 1;
            Alu_Cmd <= 4'b0001;
        end
        4'b0011: //nand
           begin
            reg_wrt <= 1;
            mem_to_reg <= 0;
            set_zero <= 1;
            Alu_Cmd <= 4'b1000;
        end
        4'b0100: //xor
            begin
            reg_wrt <= 1;
            mem_to_reg <= 0;
            set_zero <= 1;
            Alu_Cmd <= 4'b0100;
        end
        4'b0101: //sll
                 begin
            reg_wrt <= 1;
            mem_to_reg <= 0;
            set_zero <= 1;
            Alu_Cmd <= 4'b1100;
            alu_src <= 1;
        end
        4'b0110: //srl
            begin
            reg_wrt <= 1;
            mem_to_reg <= 0;
            set_zero <= 1;
            Alu_Cmd <= 4'b1110;
            alu_src <= 1;
        end
        4'b0111: //sra
                    begin
            reg_wrt <= 1;
            mem_to_reg <= 0;
            set_zero <= 1;
            Alu_Cmd <= 4'b1111;
            alu_src <= 1;
        end
        4'b1000: //lw
         begin
            reg_wrt <= 1;
            mem_to_reg <= 1;
            alu_src <= 1;
        end
        4'b1001: //sw
                    begin
            reg_wrt <= 0;
            mem_to_reg <= 1;
            mem_wrt <= 1;
            alu_src <= 1;
        end
        4'b1010: //lhb
                    begin
            reg_wrt <= 1;
            mem_to_reg <= 0;
            alu_src <= 1;
            lhb <= 1;
        end
        4'b1011: //llb
                    begin
            reg_wrt <= 1;
            mem_to_reg <= 0;
            alu_src <= 1;
            llb <= 1;
        end
        4'b1100: //b
                    begin
            reg_wrt <= 0;
            mem_to_reg <= 1;
            branch <= 1;
        end
        4'b1101: //call
                    begin //NOTE: On call we add pc to zero and store.
            reg_wrt <= 1;
            mem_to_reg <= 0;
            call <= 1;
        end
        4'b1110: //ret
                    begin
            reg_wrt <= 0;
            mem_to_reg <= 1;
            ret <= 1;
        end
        4'b1111: //hlt
                    begin
            reg_wrt <= 0;
            mem_to_reg <= 1;
            halt <= 1;
            //To stop halting, just count down pipeline.
            //halt <= 1;
        end
    endcase
end
endmodule
