//****************** ECE319K_Lab2.s ***************
// Your solution to Lab 2 in assembly code
// Author: Your name
// Last Modified: Your date
// ECE319K Spring 2025 (ECE319H students do Lab2H)
// I/O port addresses
    .include "../inc/msp.s"

        .data
        .align 2
// Declare global variables here if needed
// with the .space assembly directive

//.equ BusCyclesPerSecond, 80000000
//.equ Hz, 50
//.equ Period, BusCyclesPerSecond/Hz


//cycles:
//        .long 
//        .long
//        .long
//        .long

        .text
        .thumb
        .align 2
        .global EID
EID:    .string "TMS4594" // replace ZZZ123 with your EID here
        .align 2

High:
        .long 0,160000, 480000, 1040000, 1120000, 0
        //.long 480000
        //.long 1040000
        //.long 1120000
        //.long 0

Low:
        .long 0,1440000, 1120000, 560000, 480000, 0
        //.long 1120000
        //.long 560000
        //.long 480000
        //.long 0

// this allow your Lab2 programs to the Lab2 grader
        .global Lab2Grader
// this allow the Lab2 grader to call your Lab2 program
        .global Lab2
// these two allow your Lab2 programs to all your Lab3 solutions
        .global Debug_Init
        .global Dump

// Switch input: PB2 PB1 or PB0, depending on EID
// LED output:   PB18 PB17 or PB16, depending on EID
// logic analyzer pins PB18 PB17 PB16 PB2 PB1 PB0
// analog scope pin PB20
Lab2:
// Initially the main program will
//   set bus clock at 80 MHz,
//   reset and power enable both Port A and Port B
// Lab2Grader will
//   configure interrupts  on TIMERG0 for grader or TIMERG7 for TExaS
//   initialize ADC0 PB20 for scope,
//   initialize UART0 for grader or TExaS
MOVS R0, #3

// 0 for info,
// 1 debug with logic analyzer,
// 2 debug with scope,
// 3 debug without scope or logic analyzer
// 10 for grade
     BL   Lab2Grader
     BL   Debug_Init // your Lab3 (ignore this line while doing Lab 2)
     BL   Lab2Init

restart:
LDR R4, =High
LDR R5, =Low
LDR R6, [R4]
LDR R7, [R5]
loop:
//turn on LED
//Delay
//turn off
//delay
//check switch
//
        //LDR R4, =High
        //LDR R5, =Low
        BL Switch_Input
        CMP R0, #1
        BEQ loop
        CMP R6, #0
        BEQ restart
        BL LEDToggle
        B loop


// make switch an input, LED an output
// PortB is already reset and powered
// Set IOMUX for your input and output
// Set GPIOB_DOE31_0 for your output (be friendly)

//Initiliaze PB0 as input and PB18 as output in Lab2init
//

Lab2Init:
// ***do not reset/power Port A or Port B, already done****
        LDR R0, =IOMUXPB18
        MOVS R1, #0x81
        LDR R2, [R0]
        ORRS  R2, R2, R1
        STR R2,[R0]
        
        LDR  R0, =GPIOB_DOE31_0
        LDR  R1, [R0]   // previous
        LDR R2, =0x40000
        ORRS R2, R2, R1 // clear bit 0
        STR  R2, [R0]   // perform output

        LDR R0, =IOMUXPB0
        LDR R1, =0x00040081
        LDR R2, [R0]
        ORRS R2, R2, R1
        STR R2, [R0]
        BX LR

Switch_Input:  // read PB0 input
        LDR  R1,=GPIOB_DIN31_0
        MOVS R3,#0x01
        LDR  R0,[R1]  // contents of GPIOB
        ANDS R0,R0,R3
        ADDS R4, R4, #4 //move to next character
        ADDS R5, R5, #4 //move to next character
        LDR R6, [R4]
        LDR R7, [R5]
        BX   LR

LEDToggle:
        BL LED_On
        MOVS R0, R6
        BL Delay
        BL LED_Off
        MOVS R0, R7
        BL Delay
        B loop

LED_On:
        LDR R0, =GPIOB_DOUT31_0
        LDR R1, [R0]
        LDR R2, =0x40000
        ORRS R1, R1, R2
        STR R1, [R0]
        BX LR
LED_Off:
        LDR R0, =GPIOB_DOUT31_0
        LDR R1, [R0]
        LDR R2, =0x40000
        BICS R1, R1, R2
        STR R1,[R0]
        BX LR
//Delay:
        //SUBS R0, R0, #2
//dloop:
 //       SUBS R0, R0, #1
 //       BNE dloop
 //       BX LR


   .end
