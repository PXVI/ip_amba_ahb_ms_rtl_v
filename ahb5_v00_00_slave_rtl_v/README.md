# AHB Slave IP
RTL design for the AMBA AHB Slave. The list of features that are avialable in AHB Slave ( according to the verison ) and their details are given below in a list format.

1. Bus Width
    - Address Bus ( 32 )
    - Write Data Bus ( 32, 64, 128, 256, 512, 1024 ) 
    - Read Data Bus ( 32, 64, 128, 256, 512, 1024 ) 
2. Mandatory AHB Slave Control Signals
    - Global Signals
    - Slave Signals
1. Application Interface Signals ( Depending on the interfaced application )
1. Data Transfers
    - Single Transfers
    - Incremental Burst
    - Wrapping Burst
1. Extended Memory Type
1. Secure Transfers
1. Endianess
1. Stable Between Clock
1. Exclusive Transfers
1. Multi Copy Atomicity
1. Locked Transfers
1. Multiple Slave Select
1. Single Copy Atomicity Size
1. User Signaling

At the time of writing/updating this document, the AMBA AHB5 IHI0033B Issue B was used.
