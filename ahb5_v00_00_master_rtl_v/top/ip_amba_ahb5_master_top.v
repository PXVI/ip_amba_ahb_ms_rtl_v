/* -----------------------------------------------------------------------------------
 * Module Name  : ip_amba_ahb5_master_v00_00_top
 * Date Created : 00:30:38 IST, 06 December, 2020 [ Sunday ]
 *
 * Author       : pxvi
 * Description  : AHB5 Master top rtl file
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

`include "ip_amba_ahb5_master_v00_00_top_defines.vh"
`include "ip_amba_ahb5_master_v00_00_top_parameters.vh"

module ip_amba_ahb5_master_v00_00_top   #(  parameter   HADDR_WIDTH = 32,
                                                        HDATA_WIDTH = 32 // Supported data widths are 32, 64, 128, 256, 512 and 1024
                                        )
                                        (   
                                            // Global SIgnals
                                            input HRESETn,
                                            input HCLK,

                                            // Inputs
                                            input HREADY, // Transfer Response
                                            input HRESP, // Transfer Response
                                            input [HDATA_WIDTH-1:0] HRDATA, // Data

                                            // Outputs
                                            output [HADDR_WIDTH-1:0] HADDR, // Address & Control
                                            output HWRITE, // Address & Control
                                            output [2:0] HSIZE, // Address & Control
                                            output [2:0] HBURST, // Address & Control
                                            output [3:0] HPROT, // Address & Control
                                            output [1:0] HTRANS, // Address & Control
                                            output HMASTLOCK, // Address & Control
                                            output [HDATA_WIDTH-1:0] HWDATA, // Data

                                            // Application Layer Inputs
                                            input [HDATA_WIDTH-1:0] app_write_data_bus,
                                            input app_rw_data_txn,
                                            input [HADDR_WIDTH-1:0] app_rw_addr,
                                            input app_begin_new_txn_addr_phase,
                                            input app_terminate_txn,
                                            // Application Layer Outputs
                                            output app_ready_for_new_txn_addr_phase,
                                            output app_read_data_ready, // There is no received data handshake between M & S. So it is advised to use a recieve buffer in master for read data.
                                            output [HDATA_WIDTH-1:0] app_read_data_bus,
                                            output app_read_error
                                        );

endmodule
