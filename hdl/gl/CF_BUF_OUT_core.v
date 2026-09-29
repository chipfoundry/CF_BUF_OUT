// Empty blackbox stub for hierarchical integration LVS.
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
endmodule
