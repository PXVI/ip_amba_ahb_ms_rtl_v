/* -----------------------------------------------------------------------------------
 * Module Name  : ip_amba_ahb5_decoder_mux_top
 * Date Created : 00:42:20 IST, 06 December, 2020 [ Sunday ]
 *
 * Author       : pxvi
 * Description  : AHB5 Decoder Multiplexor rtl top file
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

// ----------------------------------------------------------------------------------- */
// Future Modifications :
// ----------------------------------------------------------------------------------- */
// 1. Optionally make this combinational circuit interfacable with APB, such that the
// independent addresses of the designs can be configured.
// 2. Optionally add internal flops in the design which can be programmed with
// an external programmer to program the base memory address and an offset for
// specific slaves.
// ----------------------------------------------------------------------------------- */

`include "ip_amba_ahb5_decoder_mux_top_defines.vh"
`include "ip_amba_ahb5_decoder_mux_top_parameters.vh"

module ip_amba_ahb5_decoder_mux_top #(  parameter   N_SLAVES = 1,
                                                    HADDR_WIDTH = 32,
                                                    HRDATA_WIDTH = 32    )

                                    (   
                                        // Inputs
                                        input [HADDR_WIDTH-1:0] HADDR,
                                        input [HRDATA_WIDTH-1:0] HDATA_X[N_SLAVES],
                                        input [N_SLAVES-1:0] HREADYOUT, // From Slaves
                                        input [N_SLAVES-1:0] HRESP, // From Slaves

                                        // Outputs
                                        output [N_SLAVES-1:0] HSEL_X,
                                        output [N_SLAVES-1:0] HREADY_X, // To Master
                                        output [N_SLAVES-1:0] HRESP_X, // To Master
                                        output [HRDATA_WIDTH-1:0] HRDATA
                                    );

    reg [HRDATA_WIDTH-1:0] HRDATA_n;
    reg [N_SLAVES-1:0] HSEL_X_n;

    integer i;

    always@( * )
    begin
        for( i = 0; i < N_SLAVES; i = i + 1 )
        begin
            HSEL_X_n[i] = 0;
        end

        // Decoder for HSEL_X

        // A minimum of one slave will always exist
        if( ( HADDR >= `AHB_SLAVE_00_BASE_ADDR ) && ( HADDR < ( `AHB_SLAVE_00_BASE_ADDR + `AHB_SLAVE_00_BASE_OFFS ) ) )
        begin
            HSEL_X_n[0] = 1;
        end

        // Multiplexer for HRDATA
        if( HSEL_X_n[0] == 1'b1 )
        begin
            HRDATA_n = HDATA_X[0];
        end
    end

    // Slave 0
    assign HSEL_X[0] = HSEL_X_n[0];
    assign HREADY_X[0] = HREADYOUT[0];
    assign HRESP_X[0] = HRESP[0];

    assign HRDATA = HRDATA_n;

endmodule
