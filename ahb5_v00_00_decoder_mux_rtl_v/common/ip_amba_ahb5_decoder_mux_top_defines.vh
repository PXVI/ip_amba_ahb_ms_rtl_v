/* -----------------------------------------------------------------------------------
 * Module Name  :
 * Date Created : 00:41:52 IST, 06 December, 2020 [ Sunday ]
 *
 * Author       : pxvi
 * Description  : AHB5 decoder multiplexor's rtl defines
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

// Basic fixed address for the decoding slaves
// - Addresses will be 1KB aligned and hence all the addresses will have
// a base address with lower 10 bits set to 0
// - Additionally a base offset is provided for deciding the range of the
// address space

// Slave 00 ( Address : Base to Base+1K )
    `define AHB_SLAVE_00_BASE_ADDR          'h00_00_04_00
    `define AHB_SLAVE_00_BASE_OFFS          'h00_00_00_01

// Slave 01 ( Address : Base to Base+2K )
    `define AHB_SLAVE_01_BASE_ADDR          'h00_00_05_00
    `define AHB_SLAVE_01_BASE_OFFS          'h00_00_00_02

// Slave 02 ( Address : Base to Base+4K )
    `define AHB_SLAVE_02_BASE_ADDR          'h00_00_07_00
    `define AHB_SLAVE_02_BASE_OFFS          'h00_00_00_04
