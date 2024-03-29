`timescale  1ns / 1ns
module tb_state_control;

// state_control Parameters
parameter PERIOD  = 10;


// state_control Inputs
reg   clk                                  = 0 ;
reg   rstn                                 = 0 ;
reg   [31:0]  touch_data                   = 0 ;

// state_control Outputs
wire  point_flag                           ;
wire  [6:0]  money                         ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rstn  =  1;
end

state_control  u_state_control (
    .clk                     ( clk                ),
    .rstn                    ( rstn               ),
    .touch_data              ( touch_data  [31:0] ),

    .point_flag              ( point_flag         ),
    .money                   ( money       [6:0]  )
);

initial
begin
    #40 touch_data = {16'd20,16'd100};
    #10 touch_data = 0;
    #30 touch_data = {16'd315,16'd100};
    #10 touch_data = 0;
    #30 touch_data = {16'd617,16'd85};
    #10 touch_data = 0;
    #30 touch_data = {16'd630,16'd250};
    #10 touch_data = 0; 
    #30 touch_data = {16'd617,16'd85};
    #10 touch_data = 0;
    #30 touch_data = {16'd630,16'd250};
    #10 touch_data = 0;
    #30 touch_data = {16'd710,16'd85};
    #10 touch_data = 0;
   // #30 touch_data = {16'd630,16'd320};
    #30 touch_data = {16'd630,16'd250};
    #10 touch_data = 0;
end

endmodule