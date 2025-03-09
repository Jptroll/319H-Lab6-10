/* ECE319K_Lab4main.c
 * Traffic light FSM
 * ECE319H students must use pointers for next state
 * ECE319K students can use indices or pointers for next state
 * Put your names here or look silly
  */

//#include <cstdint>
#include <ti/devices/msp/msp.h>
#include "../inc/LaunchPad.h"
#include "../inc/Clock.h"
#include "../inc/UART.h"
#include "../inc/Timer.h"
#include "../inc/Dump.h"  // student's Lab 3
#include "ti/devices/msp/m0p/mspm0g350x.h"
#include <stdio.h>
#include <string.h>
// put both EIDs in the next two lines
const char EID2[] = "RY4896"; //  ;replace abc123 with your EID
const char EID1[] = "JPA2484"; //  ;replace abc123 with your EID
// Hint implement Traffic_Out before creating the struct, make struct match your Traffic_Out

// initialize all 6 LED outputs and 3 switch inputs
// assumes LaunchPad_Init resets and powers A and B

#define SG &FSM[0]
#define SY &FSM[1]
#define SR &FSM[2]
#define WG &FSM[3]
#define WY &FSM[4]
#define WR &FSM[5]
#define WW &FSM[6]
#define WR1 &FSM[7]
#define WO1 &FSM[8]
#define WR2 &FSM[9]
#define WO2 &FSM[10]
#define WR3 &FSM[11]

typedef struct State {
  uint32_t PBwest;
  uint32_t PBsouth;
  uint32_t PBwalk;
  uint32_t time;
  struct State *Next[8];
} State;

 State FSM[12] = {
  {1, 4, (1<<26), 200, {SG, SY, SG, SY, SY, SY, SY, SY}}, // SOUTH Green
  {2, 4, (1<<26), 50, {SR, SR, SR, SR, SR, SR, SR, SR}}, // SOUTH Yellow
  {4, 4, (1<<26), 100, {WG, WG, SG, WG, WW, WW, WW, WG}}, // SOUTH Red
  {4, 1, (1<<26), 200, {WG, WG, WY, WY, WY, WY, WY, WY}}, // WEST Green
  {4, 2, (1<<26), 50, {WR, WR, WR, WR, WR, WR, WR, WR}}, // WEST Yellow
  {4, 4, (1<<26), 100, {SG, WG, SG, SG, WW, WW, SG, WW}}, // WEST Red
  {4, 4, 0xC400000, 200, {WW, WR1, WR1, WR1, WW, WR1, WR1, WR1}}, // Walk White
  {4, 4, (1<<26), 50, {WO1, WO1, WO1, WO1, WO1, WO1, WO1, WO1}}, // Walk Red1
  {4, 4, 0, 50, {WR2, WR2, WR2, WR2, WR2, WR2, WR2, WR2}}, // Walk Off1
  {4, 4, (1<<26), 50, {WO2, WO2, WO2, WO2, WO2, WO2, WO2, WO2}}, // Walk Red2
  {4, 4, 0, 50, {WR3, WR3, WR3, WR3, WR3, WR3, WR3, WR3}}, // Walk Off2
  {4, 4, (1<<26), 100, {SG, WG, SG, WG, WW, WG, SG, SG}} // Walk Red3
 };



void Traffic_Init(void){ // assumes LaunchPad_Init resets and powers A and B
 // write this 
 IOMUX->SECCFG.PINCM[PB15INDEX] = 0x00040081;
 IOMUX->SECCFG.PINCM[PB16INDEX] = 0x00040081;
 IOMUX->SECCFG.PINCM[PB17INDEX] = 0x00040081;
 IOMUX->SECCFG.PINCM[PB0INDEX] = 0x00000081;
 IOMUX->SECCFG.PINCM[PB1INDEX] = 0x00000081;
 IOMUX->SECCFG.PINCM[PB2INDEX] = 0x00000081;
 IOMUX->SECCFG.PINCM[PB6INDEX] = 0x00000081;
 IOMUX->SECCFG.PINCM[PB7INDEX] = 0x00000081;
 IOMUX->SECCFG.PINCM[PB8INDEX] = 0x00000081;
 IOMUX->SECCFG.PINCM[PB22INDEX] = 0x00000081;
 IOMUX->SECCFG.PINCM[PB26INDEX] = 0x00000081;
 IOMUX->SECCFG.PINCM[PB27INDEX] = 0x00000081;
 GPIOB->DOE31_0 |= 0xC4001C7; // enables PB0-2, 6-8, 22, 26, 27 
}
/* Activate LEDs
* Inputs: west is 3-bit value to three east/west LEDs
*         south is 3-bit value to three north/south LEDs
*         walk is 3-bit value to 3-color positive logic LED on PB22,PB26,PB27
* Output: none
* - west =1 sets west green
* - west =2 sets west yellow
* - west =4 sets west red
* - south =1 sets south green
* - south =2 sets south yellow
* - south =4 sets south red
* - walk=0 to turn off LED
* - walk bit 22 sets blue color
* - walk bit 26 sets red color
* - walk bit 27 sets green color
* Feel free to change this. But, if you change the way it works, change the test programs too
* Be friendly*/
void Traffic_Out(uint32_t west, uint32_t south, uint32_t walk){
  //GPIOB->DOUT31_0 &= (walk + south + west<<6);
    GPIOB->DOUT31_0 &= ~(0xC4001C7);
    GPIOB->DOUT31_0 |= (walk | south | (west << 6));
}

/* Read sensors
 * Input: none
 * Output: sensor values
 * - bit 0 is west car sensor
 * - bit 1 is south car sensor
 * - bit 2 is walk people sensor
* Feel free to change this. But, if you change the way it works, change the test programs too
 */

uint32_t SouthInput, WestInput, WalkInput; // global input pins
uint32_t Traffic_In(void){
  SouthInput = ((uint32_t) (GPIOB->DIN31_0 & 1<<16)) >> 15;
  WestInput = ((uint32_t) (GPIOB->DIN31_0 & 1<<15)) >> 15;
  WalkInput = ((uint32_t) (GPIOB->DIN31_0 & 1<<17)) >> 15;
  return SouthInput + WestInput + WalkInput; // write this
}
// use main1 to determine Lab4 assignment
void Lab4Grader(int mode);
void Grader_Init(void);
int main1(void){ // main1
  Clock_Init80MHz(0);
  LaunchPad_Init();
  Lab4Grader(0); // print assignment, no grading
  while(1){
  }
}
// use main2 to debug LED outputs
// at this point in ECE319K you need to be writing your own test functions
// modify this program so it tests your Traffic_Out  function
int main2(void){ // main2
  Clock_Init80MHz(0);
  LaunchPad_Init();
  Grader_Init(); // execute this line before your code
  LaunchPad_LED1off();
  Traffic_Init(); // your Lab 4 initialization
  if((GPIOB->DOE31_0 & 0x20)==0){
    UART_OutString("access to GPIOB->DOE31_0 should be friendly.\n\r");
  }
  UART_Init();
  UART_OutString("Lab 4, Spring 2025, Step 1. Debug LEDs\n\r");
  UART_OutString("EID1= "); UART_OutString((char*)EID1); UART_OutString("\n\r");
  UART_OutString("EID2= "); UART_OutString((char*)EID2); UART_OutString("\n\r");
  while(1){
    // write code to test your Traffic_Out
    GPIOB->DOUT31_0 |= 0xC4001C7;
    if((GPIOB->DOUT31_0&0x20) == 0){
      UART_OutString("DOUT not friendly\n\r");
    }
  }
}
// use main3 to debug the three input switches
// at this point in ECE319K you need to be writing your own test functions
// modify this program so it tests your Traffic_In  function
int main3(void){ // main3
  uint32_t last=0,now;
  Clock_Init80MHz(0);
  LaunchPad_Init();
  Traffic_Init(); // your Lab 4 initialization
  Debug_Init();   // Lab 3 debugging
  UART_Init();
  __enable_irq(); // UART uses interrupts
  UART_OutString("Lab 4, Spring 2025, Step 2. Debug switches\n\r");
  UART_OutString("EID1= "); UART_OutString((char*)EID1); UART_OutString("\n\r");
  UART_OutString("EID2= "); UART_OutString((char*)EID2); UART_OutString("\n\r");

  while(1){
    now = Traffic_In(); // Your Lab4 input
    if(now != last){ // change
      UART_OutString("Switch= 0x"); UART_OutUHex(now); UART_OutString("\n\r");
      Debug_Dump(now);
    }
    last = now;
    Clock_Delay(800000); // 10ms, to debounce switch
  }
}
// use main4 to debug using your dump
// proving your machine cycles through all states
int main4(void){// main4
uint32_t input;
  Clock_Init80MHz(0);
  LaunchPad_Init();
  LaunchPad_LED1off();
  Traffic_Init(); // your Lab 4 initialization
 // set initial state
  Debug_Init();   // Lab 3 debugging
  UART_Init();
  __enable_irq(); // UART uses interrupts
  UART_OutString("Lab 4, Spring 2025, Step 3. Debug FSM cycle\n\r");
  UART_OutString("EID1= "); UART_OutString((char*)EID1); UART_OutString("\n\r");
  UART_OutString("EID2= "); UART_OutString((char*)EID2); UART_OutString("\n\r");
// initialize your FSM
  SysTick_Init();   // Initialize SysTick for software waits

  State *ptrState = &FSM[0]; // so it knows where to start...
  uint32_t hardCodedInput = 7;

  while(1){
      // 1) output depending on state using Traffic_Out
      // call your Debug_Dump logging your state number and output
      Traffic_Out(ptrState->PBwest, ptrState->PBsouth, ptrState->PBwalk);
      uint32_t currentData = ((ptrState - FSM) << 24) | (ptrState->PBwest << 16) | (ptrState->PBsouth << 8) | (ptrState->PBwalk);
      Debug_Dump(currentData);
      // 2) wait depending on state
      SysTick_Wait10ms(ptrState->time);
      // 3) hard code this so input always shows all switches pressed
      // 4) next depends on state and input
      ptrState = ptrState->Next[hardCodedInput]; 

  }
}
// use main5 to grade
int main(void){// main5
  Clock_Init80MHz(0);
  LaunchPad_Init();
  Grader_Init(); // execute this line before your code
  LaunchPad_LED1off();
  Traffic_Init(); // your Lab 4 initialization
// initialize your FSM
  SysTick_Init();   // Initialize SysTick for software waits
  // initialize your FSM
  Lab4Grader(1); // activate UART, grader and interrupts

  State* ptrState;
  ptrState = &FSM[0];
  while(1){
      // 1) output depending on state using Traffic_Out
      // call your Debug_Dump logging your state number and output
      // 2) wait depending on state
      // 3) input from switches
      // 4) next depends on state and input
      uint32_t currentInput = Traffic_In();
      //printf("West: %x; South: %x; Walk: %x\n", ptrState->PBwest, ptrState->PBsouth, ptrState->PBwalk);
      Traffic_Out(ptrState->PBwest, ptrState->PBsouth, ptrState->PBwalk);
      SysTick_Wait10ms(ptrState->time);
      ptrState = ptrState->Next[currentInput];

  }
}

