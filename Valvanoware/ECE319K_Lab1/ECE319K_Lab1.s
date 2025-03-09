//****************** ECE319K_Lab1.s ***************
// Your solution to Lab 1 in assembly code
// Author: Your name
// Last Modified: Your date
// Spring 2025
        .data
        .align 2
// Declare global variables here if needed
// with the .space assembly directive

        .text
        .thumb
        .align 2
        .global EID
EID:    .string "JPA2484" // replace ZZZ123 with your EID here

        .global Phase
        .align 2
Phase:  .long 10
// Phase= 0 will display your objective and some of the test cases, 
// Phase= 1 to 5 will run one test case (the ones you have been given)
// Phase= 6 to 7 will run one test case (the inputs you have not been given)
// Phase=10 will run the grader (all cases 1 to 7)
        .global Lab1
// Input: R0 points to the list
// Return: R0 as specified in Lab 1 assignment and terminal window
// According to AAPCS, you must save/restore R4-R7
// If your function calls another function, you must save/restore LR
Lab1: PUSH {R4-R7,LR}
       // your solution goes here
        // I want to put the EID into a register, and get the length of it and save it in another register
        // start a counter
        // then, I would save the first value that R0 points at in another register and see if it's 0 
        // if 0, return -1 to R0
        // then check if it meets the required length
        // if it doesn't meet the required length, go to the next one instantly
        // if it does meet the required length, enter a loop where it compares ASCII letter with ASCII letter
        // before comparing ASCII letters, check if 0 (not ASCII 0). If 0, returns the counter number (basically index)
        // if not equal in ASCII, then go to the next index and start again

        // R1 will be EID register (pointer to the first value of the string array)
        // R2 will be other EID that we will compare to (pointer to the first value of the array on (index) postition)
        // R3 will be condition bit for isLength
        // R4 will be used to store ASCII letter at a given moment
        // R5 will be used for storing "random" numbers
        // R6 will be used for storing "random" numbers
        // R7 will be counter   
        
        // MAIN
        MOVS R7, #0
        LDR R1, =pEID // our EID

        mainLoop:
                BL isZero // finishes if zero
                BL isLength // checkes if correct length, if not, restarts main loop with modified R0
                //CMP R3, #0
                //BNE mainLoop // so it goes to the main loop if not the same length
                // changed to just going back to the main loop
                B compareEid
                B mainLoop


        isZero:
                LDR R2, [R0]
                CMP R2, #0
                BEQ finishNotEqual
                BX LR


        isLength: // test if it's the required length
                //MOVS R3, #0 // set condition bit to 0, if 1 then it will restart loop on the main code
                MOVS R5, #0 // current EID length
                MOVS R6, #7 // our EID length
                LDR R2, [R0]

                isLengthLoop:
                        LDRB R4, [R2] // GRAB CHAR
                        CMP R4, #0 // IS CHAR 0?
                        BEQ finishLengthLoop // IF CHAR 0, FINISH
                        ADDS R5, R5, #1 // EID LENGTH + 1
                        ADDS R2, R2, #1 // GO TO NEXT CHAR
                        B isLengthLoop
                
                finishLengthLoop:
                        CMP R5, R6 // IS R5 = R6?
                        BEQ exitLengthLoop // IF YES, CONTINUE AS NORMAL
                        ADDS R0, R0, #8 // went up 1 byte, to the next EID
                        //MOVS R3, #1 // set to 1 because failed to prove that it was the same length
                        ADDS R7, R7, #1 // add to the counter
                        B mainLoop // goes to mainloop and starts over
                
                exitLengthLoop:
                        BX LR // continues as normal



        compareEid:
                LDR R2, [R0]

                compareEidLoop:
                        LDRB R5, [R1] // char of our eid
                        LDRB R6, [R2] // char of other eid

                        CMP R5, #0
                        BEQ compareEidIsZero

                        CMP R5, R6
                        BNE compareEidNotEqual // if not 0, means that not equal, therefore invalid

                        // if neither, then
                        ADDS R1, R1, #1 // goes to the next char
                        ADDS R2, R2, #1
                        B compareEidLoop

                compareEidIsZero: // so if 0, then we found it!
                        MOVS R0, R7
                        B finish


                compareEidNotEqual: // if not equal, we didn't find it, go to next word.
                        ADDS R0, R0, #8
                        ADDS R7, R7, #1
                        LDR R1, =pEID
                        B mainLoop
        
        finishNotEqual:
                LDR R0,=-1 // could not put #-1
                B finish

        
        
        .align 2 
        pEID: .string "JPA2484"

        finish:

      POP  {R4-R7,PC} // return


        .align 2
        .global myClass
myClass: .long pAB123  // pointer to EID
         .long 95      // Score
         .long pXYZ1   // pointer to EID
         .long 96      // Score
         .long pAB5549 // pointer to EID
         .long 94      // Score
         .long 0       // null pointer means end of list
         .long 0
pAB123:  .string "AB123"
pXYZ1:   .string "XYZ1"
pAB5549: .string "AB5549"
        .end
