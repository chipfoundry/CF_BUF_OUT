`timescale 1ns / 1ps

module tb_CF_BUF_OUT;
    reg pd;
    reg enable_hv;
    reg INP;
    wire Out;
    integer errors;

    CF_BUF_OUT dut (
        .pd(pd),
        .enable_hv(enable_hv),
        .INP(INP),
        .Out(Out)
    );

    initial begin
        errors = 0;
        pd = 1'b1;
        enable_hv = 1'b1;
        INP = 1'b1;
        #1;
        if (Out !== 1'b0) begin
            $display("FAIL power-down Out=%b", Out);
            errors = errors + 1;
        end
        pd = 1'b0;
        #1;
        if (Out !== 1'b1) begin
            $display("FAIL follow high Out=%b", Out);
            errors = errors + 1;
        end
        INP = 1'b0;
        #1;
        if (Out !== 1'b0) begin
            $display("FAIL follow low Out=%b", Out);
            errors = errors + 1;
        end
        enable_hv = 1'b0;
        INP = 1'b1;
        #1;
        if (Out !== 1'b0) begin
            $display("FAIL disabled Out=%b", Out);
            errors = errors + 1;
        end
        if (errors == 0) $display("PASS");
        else begin
            $display("FAIL %0d", errors);
            $fatal(1);
        end
        $finish;
    end
endmodule
