//****************** ECE319K_Lab2H.s ***************
// Your solution to Lab 2 in assembly code
// Author: Your name
// Last Modified: Your date
// ECE319H Spring 2025 (ECE319K students do Lab2)

    .include "../inc/msp.s"

        .data
        .align 2
// Declare global variables here if needed
// with the .space assembly directive
    morseCharacter: 
        .space 4
        .text
        .thumb
        .align 2
        .global EID
EID:    .string "JPA2484" // replace ZZZ123 with your EID here
        .align 2
  .equ dot,100
  .equ dash,(3*dot)
  .equ shortgap,(2*dot)  // because it will send an interelement too
  .equ interelement,dot
  Morse:
  .long  dot,  dash,    0,    0, 0 // A
  .long  dash,  dot,  dot,  dot, 0 // B
  .long  dash,  dot, dash,  dot, 0 // C
  .long  dash,  dot,  dot,    0, 0 // D
  .long  dot,     0,    0,    0, 0 // E
  .long  dot,   dot, dash,  dot, 0 // F
  .long  dash, dash,  dot,    0, 0 // G
  .long  dot,   dot,  dot,  dot, 0 // H
  .long  dot,   dot,    0,    0, 0 // I
  .long  dot,  dash, dash, dash, 0 // J
  .long  dash,  dot, dash,    0, 0 // K
  .long  dot,  dash,  dot,  dot, 0 // L
  .long  dash, dash,    0,    0, 0 // M
  .long  dash,  dot,    0,    0, 0 // N
  .long  dash, dash, dash,    0, 0 // O
  .long  dot,  dash, dash,  dot, 0 // P
  .long  dash, dash,  dot, dash, 0 // Q
  .long  dot,  dash,  dot,    0, 0 // R
  .long  dot,   dot,  dot,    0, 0 // S
  .long  dash,    0,    0,    0, 0 // T
  .long  dot,   dot, dash,    0, 0 // U
  .long  dot,   dot,  dot, dash, 0 // V
  .long  dot,  dash, dash,    0, 0 // W
  .long  dash,  dot,  dot, dash, 0 // X
  .long  dash,  dot, dash, dash, 0 // Y
  .long  dash, dash,  dot,  dot, 0 // Z

  .align 2
  .global Lab2Grader
  .global Lab2
  .global Debug_Init // Lab3 programs
  .global Dump       // Lab3 programs

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
    MOVS R0,#10  // 0 for info, 1 debug with logic analyzer, 2 debug with scope, 10 for grade
    BL   Debug_Init
    BL   Lab2Init   // you initialize input pin and output pin

loop:
    //BL   Debug_Init
    BL waitForSwitch

    MOVS R0,#10
    BL   Lab2Grader
    LDR R6, =morseCharacter
    MOVS R0, 0x4f
    STR R0, [R6] // STORE THE CHAR SOMEWHERE

    BL sendMorse
    LDR R0, =0x00010000
    //BL Debug_Period()
    BL Debug_Duty();
    B   loop




// make switch an input, LED an output
// PortB is already reset and powered
// Set IOMUX for your input and output
// Set GPIOB_DOE31_0 for your output (be friendly)
Lab2Init:
// ***do not reset/power Port A or Port B, already done****
   LDR R1, =0x00040081 
   LDR R0, =IOMUXPB0 // setting R0 as the address of the port
   LDR R2, [R0]
   ORRS R2, R2, R1
   STR R2, [R0] // setting PB0 as input

   MOVS R1, #0x81   
   LDR R0, =IOMUXPB16 // setting R0 as the address of the port
    LDR R2, [R0]
   ORRS R2, R2, R1
   STR R2, [R0] // setting PB16 as OUTPUT

   LDR  R0,=GPIOB_DOE31_0
   LDR R1, [R0]
   LDR R2, =0x00010000
   ORRS R2, R2, R1
   STR R2, [R0]

   BX   LR

sendMorse:
    PUSH {LR}
    LDR R6, =morseCharacter
    LDR R6, [R6] // LOAD R6 WITH CHAR
    SUBS R6, R6, 0x41 // R6 WILL NOW CONTAIN THE DIFFERENCE BETWEEN OUR CHARACTER AND ASCII 'A'

    LDR R5, =Morse // load R5 with the addr of morse
    // each variable is 4 bytes in .long, and all of our morse letters have 5 variables in them
    // so to get to the next letter, multiply by 20
    MOVS R7, #20
    MULS R6, R6, R7 // MULTIPLY R6 BY 20
    ADDS R5, R5, R6 // add to get the morse we want
    morseLoop:
        LDR R2, [R5]
        CMP R2, #0
        BEQ morseFinish

        CMP R2, 0x64 // means that we have a DOT
        BEQ isDot

        B isDash // IF NOT EITHER, IT'S A DASH!!!!!!!!!!!

        isDash:
            BL dashM
            ADDS R5, R5, #4 // GO TO THE NEXT VALUE
            B morseLoop
        isDot:
            BL dotM
            ADDS R5, R5, #4 // GO TO THE NEXT VALUE
            B morseLoop

    morseFinish:  
        POP {R7}
        MOV LR, R7  
        BX LR
ledOn:
    PUSH {LR}
    LDR R0, =GPIOB_DOUT31_0 // we load R0 with the output of GPIOB
    LDR R1, [R0] // we want to load the contents of GPIOB out
    LDR R2, =0x00010000 
    ORRS R1, R1, R2 // we activate the bit with respect to our output (PB16)
    STR R1, [R0] // we store it back so its actually activated
    BL Dump
    POP {R7}
    MOV LR, R7  
    BX LR

ledOff:
    PUSH {LR}
    LDR R0, =GPIOB_DOUT31_0
    LDR R1, [R0]
    LDR R2, =0x00010000
    BICS R1, R1, R2 // same as LED on, but it clears PB16
    STR R1, [R0]
    BL Dump
    POP {R7}
    MOV LR, R7  
    BX LR

delay:
    SUBS R0, R0, #2 // subtract 2 to compensate with the amount of time that it took to get here
    delayLoop:
    SUBS R0, R0, #4 // subtracts 4 to compensate the time that it took to get to this instruction again...
    NOP
    BHS delayLoop // reads flag. If C = 1 (SUBS sets this), then branches. If c = 0, then it doesn't
    BX LR

dotM:
    PUSH {LR}

    BL ledOn // turns led on
    BL Dump

    LDR R0, =8000000; // 100ms sec delay 
    BL delay // wait

    BL ledOff // led off

    LDR R0, =8000000; // 100ms sec delay FOR INTER-ELEMENT TIMING
    BL delay // wait

    POP {R7}
    MOV LR, R7;

    BX LR

waitForSwitch:
    PUSH {LR}
    smallLoop:
        BL switchInput // waiting to change to 1, so we confirm switch is On
        CMP R1, #0
        BEQ smallLoop
    POP {R1}
    MOV LR, R1
    BX LR

switchInput:
    LDR R0, =GPIOB_DIN31_0 
    LDR R1, [R0]
    LDR R2, =0x01
    ANDS R1, R1, R2 // R1 will become a 0 or a 1 depending whether the switch is pressed or not.
    BX LR


dashM: // same as dot but with 300 ms delay
    PUSH {LR}
    BL ledOn
    
    LDR R0, =24000000; // 300ms sec delay
    BL delay
    
    BL ledOff

    LDR R0, =8000000; // 100ms sec delay FOR INTERTIMING
    BL delay

    POP {R7}
    MOV LR, R7;

    BX LR
   .end




