`timescale 1ns / 1ps

// Ideal functional model of analog leaf CF_BUF_OUT_core.
// Drop this file in place of hdl/gl/CF_BUF_OUT_core.v for simulation.
// Do not add it to OpenLane VERILOG_FILES.
//
// Assumed protocol (ideal, not silicon-verified):
//   * pd high clears Out.
//   * Otherwise, when enable_hv is high, Out follows INP.
// This is not a linear amplifier and does not model unity-gain accuracy,
// external-component gain, load drive, or class/power modes.
// offset_trim, pwr_modes, IBIAS, INM, vneg, and vpwr_core are not modeled.
// vpwr, vgnd, vpb, and vnb are supply inputs and are not generated.

module CF_BUF_OUT_core (
    Out,
    IBIAS,
    vneg,
    vpwr_core,
    vgnd,
    vpwr,
    vpb,
    vnb,
    INM,
    INP,
    offset_trim,
    pd,
    enable_hv,
    pwr_modes
);
    output Out;
    input IBIAS;
    input vneg;
    inout vpwr_core;
    input vgnd;
    input vpwr;
    input vpb;
    input vnb;
    input INM;
    input INP;
    input [4:0] offset_trim;
    input pd;
    input enable_hv;
    input [1:0] pwr_modes;

    reg out_r;
    assign Out = out_r;
    wire run = (pd !== 1'b1) && (enable_hv === 1'b1);
    always @* begin
        out_r = 1'b0;
        if (run)
            out_r = (INP === 1'b1);
    end
endmodule
