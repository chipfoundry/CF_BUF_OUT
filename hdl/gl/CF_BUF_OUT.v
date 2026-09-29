// Structural PG wrapper. Analog leaf is CF_BUF_OUT_core.
// Customer rails are vpwr/vgnd; well taps vpb/vnb/vpbe are tied inside.
module CF_BUF_OUT (
    Out,
    IBIAS,
    vneg,
    vpwr_core,
    vgnd,
    vpwr,
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
    input INM;
    input INP;
    input [4:0] offset_trim;
    input pd;
    input enable_hv;
    input [1:0] pwr_modes;
    CF_BUF_OUT_core u_core (
        .Out(Out),
        .IBIAS(IBIAS),
        .vneg(vneg),
        .vpwr_core(vpwr_core),
        .vgnd(vgnd),
        .vpwr(vpwr),
        .vpb(vpwr),
        .vnb(vgnd),
        .INM(INM),
        .INP(INP),
        .offset_trim(offset_trim),
        .pd(pd),
        .enable_hv(enable_hv),
        .pwr_modes(pwr_modes)
    );
endmodule
