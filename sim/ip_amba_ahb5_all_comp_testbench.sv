/* -----------------------------------------------------------------------------------
 * Module Name  : ip_amba_ahb_all_comp_testbench
 * Date Created : 00:19:05 IST, 20 December, 2020 [ Sunday ]
 *
 * Author       : pxvi
 * Description  : A basic testbench for all the components in the AHB spec
 *                This testbench is meant for only generic testing and for simple
 *                quick bring up to save verification time.
 * -----------------------------------------------------------------------------------

   MIT License

   Copyright (c) 2020 k-sva

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the Software), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.

 * ----------------------------------------------------------------------------------- */

`include "ip_amba_ahb5_decoder_mux_top.v"
`include "ip_amba_ahb5_master_top.v"
`include "ip_amba_ahb5_slave_top.v"

module ip_amba_ahb5_all_comp_testbench;
 
    // Testbench
    // +++++++++
 
    // Signal Declarations
    
    reg [31:0] input_hdata;

    // AHB Decoder/Mux Instance
    ip_amba_ahb5_decoder_mux_top ahb_dec_mux_00     (
                                                        .HADDR(input_hdata),
                                                        .HDATA_X(),
                                                        .HSEL_X(),
                                                        .HRDATA()
                                                    );




    initial
    begin
        forever
        begin
            #10;
            input_hdata = $urandom;
            $display( $time, " -> %0d", input_hdata );
        end
    end



    initial // End Simulation Condition
    begin
        #1000;
        $finish;
    end
    
    `ifdef GEN_DUMP
        initial
        begin
            $dumpfile( "ip_abh5_all_comp_tb.vcd" );
            $dumpvars( 0, ip_amba_ahb5_all_comp_testbench );
        end
    `endif

endmodule
